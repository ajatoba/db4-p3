package br.com.db4.buskaza.model.anuncio.ejb;

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
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.ejb.EntityManagerImpl;
import org.hibernate.sql.JoinFragment;
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
		c.addOrder(Order.desc("dataAnuncio"));
		
        if (usuarioProprietario != null && usuarioProprietario > 0) {  
        	Criteria criterioImovel = session.createCriteria(Imovel.class); 
        	
        	criterioImovel.addOrder(Order.desc("dataCadastro"));
        	
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
	
	public List<Anuncio> listarAnunciosImovel(Integer codigoImovel, int mes, int ano){
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
		c.addOrder(Order.desc("dataAnuncio"));
		
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
	
		
	public Integer incluirAnuncio(Anuncio anuncio) {
		em.persist(anuncio);
		if(!em.contains(anuncio))
        {
			anuncio = em.merge(anuncio);
        }
		
		return anuncio.getCodigo();

	}
	
	public void excluirAnuncio(Anuncio anuncio) {
		
		Anuncio anuncioR = getAnuncio(anuncio.getCodigo());
		em.remove(anuncioR);
	}
	
	public Anuncio getAnuncio(Integer codigoAnuncio){
		return em.find(Anuncio.class, codigoAnuncio);
	}
	
public boolean checkDisponibilidade(Imovel imovel, Anuncio anuncio){ 
		
		boolean disponivel = true;
		
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
		
		c.add(Restrictions.eq("imovel", imovel));
		
		c.add(Restrictions.le("dataInicial" ,anuncio.getDataInicial()));
		c.add(Restrictions.ge("dataFinal" ,anuncio.getDataFinal()));
        
        
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        
        if (c.list().size() > 0) {
			disponivel = false;
		}else {
			disponivel = true;
		}
        
        return disponivel; 
    } 
}
