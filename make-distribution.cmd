@echo off
set FWDIR=%cd%
set DISTDIR=%FWDIR%\dist

cd %FWDIR%

:: Make directories
if exist %DISTDIR% del /f /s /q %DISTDIR%
md %DISTDIR%
md %DISTDIR%\lib
echo "Spark %VERSION%%GITREVSTRING% built for Hadoop %SPARK_HADOOP_VERSION%" > "%DISTDIR%\RELEASE"

:: Copy jars
pushd %FWDIR%\assembly\target\scala*
xcopy /s/i/y *assembly*hadoop*.jar %DISTDIR%\lib\
popd

pushd %FWDIR%\examples\target\scala*
xcopy /s/i/y spark-examples*.jar %DISTDIR%\lib\
popd

:: Copy example sources (needed for python and SQL)
md %DISTDIR%\examples\src\main
xcopy /s/i/y %FWDIR%\examples\src\main %DISTDIR%\examples\src\

:: Copy SPARK_HIVE
copy /y %FWDIR%\lib_managed\jars\datanucleus*.jar %DISTDIR%\lib\

:: Copy SqlServer jdbc support
copy /y %FWDIR%\lib\sqljdbc* %DISTDIR%\lib\

:: Copy license and ASF files
copy /y %FWDIR%\LICENSE %DISTDIR%
copy /y %FWDIR%\NOTICE %DISTDIR%

:: Copy CHANGES.txt
copy /y %FWDIR%\CHANGES.txt %DISTDIR%

:: Copy other things
mkdir %DISTDIR%\conf
copy /y %FWDIR%\conf\*.* %DISTDIR%\conf
copy /y %FWDIR%\conf\log4j.properties.template %DISTDIR%\conf\log4j.properties
copy /y %FWDIR%\conf\slaves %DISTDIR%\conf
copy /y %FWDIR%\README.md %DISTDIR%
xcopy /s/i/y %FWDIR%\bin %DISTDIR%\bin
xcopy /s/i/y %FWDIR%\python %DISTDIR%\python
xcopy /s/i/y %FWDIR%\sbin %DISTDIR%\sbin
xcopy /s/i/y %FWDIR%\ec2 %DISTDIR%\ec2

