$ErrorActionPreference = 'Stop'

$projectRoot = $PSScriptRoot
$tomcat = Join-Path $projectRoot '.runtime\run\apache-tomcat-10.1.61'
$maven = Join-Path $projectRoot '.runtime\apache-maven-3.10.0\bin\mvn.cmd'
$url = 'http://127.0.0.1:8080/demo-mvc/usuarios'

Push-Location $projectRoot
try {
    & $maven -B package
    if ($LASTEXITCODE -ne 0) {
        throw "Maven terminó con código $LASTEXITCODE."
    }

    Copy-Item -LiteralPath (Join-Path $projectRoot 'target\demo-mvc.war') `
        -Destination (Join-Path $tomcat 'webapps\demo-mvc.war') -Force

    # Tomcat comprueba cambios en los WAR periódicamente cuando autoDeploy está activo.
    Start-Sleep -Seconds 12
    $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 8
    if ($response.StatusCode -ne 200) {
        throw "Tomcat respondió con HTTP $($response.StatusCode)."
    }

    Write-Host 'Proyecto actualizado. Ahora recarga la página en el navegador (Ctrl+R).'
}
catch {
    Write-Error "No se pudo actualizar la aplicación: $($_.Exception.Message)"
    Write-Host 'Comprueba que Tomcat esté iniciado en el puerto 8080.'
    exit 1
}
finally {
    Pop-Location
}
