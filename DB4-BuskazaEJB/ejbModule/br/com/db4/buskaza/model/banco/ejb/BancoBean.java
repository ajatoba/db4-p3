package br.com.db4.buskaza.model.banco.ejb;

import java.util.Collection;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Banco;

/**
 * Session Bean implementation class BancoBean
 */
@Stateless
@LocalBinding(jndiBinding = BancoBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class BancoBean implements BancoBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	public Collection<Banco> listarBancos() {		
		
		Query query = em.createNamedQuery("listarBancos");
		
        return query.getResultList();
	}


}
