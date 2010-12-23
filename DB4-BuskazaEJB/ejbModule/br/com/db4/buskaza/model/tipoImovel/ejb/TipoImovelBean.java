package br.com.db4.buskaza.model.tipoImovel.ejb;

import java.util.Collection;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.TipoImovel;

@Stateless
@LocalBinding(jndiBinding = TipoImovelBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class TipoImovelBean implements TipoImovelBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	public Collection<TipoImovel> listarTiposImovel() {
		Query query = em.createNamedQuery("listarTiposImovel");
		return query.getResultList();
	}

}
