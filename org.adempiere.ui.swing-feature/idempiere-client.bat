@Echo off


@if not "%JAVA_HOME%" == "" goto JAVA_HOME_OK
@Set JAVA=java
@Echo JAVA_HOME is not set.
@Echo You may not be able to start the server
@Echo Set JAVA_HOME to the directory of your local 1.6 JDK.
goto START

:JAVA_HOME_OK
@Set JAVA=%JAVA_HOME%\bin\java


:START
@Echo =======================================
@Echo Starting idempiere Client ...
@Echo =======================================

FOR %%c in (plugins\org.eclipse.equinox.launcher_1.*.jar) DO set JARFILE=%%c

@Set VMOPTS=%VMOPTS% -Dorg.osgi.framework.bootdelegation=sun.security.ssl
@Set VMOPTS=%VMOPTS% -Dosgi.compatibility.bootdelegation=true
@Set VMOPTS=%VMOPTS% -Dosgi.framework.activeThreadType=normal
@Set VMOPTS=%VMOPTS% -Dosgi.noShutdown=true
@Set VMOPTS=%VMOPTS% -Dmail.mime.encodefilename=true
@Set VMOPTS=%VMOPTS% -Dmail.mime.decodefilename=true
@Set VMOPTS=%VMOPTS% -Dmail.mime.encodeparameters=true
@Set VMOPTS=%VMOPTS% -Dmail.mime.decodeparameters=true

@"%JAVA%" %VMOPTS% -jar %JARFILE% -application org.adempiere.ui.swing.client
