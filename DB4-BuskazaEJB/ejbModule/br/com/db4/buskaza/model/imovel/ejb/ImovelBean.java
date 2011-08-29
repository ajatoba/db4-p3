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
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.hibernate.ejb.EntityManagerImpl;
import org.hibernate.sql.JoinFragment;
import org.hibernate.type.Type;
import org.jboss.ejb3.annotation.LocalBinding;

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.util.Constants;
import br.com.db4.buskaza.model.util.UtilsCollections;

@Stateless
@LocalBinding(jndiBinding = ImovelBeanLocal.LOCAL)
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ImovelBean implements ImovelBeanLocal {

	@PersistenceContext
	EntityManager em;

	public Integer incluirImovel(Imovel imovel) {
		em.persist(imovel);
		if (!em.contains(imovel)) {
			imovel = em.merge(imovel);

		}

		return imovel.getCodigo();

	}

	public void atualiza(Imovel imovel) {
		em.merge(imovel);

	}

	public List<Imovel> buscarImovel(Imovel imovel, Integer codigoPais, Anuncio anuncio) {

		System.out.println("--- busca imovel versao2011-aug-29");

		Session session;
		if (em.getDelegate() instanceof EntityManagerImpl) {
			EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();
			session = entityManagerImpl.getSession();
		} else {
			session = (Session) em.getDelegate();
		}

		Criteria c = session.createCriteria(Imovel.class);

		c.setFetchMode("fotos", FetchMode.EAGER);
		c.setFetchMode("anuncios", FetchMode.EAGER);
		c.setFetchMode("reservas", FetchMode.EAGER);
		c.setFetchMode("equipamentos", FetchMode.EAGER);

		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);

		c.add(Restrictions.gt("status", -1));

		if (imovel.getEstado() != null && imovel.getEstado().getCodigo() != null
				&& imovel.getEstado().getCodigo().length() > 0) {
			c.add(Restrictions.eq("estado.codigo", imovel.getEstado().getCodigo()));
		}

		if (imovel.getEquipamentos() != null && imovel.getEquipamentos().size() > 0) {
			Criteria joinEquipamento = c.createCriteria("equipamentos", JoinFragment.INNER_JOIN);
			joinEquipamento.setFetchMode("equipamentos", FetchMode.LAZY);
			joinEquipamento.add(Restrictions.in("codigo", UtilsCollections.listarPropriedadeInteger(imovel
					.getEquipamentos(), "codigo")));
		}

		if (anuncio != null) {
			Criteria joinPeriodoAnuncio = c.createCriteria("anuncios", JoinFragment.LEFT_OUTER_JOIN);
			joinPeriodoAnuncio.setFetchMode("anuncios", FetchMode.LAZY);

			System.out.println("data inicial = " + anuncio.getDataInicial());
			System.out.println("data final = " + anuncio.getDataFinal());

			if (anuncio.getTipoAnuncio() != null) {
				if (anuncio.getTipoAnuncio().getCodigo() != Constants.TIPO_ANUNCIO_PACOTE_FECHADO) {

					joinPeriodoAnuncio
							.add(Restrictions.ne("tipoAnuncio.codigo", Constants.TIPO_ANUNCIO_PACOTE_FECHADO));

					SimpleExpression dataInicial_BEFORE_SearchRange = Restrictions.le("dataInicial", anuncio
							.getDataInicial());
					SimpleExpression dataFinal_AFTER_SearchRange = Restrictions.ge("dataFinal", anuncio.getDataFinal());

					// as disponibilidades precisam estas externas ao intervalo
					// solicitado
					joinPeriodoAnuncio.add(Restrictions
							.and(dataInicial_BEFORE_SearchRange, dataFinal_AFTER_SearchRange));

				} else if (anuncio.getTipoAnuncio().getCodigo() == Constants.TIPO_ANUNCIO_PACOTE_FECHADO) {

					// somente pacote fechado
					// ou seja as datas de diponibilidade precisam estar ENTRE o
					// intervalo solicitado
					//
					joinPeriodoAnuncio
							.add(Restrictions.eq("tipoAnuncio.codigo", Constants.TIPO_ANUNCIO_PACOTE_FECHADO));// SO

					LogicalExpression dataInicial_IN_SearchRange = Restrictions.and(Restrictions.ge("dataInicial",
							anuncio.getDataInicial()), Restrictions.le("dataInicial", anuncio.getDataFinal()));

					LogicalExpression dataFinal_IN_SearchRange = Restrictions.and(Restrictions.ge("dataFinal", anuncio
							.getDataInicial()), Restrictions.le("dataFinal", anuncio.getDataFinal()));

					// ambas as condicoes devem ser verdadeiras quando a
					// pesquisa eh por pacote
					// fechado
					joinPeriodoAnuncio.add(Restrictions.or(dataInicial_IN_SearchRange, dataFinal_IN_SearchRange));

				}
			} else {

				// tipo de pacote nao informado
				// pesquisar intervalo de datas que cubra todos os dias
				// pesquisados
				//
				SimpleExpression dataInicial_BEFORE_SearchRange = Restrictions.le("dataInicial", anuncio
						.getDataInicial());
				SimpleExpression dataFinal_AFTER_SearchRange = Restrictions.ge("dataFinal", anuncio.getDataFinal());

				// as disponibilidades precisam estas externas ao intervalo
				// solicitado
				joinPeriodoAnuncio.add(Restrictions.and(dataInicial_BEFORE_SearchRange, dataFinal_AFTER_SearchRange));
			}

			// joinPeriodoAnuncio.add
			// (Restrictions.sqlRestriction("({alias}.dataInicial between ? and ?) or ( {alias}.dataFinal between ? and ?)",new
			// Object[]{ anuncio.getDataInicial(),
			// anuncio.getDataFinal(),anuncio.getDataInicial(),
			// anuncio.getDataFinal()}, new Type[] {new
			// org.hibernate.type.DateType(), new org.hibernate.type.DateType(),
			// new org.hibernate.type.DateType(), new
			// org.hibernate.type.DateType()}));

		}

		c.add(Restrictions.sqlRestriction(
				" {alias}.id_imovel not in (select distinct(id_imovel) from tb_bloqueio where id_imovel = {alias}.id_imovel "
						+ "and ( ? between dataInicial and dataFinal) or (? between dataInicial and dataFinal)) ",
				new Object[] {
						anuncio.getDataInicial(), anuncio.getDataFinal() }, new Type[] {
						new org.hibernate.type.DateType(), new org.hibernate.type.DateType() }));
		c
				.add(Restrictions
						.sqlRestriction(
								" {alias}.id_imovel not in (select distinct(id_imovel) from tb_reserva where id_imovel = {alias}.id_imovel "
										+ "and status = "
										+ Constants.STATUS_RESERVA_APROVADA
										+ " and  (( ? between periodoInicial and periodoFinal) or (? between periodoInicial and periodoFinal)))",
								new Object[] {
										anuncio.getDataInicial(), anuncio.getDataFinal() }, new Type[] {
										new org.hibernate.type.DateType(), new org.hibernate.type.DateType() }));

		if (imovel.getCapacidade() != 0) {
			c.add(Restrictions.between("capacidade", new Integer(0), imovel.getCapacidade()));
		}

		if (codigoPais != null && codigoPais > 0) {

			Query query = em
					.createQuery("select x from br.com.db4.buskaza.model.entity.Estado x where x.pais.codigo = :id_pais");
			query.setParameter("id_pais", codigoPais);

			List estados = query.getResultList();

			if (estados != null && estados.size() > 0) {
				Criteria estadoPais = c.createCriteria("estado", JoinFragment.INNER_JOIN);
				estadoPais.add(Restrictions.in("codigo", UtilsCollections.listarPropriedadeString(estados, "codigo")));
			} else {
				return null;
			}
		}

		if (imovel.getMunicipio() != null && imovel.getMunicipio().length() > 0) {
			System.out.println("Buscando Município:" + imovel.getMunicipio());
			c.add(Restrictions.like("municipio", imovel.getMunicipio(), MatchMode.ANYWHERE));
		}

		if (imovel.getBairro() != null && imovel.getBairro().length() > 0) {
			c.add(Restrictions.like("bairro", imovel.getBairro(), MatchMode.ANYWHERE));
		}

		if (imovel.getQuartos() > 0) {
			c.add(Restrictions.eq("quartos", imovel.getQuartos()));
		}

		if (imovel.getMetragem() > 0) {
			c.add(Restrictions.eq("metragem", imovel.getMetragem()));
		}

		// comentado para testes
		// vacavitoria.com ticket #73
		c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);

		List result = c.list();
		System.out.println("pesquisa retornou " + result.size() + " itens");

		return result;
	}

	public List<Imovel> listarImoveis(Integer usuarioProprietario) {
		Session session;
		if (em.getDelegate() instanceof EntityManagerImpl) {
			EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();
			session = entityManagerImpl.getSession();
		} else {
			session = (Session) em.getDelegate();
		}

		Criteria c = session.createCriteria(Imovel.class);
		c.setFetchMode("fotos", FetchMode.EAGER);
		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);

		if (usuarioProprietario != null && usuarioProprietario > 0) {
			c.add(Restrictions.eq("usuarioProprietario.codigo", usuarioProprietario));
		}

		c.add(Restrictions.gt("status", -1)); // -1 nao devem ser exibidos

		c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return c.list();
	}

	public List<Imovel> listarImoveisPorStatus(int status) {
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

		// -1 sao os excluidos, que nao devem ser mostrados nunca mais

		if (status > -1)
			c.add(Restrictions.eq("status", status));
		else
			c.add(Restrictions.gt("status", -1));

		c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);

		return c.list();
	}

	public Imovel getImovel(Integer codigoImovel) {

		Session session;
		if (em.getDelegate() instanceof EntityManagerImpl) {
			EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();
			session = entityManagerImpl.getSession();
		} else {
			session = (Session) em.getDelegate();
		}

		Criteria c = session.createCriteria(Imovel.class);
		c.add(Restrictions.eq("codigo", codigoImovel));

		c.setFetchMode("fotos", FetchMode.EAGER);
		c.setFetchMode("anuncios", FetchMode.EAGER);
		c.setFetchMode("tiposPagamento", FetchMode.EAGER);
		c.setFetchMode("reservas", FetchMode.EAGER);
		c.setFetchMode("bloqueios", FetchMode.EAGER);

		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);

		return (Imovel) c.uniqueResult();
	}

	public Imovel getImovelEditar(Integer codigoImovel) {

		Session session;
		if (em.getDelegate() instanceof EntityManagerImpl) {
			EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();
			session = entityManagerImpl.getSession();
		} else {
			session = (Session) em.getDelegate();
		}

		Criteria c = session.createCriteria(Imovel.class);
		c.add(Restrictions.eq("codigo", codigoImovel));

		c.setFetchMode("fotos", FetchMode.EAGER);
		c.setFetchMode("equipamentos", FetchMode.EAGER);
		c.setFetchMode("idiomas", FetchMode.EAGER);
		c.setFetchMode("tiposPagamento", FetchMode.EAGER);

		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);

		return (Imovel) c.uniqueResult();
	}

	public Imovel getImovelDetalhes(Integer codigoImovel) {

		Session session;
		if (em.getDelegate() instanceof EntityManagerImpl) {
			EntityManagerImpl entityManagerImpl = (EntityManagerImpl) em.getDelegate();
			session = entityManagerImpl.getSession();
		} else {
			session = (Session) em.getDelegate();
		}

		Criteria c = session.createCriteria(Imovel.class);
		c.add(Restrictions.eq("codigo", codigoImovel));

		c.setFetchMode("fotos", FetchMode.LAZY);
		c.setFetchMode("equipamentos", FetchMode.EAGER);
		c.setFetchMode("idiomas", FetchMode.EAGER);
		c.setFetchMode("anuncios", FetchMode.EAGER);
		c.setFetchMode("tiposPagamento", FetchMode.EAGER);
		c.setFetchMode("reservas", FetchMode.EAGER);
		c.setFetchMode("bloqueios", FetchMode.EAGER);

		c.setCacheable(true);
		c.setCacheMode(CacheMode.NORMAL);

		return (Imovel) c.uniqueResult();
	}

	public Integer alterarImovel(Imovel imovel) {
		if (!em.contains(imovel)) {
			imovel = em.merge(imovel);
		}

		return imovel.getCodigo();
	}

}
