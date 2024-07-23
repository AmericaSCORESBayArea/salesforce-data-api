"""
This script is used upload a new RAML to the MuleSoft Exchange API and update the API Manager instance specification ONLY WHEN the RAML files have been updated.

Usage:
    python3 exchange-update.py ORGANIZATION_ID API_MANAGER_ENVIRONMENT_ID API_MANAGER_INSTANCE_ID CLIENT_ID CLIENT_SECRET

Args:
    organization_id (str): The organization ID.
    api_manager_environment_id (str): The API Manager environment ID.
    api_manager_instance_id (str): The API Manager instance ID.
    output_file (str): The output file name.
    client_id (str): The client ID.
    client_secret (str): The client secret.

Author: Aleksandr Molchagin
Date: 2024-07-22
"""

import requests
import os
import zipfile
import tempfile
import shutil
from fnmatch import fnmatch
import argparse

parser = argparse.ArgumentParser(description="Script to assign values for Salesforce Data API")
parser.add_argument('organization_id', type=str, help='The organization ID')
parser.add_argument('api_manager_environment_id', type=str, help='The API Manager environment ID')
parser.add_argument('api_manager_instance_id', type=str, help='The API Manager instance ID')
parser.add_argument('client_id', type=str, help='The client ID')
parser.add_argument('client_secret', type=str, help='The client secret')
args = parser.parse_args()

ORGANIZATION_ID = args.organization_id
ASSET_NAME = 'salesforce-data-api'
ASSET_VERSION = 'v1.3'
API_MANAGER_ENVIRONMENT_ID = args.api_manager_environment_id
API_MANAGER_INSTANCE_ID = args.api_manager_instance_id
OUTPUT_FILE = 'salesforce-data-api.zip'
CLIENT_ID = args.client_id
CLIENT_SECRET = args.client_secret


"""
                  ___                             ___  __        ______  ____    ______
 /'\_/`\         /\_ \                          /'___\/\ \__    /\  _  \/\  _`\ /\__  _\
/\      \  __  __\//\ \      __    ____    ___ /\ \__/\ \ ,_\   \ \ \L\ \ \ \L\ \/_/\ \/
\ \ \__\ \/\ \/\ \ \ \ \   /'__`\ /',__\  / __`\ \ ,__\\ \ \/    \ \  __ \ \ ,__/  \ \ \
 \ \ \_/\ \ \ \_\ \ \_\ \_/\  __//\__, `\/\ \L\ \ \ \_/ \ \ \_    \ \ \/\ \ \ \/    \_\ \__
  \ \_\\ \_\ \____/ /\____\ \____\/\____/\ \____/\ \_\   \ \__\    \ \_\ \_\ \_\    /\_____\
   \/_/ \/_/\/___/  \/____/\/____/\/___/  \/___/  \/_/    \/__/     \/_/\/_/\/_/    \/_____/


"""
def get_access_token():
    """
    Retrieves an access token from the authentication server.

    Returns:
        str: The access token.

    Raises:
        requests.HTTPError: If there is an HTTP error during the request.
    """
    auth_url = 'https://anypoint.mulesoft.com/accounts/api/v2/oauth2/token'
    auth_data = {
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET,
        'grant_type': 'client_credentials'
    }
    response = requests.post(auth_url, data=auth_data)
    response.raise_for_status()  # Raise exception for HTTP errors
    return response.json()['access_token']

def get_latest_asset_version(access_token):
    """
    Retrieves the latest version of our RAML asset from the Mulesoft Exchange API.

    Args:
        access_token (str): The access token for authentication.

    Returns:
        str or None: The latest version of the asset, or None if no versions are available.
    """
    headers = {
        'Authorization': f'Bearer {access_token}'
    }
    url = f'https://anypoint.mulesoft.com/exchange/api/v1/assets/{ORGANIZATION_ID}/{ASSET_NAME}'
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    asset_data = response.json()
    versions = asset_data.get('versions', [])
    if versions:
        latest_version = versions[0]['version']
        return latest_version
    return None

def download_asset(access_token, version):
    """
    Download the specified version of the RAML asset.

    Args:
        access_token (str): The access token for authentication.
        version (str): The version of the asset to download.

    Returns:
        str: The file path where the asset is saved, or None if there was an error.
    """

    url = f'https://anypoint.mulesoft.com/exchange/api/v1/assets/{ORGANIZATION_ID}/{ASSET_NAME}/{version}'
    headers = {'Authorization': f'Bearer {access_token}'}
    response = requests.get(url, headers=headers)
    if response.status_code != 200:
        print(f"Error fetching asset metadata: {response.status_code}")
        return None

    try:
        asset_data = response.json()
    except ValueError:
        print("Failed to parse JSON from response.")
        return None

    # Find the URL for the 'fat-raml' file
    file_url = None
    for file in asset_data.get('files', []):
        if file['classifier'] == 'raml':
            file_url = file['externalLink']
            break

    if not file_url:
        print("No 'raml' file found.")
        return None

    # Download the 'fat-raml' file
    headers = []
    response = requests.get(file_url, headers=headers)
    if response.status_code == 200:
        file_path = OUTPUT_FILE  # Update this path as needed
        # Write the file content to a file
        with open(file_path, "wb") as file:
            file.write(response.content)
        print(f"File downloaded and saved as {file_path}.")
        return file_path
    else:
        print(f"Error downloading file: {response.status_code}")
        return None
    
def upload_and_publish_asset(token, asset_file_path, new_version):
    """
    Uploads and publishes an asset to the MuleSoft Exchange API.

    Args:
        token (str): The access token for authentication.
        asset_file_path (str): The file path of the asset to be uploaded.
        new_version (str): The new version of the asset.

    Returns:
        int: 0 if the asset was successfully uploaded and published, -1 otherwise.
    """
    url = ' https://anypoint.mulesoft.com/exchange/api/v1/assets?limit=10&offset=1'

    headers = { 
        'Authorization': f'Bearer {token}'
    }
    # Prepare the multipart form data. We need to separate each part of the form with a boundary, and include the appropriate Content-Disposition for each part.
    multipart_data = {
        'organizationId': ('', ORGANIZATION_ID),
        'groupId': ('', ORGANIZATION_ID),
        'assetId': ('', 'salesforce-data-api'),
        'version': ('', new_version),
        'name': ('', 'Salesforce Data API - Mule Policies'),
        'classifier': ('', 'raml'),
        'apiVersion': ('', ASSET_VERSION),
        'main': ('', 'salesforce-data-api.raml'),
        'asset': ('new_salesforce-data-api.zip', open(asset_file_path, 'rb'), 'application/zip'),
    }

    files = {key: val for key, val in multipart_data.items()}
    
    try: 
        response = requests.post(url, files=files, headers=headers)
        response.raise_for_status()
    except requests.HTTPError as http_err:
        print('HTTP error occurred:', http_err)
        print(response.text)
        return -1


    files['asset'][1].close()

    if response.status_code >= 400:
        print(response.text)
        return -1
    
    return 0

def change_api_specification(new_version, access_token):
    """
    Updates the API instance specification with the given new version.

    Args:
        new_version (str): The new version of the API instance specification.
        access_token (str): The access token for authentication.

    Returns:
        bool: True if the API instance specification was updated successfully, False otherwise.
    """
    base_url = 'https://anypoint.mulesoft.com/apimanager/api/v1'
    headers = {
        'Authorization': f'Bearer {access_token}',
        'Content-Type': 'application/json'
    }

    update_data = {
        'assetVersion': new_version
    }

    put_url = f'{base_url}/organizations/{ORGANIZATION_ID}/environments/{API_MANAGER_ENVIRONMENT_ID}/apis/{API_MANAGER_INSTANCE_ID}'
    update_response = requests.patch(put_url, headers=headers, json=update_data)

    if update_response.status_code == 200:
        print("API instance specification updated successfully.")
        return True
    else:
        print("Failed to update API instance specification:", update_response.text)
        return False
    

"""
 __  __          ___                                 __    __                  __
/\ \/\ \        /\_ \                /'\_/`\        /\ \__/\ \                /\ \
\ \ \_\ \     __\//\ \    _____     /\      \     __\ \ ,_\ \ \___     ___    \_\ \    ____
 \ \  _  \  /'__`\\ \ \  /\ '__`\   \ \ \__\ \  /'__`\ \ \/\ \  _ `\  / __`\  /'_` \  /',__\
  \ \ \ \ \/\  __/ \_\ \_\ \ \L\ \   \ \ \_/\ \/\  __/\ \ \_\ \ \ \ \/\ \L\ \/\ \L\ \/\__, `\
   \ \_\ \_\ \____\/\____\\ \ ,__/    \ \_\\ \_\ \____\\ \__\\ \_\ \_\ \____/\ \___,_\/\____/
    \/_/\/_/\/____/\/____/ \ \ \/      \/_/ \/_/\/____/ \/__/ \/_/\/_/\/___/  \/__,_ /\/___/
                            \ \_\
                             \/_/
"""
def extract_zip_to_temp(zip_path):
    temp_dir = tempfile.mkdtemp()
    with zipfile.ZipFile(zip_path, 'r') as zip_ref:
        zip_ref.extractall(temp_dir)
    return temp_dir


def compare_files(file1_path, file2_path):
    with open(file1_path, 'rb') as f1, open(file2_path, 'rb') as f2:
        if f1.read() != f2.read():
            return False, "Contents differ"
    return True, None


def is_ignored(file, ignore_patterns):
    return any(fnmatch(file, pattern) for pattern in ignore_patterns)


def are_files_identical(file1, file2, ignore_list=None):
    if ignore_list is None:
        ignore_list = []
        
    dir1 = extract_zip_to_temp(file1)
    dir2 = extract_zip_to_temp(file2)

    files1 = {os.path.relpath(os.path.join(root, file), dir1): os.path.join(root, file)
              for root, dirs, files in os.walk(dir1) for file in files if not is_ignored(file, ignore_list)}
    files2 = {os.path.relpath(os.path.join(root, file), dir2): os.path.join(root, file)
              for root, dirs, files in os.walk(dir2) for file in files if not is_ignored(file, ignore_list)}

    all_keys = set(files1.keys()).union(files2.keys())
    differences = {}

    for key in all_keys:
        if key not in files1:
            differences[key] = "Missing in first zip"
        elif key not in files2:
            differences[key] = "Missing in second zip"
        else:
            identical, message = compare_files(files1[key], files2[key])
            if not identical:
                differences[key] = message

    shutil.rmtree(dir1)
    shutil.rmtree(dir2)
    
    if differences:
        return False, differences
    return True, "No differences found"

    
def zip_directory(folder_path, output_path):
    with zipfile.ZipFile(output_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        base_path = os.path.abspath(folder_path)
        print(f"Base path: {base_path}")
        for root, dirs, files in os.walk(folder_path):
            print(f"Walking through: {root}")
            for file in files:
                file_path = os.path.join(root, file)
                relative_path = os.path.relpath(file_path, base_path)
                zipf.write(file_path, relative_path)
                print(f"Adding file: {file_path} as {relative_path}")
            if not files and not dirs:
                relative_path = os.path.relpath(root, base_path)
                zipf.write(root, relative_path + '/')
                print(f"Adding empty directory: {relative_path}")


def increment_version(version_str):
    parts = version_str.split('.')
    
    if len(parts) == 3:
        parts[2] = str(int(parts[2]) + 1)
    elif len(parts) == 2:
        parts[1] = str(int(parts[1]) + 1)
    else:
        parts.append('1')
    
    new_version = '.'.join(parts)
    return new_version


"""
                                   ____                               __
 /'\_/`\            __            /\  _`\                  __        /\ \__
/\      \     __   /\_\    ___    \ \,\L\_\    ___   _ __ /\_\  _____\ \ ,_\
\ \ \__\ \  /'__`\ \/\ \ /' _ `\   \/_\__ \   /'___\/\`'__\/\ \/\ '__`\ \ \/
 \ \ \_/\ \/\ \L\.\_\ \ \/\ \/\ \    /\ \L\ \/\ \__/\ \ \/ \ \ \ \ \L\ \ \ \_
  \ \_\\ \_\ \__/.\_\\ \_\ \_\ \_\   \ `\____\ \____\\ \_\  \ \_\ \ ,__/\ \__\
   \/_/ \/_/\/__/\/_/ \/_/\/_/\/_/    \/_____/\/____/ \/_/   \/_/\ \ \/  \/__/
                                                                  \ \_\
                                                                   \/_/
"""
if __name__ == "__main__":
    try:
        print("=======================================")
        print("WELCOME TO THE RAML API EXCHANGE UPDATER")
        print("=======================================")
        print("1. Getting access token...")
        token = get_access_token()
        print("Access token received successfully.")
        print("2. Fetching latest asset version...")
        latest_version = get_latest_asset_version(token)
        print(f"Latest asset version: {latest_version}")
        print("3. Downloading asset...")
        download_asset(token, latest_version)
        print("Downloaded asset successfully.")
        print("4. Zipping the existing directory...")
        zip_directory('../src/main/resources/api', 'new_salesforce-data-api.zip')
        ignore_patterns = ['exchange.json', '.DS_Store']
        identical, details = are_files_identical("salesforce-data-api.zip", "new_salesforce-data-api.zip", ignore_list=ignore_patterns)
        if identical:
            print("Files are identical. No need to upload asset.")
            print("=======================================")
            print("  SUCCESS: Asset updated successfully")
            print("=======================================")
            exit(0)
        print("Files are not identical.")
        print(details)
        print("5. Uploading asset...")
        new_version = increment_version(latest_version)
        print(f"New version: {new_version}")
        code = upload_and_publish_asset(token, 'new_salesforce-data-api.zip', new_version)
        if code == 0:
            print("Asset uploaded successfully.")
        else:
            print("Failed to upload asset.")
            exit(1)
        print("6. Changing API specification of the proxy...")
        print(latest_version + " -> " + new_version)
        if change_api_specification(new_version, token):
            print("API specification updated successfully.")
        else:
            print("Failed to update API specification.")
            exit(1)
        print("=======================================")
        print("  SUCCESS: Asset updated successfully")
        print("=======================================")
    except Exception as e:
        print('Failed to execute the script:', str(e))
