# The used sonar-scanner image is used here as a base image in docker file that we will be working on
FROM newtmitch/sonar-scanner AS sonarqube_scan
# Here we are setting up a working directory to /usr/src. It is like using `cd /usr/src` command
# Copying all files from the project directory to our current location (/app) in image
# except patterns mention in .dockerignore
COPY . /usr/src
# Execution of example command. Here it is used to show a list of files and directories.
# It will be useful in later exercises in this tutorial. 
RUN ls -list
# To execute sonar-scanner we just need to run "sonar-scanner" in the image. 
# To pass Sonarqube parameter we need to add "-D"prefix to each as in the example below
RUN sonar-scanner \
    -Dsonar.host.url="http://localhost:9000" \
    -Dsonar.projectKey="sonar-scanner-node-app" \
    -Dsonar.projectName="Sonar Scanner Node App" \
    -Dsonar.projectVersion="1.0" \
    -Dsonar.qualitygate="NODE_APP Way" \
    -Dsonar.scm.provider="git" \
    -Dsonar.core.serverBaseURL="http://localhost:9000" \
    -Dsonar.sources="/usr/src" \
    -Dsonar.language="javascript" \
    -Dsonar.sourceEncoding="UTF-8" \
    -Dsonar.dynamicAnalysis="reuseReports" \
    -Dsonar.javascript.lcov.reportPaths="/usr/src/coverage/lcov.info"