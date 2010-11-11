package br.com.db4.buskaza.model.locatario.ejb;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Locatario;

/**
 * Session Bean implementation class LocadorBean
 */
@Stateless
@LocalBinding(jndiBinding = LocatarioBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class LocatarioBean implements LocatarioBeanLocal {

	@PersistenceContext
	EntityManager em;

	public Integer incluirLocatario(Locatario locatario) {

		em.persist(locatario);
		if(!em.contains(locatario))
        {
			locatario = em.merge(locatario);
        }
		
		return locatario.getCodigo();
	}

}
