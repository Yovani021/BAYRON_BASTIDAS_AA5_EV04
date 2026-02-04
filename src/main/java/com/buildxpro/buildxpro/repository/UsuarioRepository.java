package com.buildxpro.buildxpro.repository;

import com.buildxpro.buildxpro.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}


