# salesforce-data-api

MuleSoft app to interact with Scores data in Salesforce

![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/Salesforce_logo_basic.png)
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/ASBA_mule-API-logo.png)
![](https://github.com/AmericaSCORESBayArea/scoreslabs/blob/main/images/ASBA_Scores-Apps.png)

Interactive API specification can be found [here](https://anypoint.mulesoft.com/exchange/portals/americascores-bayarea/6c091e72-50d1-49ac-b04d-ee5bb9bc9dbd/salesforce-data-api/minor/3.0/console/summary/).

[Postman collection](https://github.com/AmericaSCORESBayArea/salesforce-data-api/blob/master/Scores%20-%20Salesforce%20Data%20API.postman_collection.json)

[CloudHub Deployment](https://github.com/AmericaSCORESBayArea/salesforce-data-api/blob/master/cloudhub-deployment.md)

## Running app locally in Anypoint Studio

1. Clone git repo and download code to your local machine.
2. Import project in Anypoint Studio.
3. You'll need a local.properties to run the app locally (this file is added to the .gitignore list so shouldn't be committed/pushed to the remote repo)
   Copy src/main/resources/sandbox.properties file and paste it as local.properties file in the same folder.
5. Append the following properties in local.properties file - (Contact one of the devs to get the values)
    - sfdc.password=<value> 
    - sfdc.token=<value>
6. Add the following runtime arguments in the Run/Debug configuration.
    - Right click on project > Run as > Mule application (configure)
    - Switch to "Arguments" tab
    - Append these to VM arguments "-Denv=local"
    - Apply / Run
7. Verify that the app has started successfully.
8. Try out couple of requests from the Postman collection.
  
