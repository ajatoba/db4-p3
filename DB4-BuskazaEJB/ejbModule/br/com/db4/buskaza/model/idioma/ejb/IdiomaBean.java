package br.com.db4.buskaza.model.idioma.ejb;

import java.util.Collection;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Idioma;

/**
 * Session Bean implementation class PaisBean
 */
@Stateless
@LocalBinding(jndiBinding = IdiomaBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class IdiomaBean implements IdiomaBeanLocal {
	
	@PersistenceContext
	EntityManager em;

	public Collection<Idioma> listarIdiomas() {
		
		Query query = em.createNamedQuery("listarIdiomas");
		return query.getResultList();
	}

   

}
