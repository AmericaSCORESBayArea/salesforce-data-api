# salesforce-data-api

MuleSoft app to interact with Scores data in Salesforce

Interactive API specification can be found [here](https://anypoint.mulesoft.com/exchange/portals/americascores-bayarea/6c091e72-50d1-49ac-b04d-ee5bb9bc9dbd/salesforce-data-api/minor/3.0/console/summary/).

[Postman collection](https://github.com/AmericaSCORESBayArea/salesforce-data-api/blob/master/Scores%20-%20Salesforce%20Data%20API.postman_collection.json)

[CloudHub Deployment](https://github.com/AmericaSCORESBayArea/salesforce-data-api/blob/master/cloudhub-deployment.md)

## Running app locally in Anypoint Studio

1. Clone git repo and download code to your local machine.
2. Import project in Anypoint Studio.
3. Add the following runtime arguments in the Run/Debug configuration.
  - Right click on project > Run as > Mule application (configure)
  - Switch to "Arguments" tab
  - Append these to VM arguments "-Denv=sandbox -Druntime.decryptionkey=<placeholder>" (Contact one of the devs to get the runtime.decryptionkey)
  - Apply / Run
4. Verify that the app has started successfully.
5. Try out couple of requests from the Postman collection.
  
