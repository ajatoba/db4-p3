package br.com.db4.buskaza.model.reserva.ejb;

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
import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Bloqueio;
import br.com.db4.buskaza.model.entity.Imovel;
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
		c.addOrder(Order.desc("dataReserva"));
		
        if (usuarioProprietario != null && usuarioProprietario > 0) { 
        	c.add(Restrictions.eq("locatario.codigo", usuarioProprietario));
        	
        } 
        
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return c.list(); 
	}
	
	public List<Reserva> listarReservasImovel(Integer codigoImovel, int status){
		
		//ESSE MÉTODO LISTA AS RESERVAS DE ACORDO COM O STATUS
		//0 - PENDENTE DE APROVAÇÃO; 1 - APROVADA; 2 - NEGADA
		
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
		c.addOrder(Order.desc("dataReserva"));
		
        if (codigoImovel != null && codigoImovel > 0) { 
        	c.add(Restrictions.eq("imovel.codigo", codigoImovel));
        	
        } 
        
        if(status > 0){
        	c.add(Restrictions.eq("status", status));
        }
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return c.list(); 
	}
	
	public Integer incluirReserva(Reserva reserva) {
		em.persist(reserva);
		if(!em.contains(reserva))
        {
			reserva = em.merge(reserva);
        }
		
		return reserva.getCodigo();

	}
	
	public Integer aprovarReserva(Reserva reserva) {
		Reserva reservaR = getReserva(reserva.getCodigo());
		
		reservaR.setStatus(reserva.getStatus());
		
		em.merge(reservaR);
		
		return reserva.getCodigo();

	}
	
	public Reserva getReserva(Integer codigoReserva){
		return em.find(Reserva.class, codigoReserva);
	}
	
	public List<Reserva> listarReservasImovel(Integer codigoImovel, int mes, int ano){
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
		c.addOrder(Order.desc("dataReserva"));
		
		c.add(Restrictions.eq("status",1)); //SÓ PEGA AS RESERVAS APROVADAS!!
		
	    if (codigoImovel!= null && codigoImovel > 0) {        
	    	c.add(Restrictions.eq("imovel.codigo",codigoImovel)); 
	    } 
	    
	    if (mes > 0 && ano >0) {        
	    	c.add(Restrictions.between("periodoInicial", new Date(ano-1900,mes-1,1), new Date(ano-1900,mes-1,31))); 
	    	c.add(Restrictions.between("periodoFinal", new Date(ano-1900,mes-1,1), new Date(ano-1900,mes-1,31)));
	    } 
	    
	    c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
	    return c.list(); 
	}
}
