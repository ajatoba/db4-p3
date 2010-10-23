package br.com.db4.buskaza.model.usuario.ejb;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Usuario;

@Local
public interface UsuarioBeanLocal {

	public static String LOCAL = "ejb/UsuarioBean/local";

	public Integer incluirUsuario(Usuario usuario);

	public Boolean existeLogin(String email);

}
