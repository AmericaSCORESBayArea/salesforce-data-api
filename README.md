# salesforce-data-api 📡

Our MuleSoft app is built to interact with Scores data in Salesforce database. It is a RESTful API that allows us to perform CRUD operations on Salesforce objects. We use Code Builder to build the app and CloudHub to deploy it.

---

![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/Salesforce_logo_basic.png)
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/ASBA_mule-API-logo.png)
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/ASBA_Scores-Apps.png)

[API Documentation](https://anypoint.mulesoft.com/exchange/portals/americascores-bayarea/6c091e72-50d1-49ac-b04d-ee5bb9bc9dbd/salesforce-data-api/minor/3.0/console/summary/) (in review 🚧)

[Postman Collection](https://github.com/AmericaSCORESBayArea/salesforce-data-api/blob/master/Scores%20-%20Salesforce%20Data%20API.postman_collection.json) (outdated 🚧)

[CloudHub Deployment](https://github.com/AmericaSCORESBayArea/salesforce-data-api/blob/master/cloudhub-deployment.md) (outdated 🚧)

---
# Development and Testing the app

For development and testing purposes, we can run the app using MuleSoft Code Builder.

**MuleSoft Code Builder** is a modern development environment designed to simplify and streamline the process of building and deploying integrations and APIs. It offers both *local* and *cloud-based* versions.

## Cloud-based setup

To access the **cloud-based** version, [login into account ](https://anypoint.mulesoft.com/login/) and click `Launch` button. It will connect you to a virtual environment where you can build and deploy your MuleSoft applications, similar to the local one.

## Local setup

In this document, we will focus more throughly on the **local** setup as it is faster and more stable. It takes more time to set up, but it is worth it in the long run.

### Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/download)
- [Anypoint Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.mule-dx-extension-pack)
- ~~[Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)~~
- ~~Java Development Kit (JDK) - instructions below~~

### Steps to run the app locally

Once you have installed the prerequisites, follow the steps below to run the app locally:

1. **Clone the git repository to your local machine.**
2. **Open the project in Visual Studio Code.**
3. **Create `local.properties` file in the `src/main/resources folder`.**

```properties
http.host=0.0.0.0
http.private.port=8091

sfdc.user=integrationuser@americascores.org.scoresqa
sfdc.url=https://americascoresbayarea--scoresqa.sandbox.my.salesforce.com/services/Soap/u/48.0
sfdc.tkn=
sfdc.password=

typeform.clientid=1234
typeform.clientsecret=1234
typeform.tkn=1234
    
```

Please note: 
- The `sfdc.tkn` and `sfdc.password` fields are sensitive. Please **contact the developers** to get the values.
- Production and Sandbox Salesforce URLs are different. The URL above is for the Sandbox environment.
- The `typeform.clientid`, `typeform.clientsecret`, and `typeform.tkn` fields are not used as we are moving away from Typeform. You can leave them as is.
4. **Add `-M-Denv=local` to Mule Runtime arguments to specify what environment you are running the app in.**

    1. Right-click on "Mule" extension (letter M) at the left sidebar.
    2. Click on the "Settings" icon (gear icon) at the top right corner of the extension window.
    3. Find "Mule: Runtime Arguments" and add `-M-Denv=local` to the list of arguments:
    
    
    `-M-Dmule.forceConsoleLog -M-Dmule.testingMode -M-XX:-UseBiasedLocking -M-Dfile.encoding=UTF-8 -M-XX:+UseG1GC -M-XX:+UseStringDeduplication -M-Dcom.ning.http.client.AsyncHttpClientConfig.useProxyProperties=true -M-Dmule.debugger.test.port=8000 -M-Dmule.debug.enable=true console0 -M-Denv=local`

5. ~~**Install Java Development Kit (JDK)**~~~~
    ~~1. Make sure you pre-installed Extenstion Pack for Java.~~
    ~~2. Open the Command Palette (Cmd+Shift+P or Ctrl+Shift+P) and type `Java: Install New JDK`.~~
    ~~3. Choose any version of JDK (tested on 21 and 8).~~
    ~~4. Follow the instructions to install Java.~~
    ~~5. Restart Visual Studio Code.~~

    
6. **Config Run and Debug settings**

    1. Click on the "Run and Debug" icon on the left sidebar.
    2. Click on "create a launch.json file" link (below the "Run and Debug" button).
    3. In the "Select debugger", choose "Mule Xml Debugger".
    4. Click "Run" button.

7. Verify that the app has started successfully.
8. Try the following request:
    
    ```http
    GET http://localhost:8091/api-internal/contacts?firstName=John&lastName=Doe
    ```


## Tips

- The API code is located in `src/main/mule/api` folder.
- Whenever anything freezes, just restart VS Code.
- When changing the code, you need to restart the app. Use stop button, then run button. Restart button doesn't work.