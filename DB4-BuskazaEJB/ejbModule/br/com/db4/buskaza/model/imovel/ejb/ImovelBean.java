package br.com.db4.buskaza.model.imovel.ejb;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Imovel;


@Stateless
@LocalBinding(jndiBinding = ImovelBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ImovelBean implements ImovelBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	public Integer incluirImovel(Imovel imovel) {
		em.persist(imovel);
		if(!em.contains(imovel))
        {
			imovel = em.merge(imovel);
        }
		
		return imovel.getCodigo();

	}
	
	public void altualiza(Imovel imovel) {		
			em.merge(imovel);
		
	}

}
