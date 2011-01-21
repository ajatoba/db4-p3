package br.com.db4.buskaza.model.tipoanuncio.ejb;

import java.util.Collection;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.TipoAnuncio;

@Stateless
@LocalBinding(jndiBinding = TipoAnuncioBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class TipoAnuncioBean implements TipoAnuncioBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	public Collection<TipoAnuncio> listarTiposAnuncio() {
		Query query = em.createNamedQuery("listarTiposAnuncio");
		return query.getResultList();
	}

}
