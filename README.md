# Demo MVC con Java, Jakarta Servlets y JSP

Aplicación Maven con las capas Modelo (`Usuario`), DAO (`UsuarioDAO`), Controlador (`UsuarioServlet`) y Vista (JSP). El DAO usa datos de ejemplo en memoria.

## Ejecutar

El entorno preparado incluye Maven 3.10.0 y Tomcat 10.1.61 dentro de `.runtime`. Desde PowerShell, en la raíz del proyecto, ejecuta:

```powershell
.\iniciar.ps1
```

El script compila el WAR, lo copia a Tomcat y mantiene el servidor activo en esa terminal. Abre `http://localhost:8080/demo-mvc/usuarios`. La página muestra los usuarios de ejemplo que entrega el DAO. Al terminar, detén Tomcat con `Ctrl+C`.

Si Tomcat ya está encendido y cambias el código, ejecuta `.\actualizar.ps1` en otra terminal. Compila y despliega la versión nueva; después recarga la página con `Ctrl+R`.

La raíz `http://localhost:8080/demo-mvc/` también redirige a la lista de usuarios. El proyecto usa Jakarta Servlet 6.0 y genera bytecode compatible con Java 11 para poder ejecutarlo con el JDK local incluido; también se puede compilar con el JDK 25 instalado.

cd "C:\Users\ESTUDIANTE\Documents\ChatGPT\Examen"
.\actualizar.ps1
