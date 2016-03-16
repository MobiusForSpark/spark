set MAVEN_OPTS=-Xmx8g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m
mvn clean package -Pyarn -Dyarn.version=2.6.0 -Phadoop-2.6 -Phive -Phive-thriftserver -DskipTests

:: mvn install -pl streaming,assembly -Pyarn -Dyarn.version=2.6.0 -Phadoop-2.6 -Phive -Phive-thriftserver -DskipTests
