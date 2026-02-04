package com.buildxpro.buildxpro.service;

import com.buildxpro.buildxpro.model.Usuario;
import com.buildxpro.buildxpro.repository.UsuarioRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioService {

    private final UsuarioRepository repository;

    public UsuarioService(UsuarioRepository repository) {
        this.repository = repository;
    }

    public List<Usuario> listarUsuarios() {
        return repository.findAll();
    }

    public Usuario guardarUsuario(Usuario usuario) {
        return repository.save(usuario);
    }

    public Usuario actualizarUsuario(Long id, Usuario usuario) {
        Usuario existente = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        existente.setNombre(usuario.getNombre());
        existente.setApellido(usuario.getApellido());
        existente.setUsuario(usuario.getUsuario());
        existente.setCorreo(usuario.getCorreo());
        existente.setContrasena(usuario.getContrasena());
        existente.setRol(usuario.getRol());

        return repository.save(existente);
    }

    public void eliminarUsuario(Long id) {
        repository.deleteById(id);
    }
}





