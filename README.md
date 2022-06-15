# Description
This is a sample app to integrate the sonar-scanner with Jenkins CI/CD pipeline.

## Pre-requisite(s)

1. Docker should be be installed, up, and running.
2. Jenkins Server should be set up and running.
3. Sonar Scanner plugin should be installed and added in the Jenkins.

## Steps to bring up the sonarqube server using docker image
Step 1: Define services in a Compose file (path: <project_dir>/sonarqube-server)<br>
Step 2: Build and run your app with Compose:<br>
```
cd <project_dir>/sonarqube-server
docker-compose up -d
```

## Userful commands:
1. Check if the container is up and running. <br>
`Note:` Bringing up first time, if YES, it might take sometime to start the sonarqube server.
2. Command to check the running container:
```
docker ps
```

## Problem(s) faced during setup
1. Pull request sonarqube scan analysis was not working.<br>
`Resolution`: Since the used image of sonarqube server is a *communinty version* and the latest lts version does not come up with scan-github plugin. So, in order to make it work I have to explicitly add the `sonarqube-community-branch-plugin`. The same has been added under plugin folder.
2. The sonar-scanner was not working as expected.<br>
`Resolution`: The reason was sonar-scanner path was not set properly. Since sonar-scanner was added in the Jenkins so we need to get the absolute path of sonar-scanner within Jenkin's server or we must set the env variable.
3. Pull request -> Checks does not generate the sonar scanner analysis in the Github
`Reason`: No resolution found! During the research came to know that the free version of sonar-github plugin has bee removed and now, it comes with Developer edition. The `Developer Edition` gives us the 14 days trial. Though I have not tried setting this up.

## Steps to contribute
1. Fork the repository.<br>
2. Make the necessary changes for the identified/missing feature.<br>
3. Raise the PR<br>

## Note:
1. While refering to pipeline script we need to do the access token (gitaccess) set up within Jenkins Crendential Parameters else it won't work as expected.

## Contact:
For more details please drop a email to: servikash@gmail.com. I will be glad if I can help in someway.
