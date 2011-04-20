package br.com.db4.buskaza.model.usuario.ejb;

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

import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Pessoa;
import br.com.db4.buskaza.model.entity.Usuario;

/**
 * Session Bean implementation class UsuarioBean
 */
@Stateless
@LocalBinding(jndiBinding = UsuarioBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class UsuarioBean implements UsuarioBeanLocal {

	@PersistenceContext
	EntityManager em;

	public Integer incluirUsuario(Usuario usuario) {

		em.merge(usuario);
		return null;
	}

	public Boolean existeLogin(String email) {

		Query query = em.createQuery("select x from Pessoa x where x.email = :email ");
		query.setParameter("email", email);

		List<Pessoa> lista = query.getResultList();
		return (lista != null && lista.size() > 0);
	}

	public Boolean existeCNPJCPF(String cpfCnpj) {

		Query query = em.createQuery("select x from Pessoa x where x.cpfCnpj = :cpfCnpj ");
		query.setParameter("cpfCnpj", cpfCnpj);

		List<Pessoa> lista = query.getResultList();
		return (lista != null && lista.size() > 0);

	}

	
	public Usuario autenticarUsuario(String login, String senha, Integer tipoPerfil) {
		
		Session session;  
		if (em.getDelegate() instanceof EntityManagerImpl) {  
		    EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();  
		    session = entityManagerImpl.getSession();  
		} else {  
		    session = (Session) em.getDelegate();  
		}  
		
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.setCacheable(true);
		criteria.setCacheMode(CacheMode.NORMAL);		
				
		criteria.add(Restrictions.eq("email", login));
		criteria.add(Restrictions.eq("senha", senha));
		
		Criteria linesCritera = criteria.createCriteria("perfis", JoinFragment.INNER_JOIN);	
		linesCritera.add (Restrictions.eq("codigo", tipoPerfil)); //Tipo de perfil de usuario
		
		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		List result = criteria.list();		
		return (result!= null && result.size() > 0)?(Usuario)result.get(0):null;
	}

	public void confirmaUsuario(String email) {
		
		Query query = em.createQuery("update Usuario x set x.confirmado = true where x.email = :email ");
		try {			
			query.setParameter("email", email);
			
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<Usuario> listarTodosUsuarios(String ordenacao){
		
		if(ordenacao == null) ordenacao = "";
		
		Query query = em.createQuery("select x from Usuario x order by dataCadastro " + ordenacao);
		
		List<Usuario> lista = query.getResultList();
		
		return lista;
	}
}
