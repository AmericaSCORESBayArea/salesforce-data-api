import asyncio
import aiohttp
import json
import time

# ==============================================================
# HOW TO USE THIS SCRIPT FOR TESTING API ENDPOINTS CONCURRENTLY
# ==============================================================
#
# 1. **Setting Up the API URL**:
#    - Replace the `url` variable with the actual endpoint URL you want to test.
#    - Example: 
#      url = "https://api.example.com/enrollments"
#
# 2. **Headers**:
#    - Ensure the `headers` dictionary contains any necessary authentication/authorization headers required by the API.
#    - Common headers include:
#      - `'client_id'`: Your client ID or application key.
#      - `'client_secret'`: Your client secret or API key.
#      - `'Content-Type'`: Typically set to `'application/json'` if sending JSON data.
#
#    Example:
#      headers = {
#          'client_id': 'your-client-id',
#          'client_secret': 'your-client-secret',
#          'Content-Type': 'application/json'
#      }
#
# 3. **Request Payload**:
#    - Modify the `payload` variable to match the structure and data your API expects.
#    - For example, if testing an enrollment API, ensure fields like `TeamSeasonId`, `StudentId`, `StartDate`, and `EndDate` are populated with valid test data.
#
#    Example:
#      payload = json.dumps({
#          "TeamSeasonId": "12345",
#          "StudentId": "67890",
#          "StartDate": "2024-01-01",
#          "EndDate": "2024-12-31"
#      })
#
# 4. **Number of Requests**:
#    - The script sends 20 concurrent requests to the API (default).
#    - If you need to change the number of requests to test different loads, simply adjust the `number_of_requests` variable.
#
#    Example:
#      number_of_requests = 50  # Send 50 concurrent requests
#
# 5. **Running the Script**:
#    - Run the script to test the API. It will send requests concurrently and print out:
#      - The HTTP status code for each request.
#      - The response time for each request.
#      - The response body returned by the API.
#
# ================================================

number_of_requests = 10
url = "https://localhost:8091/api/enrollments"
headers = {
    'Content-Type': 'application/json'
}
payload = json.dumps(
    {
        "TeamSeasonId": "a0qUQ000003SRI5YAO",
        "StudentId": "003cX000009kPO1QAM",
        "StartDate": "2017-01-01",
        "EndDate": "2018-01-01"
    }
)

async def send_post_request(session, url, headers, payload, idx):
    start_time = time.time()
    print(f"Starting request {idx + 1} to {url}")
    try:
        async with session.post(url, headers=headers, data=payload) as response:
            elapsed_time = time.time() - start_time
            print(f"Completed request {idx + 1} to {url}")
            return await response.text(), response.status, elapsed_time
    except Exception as e:
        elapsed_time = time.time() - start_time
        print(f"Error in request {idx + 1}: {e}")
        return None, None, elapsed_time

async def main():
    connector = aiohttp.TCPConnector(ssl=False)  # Disable SSL verification
    timeout = aiohttp.ClientTimeout(total=60)  # Set timeout to 60 seconds
    async with aiohttp.ClientSession(connector=connector, timeout=timeout) as session:
        tasks = [send_post_request(session, url, headers, payload, idx) for idx in range(number_of_requests)]
        responses = await asyncio.gather(*tasks)
        
        for idx, (response_text, status_code, elapsed_time) in enumerate(responses):
            if response_text is not None:
                print(f"\nResponse from Request {idx + 1}:")
                print(f"Status Code: {status_code}")
                print(f"Time Taken: {elapsed_time:.2f} seconds")
                print(response_text)
            else:
                print(f"\nRequest {idx + 1} failed.")

start_total_time = time.time()

asyncio.run(main())

end_total_time = time.time()
print(f"\nTotal time for all requests to complete: {end_total_time - start_total_time:.2f} seconds")