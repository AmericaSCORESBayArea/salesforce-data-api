## Local setup ⚙️

In this document, we will focus more throughly on the **local** setup. 

It is faster, but might not work on every machine. At the moment, we were able to run the app only on macOS. 3 different Windows machines were tested, but none of them worked.

 If you have any issues, please use the [cloud-based setup](../README.md).

### Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/download)
- [Anypoint Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.mule-dx-extension-pack)

### Steps to run the app locally

Once you have installed the prerequisites, follow the steps below to run the app locally:

1. **Clone the git repository to your local machine.**
2. **Open the project in Visual Studio Code.**
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
4. **Add `-M-Denv=local` to Mule Runtime arguments to specify what environment you are running the app in.**

    1. Right-click on "Mule" extension (letter M) at the left sidebar.
    2. Click on the "Settings" icon (gear icon) at the top right corner of the extension window.
    3. Find "Mule: Runtime Arguments" and add `-M-Denv=local` to the list of arguments:
    
    
    `-M-Dmule.forceConsoleLog -M-Dmule.testingMode -M-XX:-UseBiasedLocking -M-Dfile.encoding=UTF-8 -M-XX:+UseG1GC -M-XX:+UseStringDeduplication -M-Dcom.ning.http.client.AsyncHttpClientConfig.useProxyProperties=true -M-Dmule.debugger.test.port=8000 -M-Dmule.debug.enable=true console0 -M-Denv=local`
    
5. **Config Run and Debug settings**

    1. Click on the "Run and Debug" icon on the left sidebar.
    2. Click on "create a launch.json file" link (below the "Run and Debug" button).
    3. In the "Select debugger", choose "Mule Xml Debugger".
    4. Click "Run" button.

6. Verify that the app has started successfully.
7. Try the following request:
    
    ```http
    GET http://localhost:8091/api-internal/contacts?firstName=John&lastName=Doe
    ```


## Tips

- The API code is located in `src/main/mule/api` folder.
- Whenever anything freezes, just restart VS Code.
- When changing the code, you need to restart the app. Use stop button, then run button. Restart button doesn't work.