package br.com.db4.buskaza.model.imovel.ejb;

import java.util.Iterator;
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

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.util.*;

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
	
	public void atualiza(Imovel imovel) {		
			em.merge(imovel);
		
	}

	public List<Imovel> buscarImovel(Imovel imovel, Integer codigoPais, Anuncio anuncio) { 
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
		
		c.add(Restrictions.gt("status", -1));
		
        if (imovel.getEstado() != null && imovel.getEstado().getCodigo()!= null && imovel.getEstado().getCodigo().length() > 0) {        
        	c.add(Restrictions.eq("estado.codigo", imovel.getEstado().getCodigo())); 
        } 
        
        if (imovel.getEquipamentos() != null && imovel.getEquipamentos().size() > 0) { 
        	Criteria joinEquipamento = c.createCriteria("equipamentos", JoinFragment.INNER_JOIN);	
        	joinEquipamento.add (Restrictions.in("codigo", UtilsCollections.listarPropriedadeInteger(imovel.getEquipamentos(),"codigo"))); 
        } 
        
        if (anuncio != null) { 
        	Criteria joinPeriodoAnuncio = c.createCriteria("anuncios", JoinFragment.INNER_JOIN);	
        	
        	joinPeriodoAnuncio.add (Restrictions.le("dataInicial" ,anuncio.getDataInicial()));
        	joinPeriodoAnuncio.add (Restrictions.ge("dataFinal" ,anuncio.getDataFinal()));
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
        
    	c.add(Restrictions.gt("status", -1)); //-1 são os excluídos, que não devem ser mostrados nunca mais
        
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
		
		 //-1 são os excluídos, que não devem ser mostrados nunca mais
		
		if(status > - 1)
			c.add(Restrictions.eq("status",status)); 
		else
			c.add(Restrictions.gt("status", -1));
			
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        
        
        return c.list();
	}
	
	
	public Imovel getImovel(Integer codigoImovel){
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
		
		Criteria joinFoto = c.createCriteria("fotos", JoinFragment.INNER_JOIN);
		
		c.add(Restrictions.eq("codigo",codigoImovel)); 
		
		c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		
		List<Imovel> result = c.list();
        
        return result.get(0);
        
		
	}
	
	public Integer alterarImovel(Imovel imovel){		
		if(!em.contains(imovel))
        {
			imovel = em.merge(imovel);
        }
		
		return imovel.getCodigo();
	}
	
	
}
