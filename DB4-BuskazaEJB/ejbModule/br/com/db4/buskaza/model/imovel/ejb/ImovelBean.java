package br.com.db4.buskaza.model.imovel.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.ejb.EntityManagerImpl;
import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Pais;


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

	public List<Imovel> buscarImovel(Imovel imovel) { 
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Imovel.class); 
        if (imovel.getEstado() != null) {        
        c.add(Restrictions.ilike("estado", imovel.getEstado())); 
        } 
        
        if (imovel.getEquipamentos() != null && imovel.getEquipamentos().size() > 0) { 
        c.add(Restrictions.in("equipamentos", imovel.getEquipamentos())); 
        } 
        if (imovel.getCapacidade() != 0) { 
        c.add(Restrictions.between("capacidade", new Integer(0), imovel.getCapacidade())); 
        } 
        return c.list(); 
    } 
	
}
