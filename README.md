# salesforce-data-api 📡

Our core Mulesoft app was built to interact with Scores data in Salesforce database. In a few words, is a RESTful API server that allows us to perform CRUD operations on Salesforce objects. Yet we extend its functionality! 

---
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/Salesforce_logo_basic.png)
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/ASBA_mule-API-logo.png)
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/ASBA_Scores-Apps.png)

### 🕺  [Postman Collection (API Documentation)](https://github.com/AmericaSCORESBayArea/salesforce-data-api/blob/master/docs/Scores%20-%20Salesforce%20Data%20API.postman_collection.json)

---
## Development and Testing the app

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
-  Add `-M-Denv=local`, `-Duser.timezone=UTC` and `-M-Danypoint.platform.gatekeeper=disabled` to [Default Runtime Arguments](https://docs.mulesoft.com/anypoint-code-builder/ref-mule-settings)
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

## ☁️ What if I want to run a cloud instance?

1. Create [Anypoint Platform Account](https://anypoint.mulesoft.com/login/)
2. Go to [the main dashboard](https://anypoint.mulesoft.com/)
3. Under "Anypoint Code Builder", click `Get Started` button
4. Accept the terms and conditions (if you agree)
5. Click `Launch` button (if it's greyed out, refresh the page and wait)
6. Wait for the environment to get allocated and load. The first time it might take a while

## Anypoint Studio Project Setup Guide

Follow the steps below to set up and run the **salesforce-data-api** MuleSoft project in **Anypoint Studio**.


📅 1. Download Anypoint Studio

Download and install Anypoint Studio from the official site:

🔗  [Anypoint Studio](https://www.mulesoft.com/lp/dl/anypoint-mule-studio)


🧬 2. Clone the Repository
  Clone the repository:
   ```
   salesforce-data-api
   ```


🔀 3. Switch to Mule Perspective

Click on the **Mule Perspective** icon (next to Git) to switch your view for Mule development.

💠 4. Create `local.properties` File

Create a file named `local.properties` inside:

```
src/main/resources/properties/
```

Add the following configuration (get sandbox credentials from America SCORES team):

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

---
 ⚙️ 5. Configure Mule Runtime

1. Right-click the project → `Run As` → `Run Configurations...`
2. Create a new config under **Mule Applications**
3. Set project to launch: `salesforce-data-api`
4. Scroll down and click **Install Runtime**

   * Select and install: `Mule Server 4.6.X`
   * Restart Studio if prompted
5. Select the installed **Mule Server 4.6.X**
6. Click **Apply**

Add VM Arguments (under **Arguments** tab):

```text
-M-Denv=local
-Duser.timezone=UTC
-M-Danypoint.platform.gatekeeper=disabled
```

**Set Java Version (under **JRE** tab)**:

* Ensure Java **11 or 17+** is selected

Click **Apply** and close the config window.

☕ 6. Verify Runtime & Java Versions

* Mule Runtime: **4.6.X**
* Java: **11 or 17+**

If the Mule runtime is not 4.6.x, you can install the correct version during step 5.


🔐 7. Install Java (if not present)

Install Java from the official site:
🔗 [https://www.java.com/](https://www.java.com)

---

## 🗑️ 8. Generate Keystore and Certificate

Use your terminal or CMD to run the following command in the **project root directory**:

```bash
keytool -genkeypair -keystore keystore.jks \
  -dname "CN=localhost, OU=Unknown, O=America SCORES Bay Area, L=San Francisco, ST=California, C=US" \
  -keypass YOUR_KEYPASS_PASSWORD \
  -storepass YOUR_STOREPASS_PASSWORD \
  -keyalg RSA \
  -sigalg SHA256withRSA \
  -keysize 2048 \
  -alias mule \
  -ext SAN=DNS:localhost,IP:127.0.0.1 \
  -validity 9999
```

Then move the file:

```bash
mv keystore.jks src/main/resources/
```

> 🚩 If `keytool` fails, your Java setup may be incorrect. Ensure `JAVA_HOME` is set and Java is in the system path.

---

🔑 9. Add Keystore Passwords

In your `local.properties` file, add:

```properties
keystore.key.password=YOUR_KEYPASS_PASSWORD
keystore.password=YOUR_STOREPASS_PASSWORD
```

---

▶️ 10. Run the Project

Click the **Run** or **Debug** button in Anypoint Studio and let the app deploy 🎉
