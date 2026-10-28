$ErrorActionPreference = 'Stop'

$projectRoot = $PSScriptRoot
$tomcat = Join-Path $projectRoot '.runtime\run\apache-tomcat-10.1.61'
$jdk = Join-Path $projectRoot '.runtime\jdk11\jdk-11.0.32.1+1'
$maven = Join-Path $projectRoot '.runtime\apache-maven-3.10.0\bin\mvn.cmd'

if (-not (Test-Path -LiteralPath $tomcat)) {
    throw 'No se encontró Tomcat. Ejecuta este proyecto en el equipo donde se preparó el entorno.'
}

Push-Location $projectRoot
try {
    & $maven -B package
    if ($LASTEXITCODE -ne 0) {
        throw "Maven terminó con código $LASTEXITCODE."
    }

    Copy-Item -LiteralPath (Join-Path $projectRoot 'target\demo-mvc.war') `
        -Destination (Join-Path $tomcat 'webapps\demo-mvc.war') -Force

    $env:CATALINA_HOME = (Resolve-Path $tomcat).Path
    $env:CATALINA_BASE = $env:CATALINA_HOME
    $env:JAVA_HOME = (Resolve-Path $jdk).Path
    $env:JRE_HOME = $env:JAVA_HOME

    & (Join-Path $tomcat 'bin\catalina.bat') run
}
finally {
    Pop-Location
}
