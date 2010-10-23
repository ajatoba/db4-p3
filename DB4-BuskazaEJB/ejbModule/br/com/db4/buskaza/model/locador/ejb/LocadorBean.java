package br.com.db4.buskaza.model.locador.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Locador;
import br.com.db4.buskaza.model.entity.Pessoa;

/**
 * Session Bean implementation class LocadorBean
 */
@Stateless
@LocalBinding(jndiBinding = LocadorBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class LocadorBean implements LocadorBeanLocal {

	@PersistenceContext
	EntityManager em;

	public Integer incluirLocador(Locador locador) {

		em.persist(locador);
		if(!em.contains(locador))
        {
			locador = em.merge(locador);
        }
		
		return locador.getCodigo();
	}

	public Boolean existeCNPJCPF(String cpfCnpj) {

		Query query = em.createQuery("select x from Pessoa x where x.cpfCnpj = :cpfCnpj ");
		query.setParameter("cpfCnpj", cpfCnpj);

		List<Pessoa> lista = query.getResultList();
		return (lista != null && lista.size() > 0);

	}

}
