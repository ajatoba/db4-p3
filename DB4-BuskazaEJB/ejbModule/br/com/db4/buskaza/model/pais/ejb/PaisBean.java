package br.com.db4.buskaza.model.pais.ejb;

import java.util.Collection;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Pais;

/**
 * Session Bean implementation class PaisBean
 */
@Stateless
@LocalBinding(jndiBinding = PaisBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class PaisBean implements PaisBeanLocal {
	
	@PersistenceContext
	EntityManager em;

	public Collection<Pais> listarPaises() {
		
		Query query = em.createNamedQuery("listarPaises");
		return query.getResultList();
	}

   

}
