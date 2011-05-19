package br.com.db4.buskaza.model.reserva.ejb;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.CacheMode;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.ejb.EntityManagerImpl;
import org.hibernate.sql.JoinFragment;
import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Bloqueio;
import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Reserva;
import br.com.db4.buskaza.model.util.Constants;

@Stateless
@LocalBinding(jndiBinding = ReservaBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ReservaBean implements ReservaBeanLocal {

	@PersistenceContext
	EntityManager em;
	
	
	public List<Reserva> listarReservas(Integer usuarioProprietario){
		
		System.out.println("LISTANDO RESERVA");
		
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		  EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		  session = entityManagerImpl.getSession();  
		} else {  
		  session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Reserva.class);
		c.setCacheable(true);
		c.setFetchMode("imovel", FetchMode.EAGER);
		c.setCacheMode(CacheMode.NORMAL);
		c.addOrder(Order.desc("dataReserva"));
		
		
		/*
		
		Criteria c = session.createCriteria(Reserva.class);
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);
		c.addOrder(Order.desc("dataReserva"));

		c.createAlias("imovel", "im");
		c.add( Restrictions.eqProperty("imovel.codigo", "im.codigo") );
		
		
		Criteria c = session.createCriteria(Reserva.class);
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);
		c.addOrder(Order.desc("dataReserva"));

		Criteria cImovel = session.createCriteria("imovel");
		cImovel.setFetchMode("imovel", FetchMode.EAGER);
		*/

		if (usuarioProprietario != null && usuarioProprietario > 0) { 

		  c.add(Restrictions.eq("locatario.codigo", usuarioProprietario));
		      
		} 

		c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return c.list();
		
		}
	/*
	public List<Reserva> listarReservas(Integer usuarioProprietario){
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Reserva.class);
		
		c.setFetchMode("imovel", FetchMode.LAZY);
		
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);	
		c.addOrder(Order.desc("dataReserva"));
		
        if (usuarioProprietario != null && usuarioProprietario > 0) { 
        	c.add(Restrictions.eq("locatario.codigo", usuarioProprietario));
        	
        } 
        
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return c.list(); 
	}*/
	
	public List<Reserva> listarReservasImovelConfirmar(Integer codigoImovel, int status, int statusMoip){
		
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
		c.setFetchMode("equipamentos", FetchMode.EAGER);
		c.setCacheMode(CacheMode.NORMAL);	
		c.addOrder(Order.desc("dataReserva"));
		
        if (codigoImovel != null && codigoImovel > 0) { 
        	c.add(Restrictions.eq("imovel.codigo", codigoImovel));
        } 
        
        if(status >= 0){//POIS -1 DEVE LISTAR TODAS AS RESERVAS
        	c.add(Restrictions.eq("status", status));
        	c.add(Restrictions.eq("statusMoip", statusMoip));
        }
        
        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return c.list(); 
	}
	/*
	public Integer incluirReserva(Reserva reserva) {
		
		em.persist(reserva);
		if(!em.contains(reserva))
        {
			reserva = em.merge(reserva);
        }
		return reserva.getCodigo();
		
	}
	*/
	
	public Integer incluirReserva(Reserva reserva) {


		Imovel im = em.find(Imovel.class, reserva.getImovel().getCodigo());

		reserva.setImovel(im);

		em.persist(reserva);
		if(!em.contains(reserva))
		{
			reserva = em.merge(reserva);
		}
		
		return reserva.getCodigo();

	}
	
	public Integer aprovarReserva(Reserva reserva) {
		String sql = "UPDATE Reserva set status = "+ reserva.getStatus() +", statusMoip = "+ reserva.getStatusMoip() +"  where codigo="+reserva.getCodigo();
		
		Query query = em.createQuery(sql);
		query.executeUpdate();		
		
		return reserva.getCodigo();

	}
	
	
	
	/*
	 
	  public Integer aprovarReserva(Reserva reserva) {
		String sql = "UPDATE Reserva set status = "+ reserva.getStatus() +", statusMoip = "+ reserva.getStatusMoip() +"  where codigo="+reserva.getCodigo();
		
		Query query = em.createQuery(sql);
		query.executeUpdate();
		
		return reserva.getCodigo();
	
		}
	  
	 
	public Reserva getReserva(Integer codigoReserva){
		return em.find(Reserva.class, codigoReserva);
	}
	
	public Reserva getReserva(Integer codigoReserva){
	        Reserva reserva = em.find(Reserva.class, codigoReserva);
	       
	       
	       
	       
	       Session session;  
			if (em.getDelegate() instanceof EntityManagerImpl) {  
			    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
			    session = entityManagerImpl.getSession();  
			} else {  
			    session = (Session) em.getDelegate();  
			}
			
			Criteria c = session.createCriteria(Imovel.class); 
			
			c.setFetchMode("equipamentos", FetchMode.EAGER);		
			c.setFetchMode("reserva", FetchMode.EAGER);
			
			c.setCacheable(true);			
			c.setCacheMode(CacheMode.NORMAL);			
			c.add(Restrictions.eq("reserva.codigo", codigoReserva ));
			
			return (Reserva) c.uniqueResult();
	       
	       //return reserva;
	}
	*/
	
	public Reserva getReserva(Integer codigoReserva){
	       Reserva reserva = em.find(Reserva.class, codigoReserva);
	       return reserva;
	}
	
	
	
	public Imovel getImovelEquipReserva(Integer codigoImovel){
       
        Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		  EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		  session = entityManagerImpl.getSession();  
		} else {  
		  session = (Session) em.getDelegate();  
		}
		
		Criteria c = session.createCriteria(Imovel.class);
		c.add(Restrictions.eq("codigo", codigoImovel));
		
		c.setFetchMode("equipamentos", FetchMode.EAGER);
		c.setFetchMode("idiomas", FetchMode.EAGER);
		c.setFetchMode("tiposPagamento", FetchMode.EAGER);
		
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);

		return (Imovel) c.uniqueResult();
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
		
		c.add(Restrictions.eq("status",Constants.STATUS_RESERVA_APROVADA)); //SÓ PEGA AS RESERVAS APROVADAS!!
		
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
