package br.com.db4.buskaza.model.equipamento.ejb;

import java.util.Collection;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Equipamento;

@Stateless
@LocalBinding(jndiBinding = EquipamentoBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class EquipamentoBean implements EquipamentoBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	public Collection<Equipamento> listarEquipamentos() {

		Query query = em.createNamedQuery("listarEquipamentos");
		return query.getResultList();
		
	}

}
