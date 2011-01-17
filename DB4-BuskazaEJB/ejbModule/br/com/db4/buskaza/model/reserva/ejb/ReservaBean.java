package br.com.db4.buskaza.model.reserva.ejb;

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

import br.com.db4.buskaza.model.entity.Reserva;

@Stateless
@LocalBinding(jndiBinding = ReservaBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ReservaBean implements ReservaBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	
	public List<Reserva> listarReservas(Integer usuarioProprietario){
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Reserva.class); 
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);	
		
        if (usuarioProprietario != null && usuarioProprietario > 0) { 
        	c.add(Restrictions.eq("locatario.codigo", usuarioProprietario));
        	
        } 
        
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return c.list(); 
	}
	
}
