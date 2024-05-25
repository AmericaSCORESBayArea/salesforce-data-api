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

Below we outline how to use the **cloud-based** version. If you want to setup the environment locally, you can check instructions [here](./docs/local_setup.md) (succesfully tested only on macOS).

## Cloud-based setup

To access the **cloud-based** version, [login into account ](https://anypoint.mulesoft.com/login/) and click `Launch` button. It will connect you to a virtual environment where you can build and deploy your MuleSoft applications, similar to the local one.

### I. Get your virtual instance

1. Create [Anypoint Platform Account](https://anypoint.mulesoft.com/login/).
2. Go to [the main dashboard](https://anypoint.mulesoft.com/).
3. Under "Anypoint Code Builder", click `Get Started` button.
4. Accept the terms and conditions (if you agree).
5. Click `Launch` button (if it's greyed out, refresh the page and wait).
6. Wait for the environment to get allocated and load. The first time it might take a while.

### II. Get the environment ready

1. **Clone the repository:**
    1. Click on the `Source Control` icon on the left sidebar.
    2. Click on the `Clone Repository` button.
    3. Select `Clone from GitHub` option (you will need you GitHub account later, so it's a preferred option).
    4. Choose the repository `AmericaSCORESBayArea/salesforce-data-api`.
    5. Click `Clone` button.
2. **Open the project.**
3. **Create `local.properties` file in the `src/main/resources/properties` folder.**

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

3. **Add `-M-Denv=local` to Mule Runtime arguments:**
    1. Right-click on "Mule" extension (letter M) at the left sidebar.
    2. Click on the "Settings" icon (gear icon) at the top right corner of the extension window.
    3. Find "Mule: Runtime Arguments" and add `-M-Denv=local` to the list of arguments:
    
    `-M-Dmule.forceConsoleLog -M-Dmule.testingMode -M-XX:-UseBiasedLocking -M-Dfile.encoding=UTF-8 -M-XX:+UseG1GC -M-XX:+UseStringDeduplication -M-Dcom.ning.http.client.AsyncHttpClientConfig.useProxyProperties=true -M-Dmule.debugger.test.port=8000 -M-Dmule.debug.enable=true console0 -M-Denv=local`

4. **Config Run and Debug settings.**

    1. Click on the "Run and Debug" icon on the left sidebar.
    2. Click on `create a launch.json file` link (below the "Run and Debug" button).
    3. In the "Select debugger", choose "Mule Xml Debugger".

5. **Install [Thunder Client extension](https://marketplace.visualstudio.com/items?itemName=rangav.vscode-thunder-client).**

    1. Click on the `Extensions` icon on the left sidebar.
    2. Search for `Thunder Client` and install it.

### III. Run the app

1. Click on the "Run" button.
2. Verify that the app has started successfully.
3. Try the following request using Thunder Client:
    
    ```http
    GET http://localhost:8091/api-internal/contacts?firstName=John&lastName=Doe
    ```

Ta-da! You are now running the Mule app in the cloud-based environment. 🚀

## Tips

- The API code is located in `src/main/mule/api` folder.
- When changing the code, you need to restart the app. Use stop button, then run button. Restart button doesn't work.
- If anything stops working as expected, you need to reboot the virtual instance:
    1. Click on [the Anypoint Code Builder dashboard](https://anypoint.mulesoft.com/codebuilder/)
    2. Select `Manage your IDE` option.
    3. Click on the `Reboot` button.