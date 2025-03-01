# salesforce-data-api 📡

Our core Mulesoft app was built to interact with Scores data in Salesforce database. In a few words, is a RESTful API server that allows us to perform CRUD operations on Salesforce objects. Yet we extend its functionality! 

---
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/Salesforce_logo_basic.png)
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/ASBA_mule-API-logo.png)
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/ASBA_Scores-Apps.png)

### 🕺  [Postman Collection (API Documentation)](https://github.com/AmericaSCORESBayArea/salesforce-data-api/blob/master/docs/Scores%20-%20Salesforce%20Data%20API.postman_collection.json)

---
# Development and Testing the app

For development and testing purposes, we have 2 IDEs:
1) [Anypoint Code Builder](https://www.mulesoft.com/platform/api/anypoint-code-builder) (based on VS Code)
2) [Anypoint Studio](https://www.mulesoft.com/platform/studio) (based on Eclipse)

Code Builder is supposed to replace the Studio IDE, but it is still missing some functionality that would make development simpler. For small fixes, we use Code Builder. For adding new flows or introducing major changes, we use Anypoint Studio. Since anything can be achieved in either IDE, setting up just one should be sufficient.

Note: Code Builder offers both *local* and *cloud-based* versions. 

## Anypoint Code Builder Setup (based on local version)

1. Download [VS Code](https://code.visualstudio.com/)
2. Install [Mulesoft Extenssion Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.mule-dx-extension-pack)
3. Clone the repository and open the folder 
4. Create `local.properties` file in the `src/main/resources/properties` folder (reach out to someone from America SCORES to get Sandbox properties):
```properties
http.listener.host=0.0.0.0
http.listener.port=8091
fullDomain=0.0.0.0:8091

api.id=
keystore.key.password=
keystore.password=
 
sfdc.user=
sfdc.url=
sfdc.tkn=
sfdc.password=

typeform.clientid=
typeform.clientsecret=
typeform.tkn=

slack.enabled=
slack.client_id=
slack.client_secret=    
```

5. Configure Runtime
-  Add `-M-Denv=local` and `-M-Danypoint.platform.gatekeeper=disabled` to [Default Runtime Arguments](https://docs.mulesoft.com/anypoint-code-builder/ref-mule-settings)
-  Select Mule and Java versions 
(click on any xml file in `src/main/mule` -> "Set Versions" button should appear; if not, right-click on any xml file in `src/main/mule` and select `Project Properties`). At the moment, we use Mule 4.6.X and Java 17
6. Install Java seperately (depends on the system, visit https://www.java.com)
7. Using terminal, generate the a new key pair (public and private keys) and a self-signed certificate (required for HTTPS, even for local) AND move it to `./src/main/resources` folder:
```
keytool -genkeypair -keystore keystore.jks \
  -dname "CN=localhost, OU=Unknown, O=America SCORES Bay Area, L=San Francisco, ST=California, C=US" \
  -keypass $YOUR_KEYPASS_PASSWORD$ \
  -storepass $YOUR_STOREPASS_PASSWORD$ \
  -keyalg RSA \
  -sigalg SHA256withRSA \
  -keysize 2048 \
  -alias mule \
  -ext SAN=DNS:localhost,IP:127.0.0.1 \
  -validity 9999

mv keystore.jks `/src/main/resources`
```
8. Add `$YOUR_KEYPASS_PASSWORD$` and `$YOUR_STOREPASS_PASSWORD$` to the `local.properties` file into `keystore.key.password` and 
`keystore.password` fields

9. Run the project using VS Code Start button (`Debug Mule Application`). Ta-da! 🚀

### ☁️ What if I want to run a cloud instance?

1. Create [Anypoint Platform Account](https://anypoint.mulesoft.com/login/)
2. Go to [the main dashboard](https://anypoint.mulesoft.com/)
3. Under "Anypoint Code Builder", click `Get Started` button
4. Accept the terms and conditions (if you agree)
5. Click `Launch` button (if it's greyed out, refresh the page and wait)
6. Wait for the environment to get allocated and load. The first time it might take a while

## Anypoint Studio Setup

1. Download [Anypoint Studio](https://www.mulesoft.com/lp/dl/anypoint-mule-studio)
2. Clone the repository and import the folder (`salesfroce-data-api`) WITHOUT copying the content to Studio's workspace
3. Create `local.properties` file in the `src/main/resources/properties` folder (reach out to someone from America SCORES to get Sandbox properties):
```properties
http.listener.host=0.0.0.0
http.listener.port=8091
fullDomain=0.0.0.0:8091

api.id=
keystore.key.password=
keystore.password=
 
sfdc.user=
sfdc.url=
sfdc.tkn=
sfdc.password=

typeform.clientid=
typeform.clientsecret=
typeform.tkn=

slack.enabled=
slack.client_id=
slack.client_secret=    
```

5. Configure Runtime
- Right click on the project and select "Run As" -> "Run Configurations..."
- Create a new configuration under "Mule Applications"
- Select the project to launch: `salesforce-data-api`
- Scroll down, click "Install Runtime" and install `Mule Server 4.6.X`. Once installed and the Studio is restarted (you can trace progress at the right bottom), go back to the menu and select the correct Mule server
- Click "Apply"
- Switch to 'Arguments' and  add `-M-Denv=local` and `-M-Danypoint.platform.gatekeeper=disabled` to VM arguments
- Click "Apply"
- Switch to 'JRE' and make sure that 17+ version is selected
- Close configurations window

6. Install Java seperately (depends on the system, visit https://www.java.com)
7. Using terminal, generate the a new key pair (public and private keys) and a self-signed certificate (required for HTTPS, even for local) AND move it to `./src/main/resources` folder:
```
keytool -genkeypair -keystore keystore.jks \
  -dname "CN=localhost, OU=Unknown, O=America SCORES Bay Area, L=San Francisco, ST=California, C=US" \
  -keypass $YOUR_KEYPASS_PASSWORD$ \
  -storepass $YOUR_STOREPASS_PASSWORD$ \
  -keyalg RSA \
  -sigalg SHA256withRSA \
  -keysize 2048 \
  -alias mule \
  -ext SAN=DNS:localhost,IP:127.0.0.1 \
  -validity 9999

mv keystore.jks `/src/main/resources`
```
8. Add `$YOUR_KEYPASS_PASSWORD$` and `$YOUR_STOREPASS_PASSWORD$` to the `local.properties` file into `keystore.key.password` and 
`keystore.password` fields

9. Run the project using the run or debug buttons. Ta-da! 🚀