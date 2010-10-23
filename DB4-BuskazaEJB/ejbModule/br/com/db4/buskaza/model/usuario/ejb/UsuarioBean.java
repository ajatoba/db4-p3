package br.com.db4.buskaza.model.usuario.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Pessoa;
import br.com.db4.buskaza.model.entity.Usuario;

/**
 * Session Bean implementation class UsuarioBean
 */
@Stateless
@LocalBinding(jndiBinding = UsuarioBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class UsuarioBean implements UsuarioBeanLocal {

	@PersistenceContext
	EntityManager em;

	public Integer incluirUsuario(Usuario usuario) {

		em.merge(usuario);
		return null;
	}

	public Boolean existeLogin(String email) {

		Query query = em
				.createQuery("select x from Pessoa x where x.email = :email ");
		query.setParameter("email", email);

		List<Pessoa> lista = query.getResultList();
		return (lista != null && lista.size() > 0);
	}

}
