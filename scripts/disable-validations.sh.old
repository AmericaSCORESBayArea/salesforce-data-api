#!/bin/bash

# This script updates the disableValidations attribute in global.xml.anypoint
#
# Author: Aleksandr Molchagin
# Date: 2024-07-31


FILE_PATH="../src/main/mule/global.xml.anypoint"

# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
  echo "File '$FILE_PATH' does not exist."
  exit 1
fi

# Update the disableValidations attribute
sed -i.bak 's/disableValidations="false"/disableValidations="true"/' "$FILE_PATH"

echo "Updated disableValidations attribute to true in '$FILE_PATH'. A backup of the original file is saved as '$FILE_PATH.bak'."
