<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ofi.modelo.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios MVC</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        table { border-collapse: collapse; width: 50%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
    </style>
</head>
<body>
    <h2>Usuarios del Sistema (Patrón MVC)</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
        </tr>
        <% List<Usuario> usuarios = (List<Usuario>) request.getAttribute("lista");
           if (usuarios != null) {
               for (Usuario usuario : usuarios) { %>
        <tr>
            <td><%= usuario.getId() %></td>
            <td><%= usuario.getNombre() %></td>
        </tr>
        <%     }
           } else { %>
        <tr><td colspan="2">No hay datos. Ingresa desde /usuarios</td></tr>
        <% } %>
    </table>
</body>
</html>
