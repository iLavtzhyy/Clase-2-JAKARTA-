package com.ofi.dao;

import com.ofi.modelo.Usuario;
import java.util.ArrayList;
import java.util.List;

/** Proporciona datos de ejemplo; aquí se conectaría una base de datos real. */
public class UsuarioDAO {
    public List<Usuario> obtenerUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        usuarios.add(new Usuario(1, "Ana Pérez"));
        usuarios.add(new Usuario(2, "Carlos Gómez"));
        usuarios.add(new Usuario(3, "María López"));
        return usuarios;
    }
}
