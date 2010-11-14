package br.com.db4.buskaza.model.estado.ejb;

import java.util.Collection;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Estado;

/**
 * Session Bean implementation class EstadoBean
 */
@Stateless
@LocalBinding(jndiBinding = EstadoBeanLocal.LOCAL)
public class EstadoBean implements EstadoBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	public Collection<Estado> listarEstados() {
		
		Query query = em.createNamedQuery("listarEstados");
		return query.getResultList();
	}

}
