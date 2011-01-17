package br.com.db4.buskaza.model.anuncio.ejb;

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

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.util.UtilsCollections;

@Stateless
@LocalBinding(jndiBinding = AnuncioBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class AnuncioBean implements AnuncioBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	
	public List<Anuncio> listarAnuncios(Integer usuarioProprietario){
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Anuncio.class); 
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);	
		
        if (usuarioProprietario != null && usuarioProprietario > 0) {  
        	Criteria criterioImovel = session.createCriteria(Imovel.class); 
        	
        	criterioImovel.add(Restrictions.eq("usuarioProprietario.codigo",usuarioProprietario));         	
        	List<Imovel> imoveis = criterioImovel.list();
        	
        	if(imoveis!= null && !imoveis.isEmpty()){
        		
        		c.add(Restrictions.in("imovel.codigo", UtilsCollections.listarPropriedadeInteger(imoveis,"codigo")));
        		
        	}else{
        		
        		return null;
        	}
        	
        } 
        
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return c.list(); 
	}
	
	
	public Anuncio getAnuncio(Integer codigoAnuncio){
		return em.find(Anuncio.class, codigoAnuncio);
	}

}