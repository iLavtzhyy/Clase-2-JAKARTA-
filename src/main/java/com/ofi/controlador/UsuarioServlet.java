package com.ofi.controlador;

import com.ofi.dao.UsuarioDAO;
import com.ofi.modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/usuarios")
public class UsuarioServlet extends HttpServlet {
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Usuario> listaUsuarios = usuarioDAO.obtenerUsuarios();
        request.setAttribute("lista", listaUsuarios);
        request.getRequestDispatcher("/WEB-INF/vistas/usuarios.jsp").forward(request, response);
    }
}
