package br.com.db4.buskaza.model.foto.ejb;

import java.util.ArrayList;
import java.util.Collection;
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
import org.hibernate.criterion.Restrictions;
import org.hibernate.ejb.EntityManagerImpl;
import org.hibernate.sql.JoinFragment;
import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Foto;
import br.com.db4.buskaza.model.entity.Imovel;


@Stateless
@LocalBinding(jndiBinding = FotoBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class FotoBean implements FotoBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	public Foto alterarFoto(Foto foto){
				
		if(!em.contains(foto)){
			foto = em.merge(foto);
	    }
			
		return foto;
		
	}
	
	public List<Foto> listFotosImovel(Integer codigoImovel){
		
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Foto.class); 
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);	
		
		c.add(Restrictions.eq("imovel.codigo",codigoImovel)); 
		
		c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		
		List<Foto> fotos = c.list();
        
        return fotos;
	}
	
	public void excluirFoto(Foto foto){
		
		Query query = em.createQuery("DELETE FROM Foto where codigo="+foto.getCodigo());
		query.executeUpdate();
		
	}
	
	public Foto getFoto(Integer codigoFoto){
		return em.find(Foto.class, codigoFoto);
	}
}
