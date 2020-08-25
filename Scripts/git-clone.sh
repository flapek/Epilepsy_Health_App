#!/bin/bash
REPOSITORIES=(Epilepsy_Health_App.APIGateway Epilepsy_Health_App.Services.Identity)

cd ../..

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Cloning the repository: $REPOSITORY
	 echo ========================================================
	 REPO_URL=https://github.com/flapek/$REPOSITORY.git
	 git clone $REPO_URL
	 cd $REPOSITORY && cd ..
done

cd ./Epilepsy_Health_App/Scripts