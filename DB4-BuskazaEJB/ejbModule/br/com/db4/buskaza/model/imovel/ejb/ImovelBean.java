package br.com.db4.buskaza.model.imovel.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.CacheMode;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.ejb.EntityManagerImpl;
import org.hibernate.sql.JoinFragment;
import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.util.UtilsCollections;


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
			System.out.println("ejb - VOU ALTERAR");
			imovel = em.merge(imovel);
			System.out.println("ejB - ALTERAR");
        }
		
		return imovel.getCodigo();

	}
	
	public void altualiza(Imovel imovel) {		
			em.merge(imovel);
		
	}

	public List<Imovel> buscarImovel(Imovel imovel, Integer codigoPais) { 
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Imovel.class); 
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);	
		
        if (imovel.getEstado() != null && imovel.getEstado().getCodigo()!= null && imovel.getEstado().getCodigo().length() > 0) {        
        	c.add(Restrictions.eq("estado.codigo", imovel.getEstado().getCodigo())); 
        } 
        
        if (imovel.getEquipamentos() != null && imovel.getEquipamentos().size() > 0) { 
        	Criteria joinEquipamento = c.createCriteria("equipamentos", JoinFragment.INNER_JOIN);	
        	joinEquipamento.add (Restrictions.in("codigo", UtilsCollections.listarPropriedadeInteger(imovel.getEquipamentos(),"codigo"))); 
        } 
        
        
        if (imovel.getCapacidade() != 0) { 
        	c.add(Restrictions.between("capacidade", new Integer(0), imovel.getCapacidade())); 
        } 
        
        if (codigoPais != null && codigoPais > 0) {  
        	
    		Query query = em.createQuery("select x from br.com.db4.buskaza.model.entity.Estado x where x.pais.codigo = :id_pais");
    		query.setParameter("id_pais",codigoPais);
    		
    		List estados = query.getResultList();
    		
    		if(estados != null && estados.size() > 0){
    			Criteria estadoPais = c.createCriteria("estado", JoinFragment.INNER_JOIN);	
        		estadoPais.add(Restrictions.in("codigo",UtilsCollections.listarPropriedadeString(estados, "codigo"))); 
            } else
            {
            	return null;
            }
    	}        
        
        if (imovel.getMunicipio() != null && imovel.getMunicipio().length() > 0) {        
        	c.add(Restrictions.like("municipio", imovel.getMunicipio(),MatchMode.ANYWHERE)); 
        } 
        
        if (imovel.getBairro() != null && imovel.getBairro().length() > 0) {        
        	c.add(Restrictions.like("bairro", imovel.getBairro(),MatchMode.ANYWHERE)); 
        }
        
        if (imovel.getQuartos() > 0 ) {        
        	c.add(Restrictions.eq("quartos", imovel.getQuartos())); 
        }
        
        if (imovel.getMetragem() > 0 ) {        
        	c.add(Restrictions.eq("metragem", imovel.getMetragem())); 
        }
        
        	
        if (imovel.getTarifaMensal() > 0 ) {        
        	c.add(Restrictions.eq("tarifaMensal", imovel.getTarifaMensal())); 
        } 
        	
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return c.list(); 
    } 
	
	public List<Imovel> listarImoveis(Integer usuarioProprietario){
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Imovel.class); 
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);	
		
        if (usuarioProprietario != null && usuarioProprietario > 0) {        
        	c.add(Restrictions.eq("usuarioProprietario.codigo",usuarioProprietario)); 
        } 
        
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return c.list(); 
	}
	
	public List<Imovel> listarImoveisPorStatus(int status){
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Imovel.class); 
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);	
		
        if (status > 0) {        
        	c.add(Restrictions.eq("status",status)); 
        } 
        
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return c.list(); 
	}
	
	
	public Imovel getImovel(Integer codigoImovel){
		return em.find(Imovel.class, codigoImovel);
	}
	
	public Integer alterarImovel(Imovel imovel){		
		if(!em.contains(imovel))
        {
			imovel = em.merge(imovel);
        }
		
		return imovel.getCodigo();
	}
	
	
}
