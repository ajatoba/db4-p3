package br.com.db4.buskaza.model.tipoPagamento.ejb;

import java.util.Collection;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.TipoPagamento;


@Stateless
@LocalBinding(jndiBinding = TipoPagamentoBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)

public class TipoPagamentoBean implements TipoPagamentoBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	public Collection<TipoPagamento> listarTiposPagamento(){
		Query query = em.createNamedQuery("listarTiposPagamento");
		return query.getResultList();
		
	}
}
