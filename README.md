# Epilepsy_Health_App

## Which repositories should I clone?
Please clone the following repositories and put them into the same working directory:
- [Epilepsy_Health_App](https://github.com/flapek/Epilepsy_Health_App)
- [Epilepsy_Health_App.APIGateway](https://github.com/flapek/Epilepsy_Health_App.APIGateway)
- [Epilepsy_Health_App.Services.Identity](https://github.com/flapek/Epilepsy_Health_App.Services.Identity)

The above repositories can be also cloned and commit via [scripts](https://github.com/flapek/Epilepsy_Health_App/tree/master/Scripts).

## How to start the solution?
Open `Epilepsy_Health_App/compose` directory and execute:

```
docker-compose -f infrastructure.yml up -d
```

It will start the required infrastructure in the background. Then, you can start the services independently of each other via `dotnet run` or `./scripts/start.sh` command in each microservice repository or run them all at once using Docker:

```
docker-compose -f services-local.yml up
```

## How to stop the solution?
Open `Epilepsy_Health_App/compose` directory and execute:

```
docker-compose -f infrastructure.yml down
```

It will stop infrastructure. Then, you can stop services:

```
docker-compose -f services-local.yml down
```

## What HTTP requests can be sent to the API?
You can find the list of all HTTP requests in [Epilepsy_Health_App-sample-scenario.rest](https://github.com/flapek/Epilepsy_Health_App.APIGateway/blob/master/Epilepsy_Health_App-sample-scenario.rest) file placed in the root folder of Epilepsy_Health_App.APIGateway repository. This file is compatible with [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) plugin for [Visual Studio Code](https://code.visualstudio.com/).