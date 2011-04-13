package br.com.db4.buskaza.model.bloqueio.ejb;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.CacheMode;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Restrictions;
import org.hibernate.ejb.EntityManagerImpl;
import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.anuncio.ejb.AnuncioBeanLocal;
import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Bloqueio;
import br.com.db4.buskaza.model.entity.Imovel;

@Stateless
@LocalBinding(jndiBinding = BloqueioBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class BloqueioBean implements BloqueioBeanLocal {

@PersistenceContext
EntityManager em;
	
public Integer incluirBloqueio(Bloqueio bloqueio) {
	em.persist(bloqueio);
	if(!em.contains(bloqueio))
    {
		bloqueio = em.merge(bloqueio);
    }
	
	return bloqueio.getCodigo();

}


public boolean checkBloqueios(Imovel imovel, Bloqueio bloqueio){ 
		
		boolean disponivel = true;
		
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Bloqueio.class); 
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);
		
		c.add(Restrictions.eq("imovel", imovel));
		
		c.add(Restrictions.le("dataInicial" ,bloqueio.getDataInicial()));
		c.add(Restrictions.ge("dataFinal" ,bloqueio.getDataFinal()));
        
        
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        
        if (c.list().size() > 0) {
			disponivel = false;
		}else {
			disponivel = true;
		}
        
        return disponivel; 
    }

public List<Bloqueio> listarBloqueiosImovel(Integer codigoImovel, int mes, int ano){
	Session session;  
	if (em.getDelegate() instanceof EntityManagerImpl) {  
	    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
	    session = entityManagerImpl.getSession();  
	} else {  
	    session = (Session) em.getDelegate();  
	}
	
	Criteria c = session.createCriteria(Bloqueio.class); 
	c.setCacheable(true);
	c.setCacheMode(CacheMode.NORMAL);	
	
    if (codigoImovel!= null && codigoImovel > 0) {        
    	c.add(Restrictions.eq("imovel.codigo",codigoImovel)); 
    } 
    
    if (mes > 0 && ano >0) {        
    	c.add(Restrictions.between("dataInicial", new Date(ano-1900,mes-1,1), new Date(ano-1900,mes-1,31))); 
    	c.add(Restrictions.between("dataFinal", new Date(ano-1900,mes-1,1), new Date(ano-1900,mes-1,31)));
    } 
    
    c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
    return c.list(); 
}

}
