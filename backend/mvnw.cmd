@echo off
SET MAVEN_PROJECTBASEDIR=%~dp0
SET WRAPPER_JAR=%MAVEN_PROJECTBASEDIR%.mvn\wrapper\maven-wrapper.jar
SET WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain
SET DOWNLOAD_URL=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar

if not exist %WRAPPER_JAR% (
    echo Downloading Maven Wrapper...
    if not exist %MAVEN_PROJECTBASEDIR%.mvn\wrapper mkdir %MAVEN_PROJECTBASEDIR%.mvn\wrapper
    powershell -Command "& {(New-Object Net.WebClient).DownloadFile('%DOWNLOAD_URL%', '%WRAPPER_JAR%')}"
)

java -cp %WRAPPER_JAR% %WRAPPER_LAUNCHER% %*
