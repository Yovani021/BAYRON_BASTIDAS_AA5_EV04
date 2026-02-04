package com.buildxpro.buildxpro.controller;

import com.buildxpro.buildxpro.model.Usuario;
import com.buildxpro.buildxpro.service.UsuarioService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    private final UsuarioService service;

    public UsuarioController(UsuarioService service) {
        this.service = service;
    }

    // ✅ GET - listar usuarios
    @GetMapping
    public List<Usuario> listarUsuarios() {
        return service.listarUsuarios();
    }

    // ✅ POST - crear usuario
    @PostMapping
    public Usuario crearUsuario(@RequestBody Usuario usuario) {
        return service.guardarUsuario(usuario);
    }

    // ✅ PUT - actualizar usuario
    @PutMapping("/{id}")
    public Usuario actualizarUsuario(
            @PathVariable Long id,
            @RequestBody Usuario usuario) {
        return service.actualizarUsuario(id, usuario);
    }

    // ✅ DELETE - eliminar usuario
    @DeleteMapping("/{id}")
    public void eliminarUsuario(@PathVariable Long id) {
        service.eliminarUsuario(id);
    }
}










