package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.CacheModeType;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;
import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_anuncio")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@NamedQueries( {
    @NamedQuery(name = "listarAnuncios", query = "select x from br.com.db4.buskaza.model.entity.Anuncio x ", cacheable = true, cacheMode = CacheModeType.NORMAL)
})
public class Anuncio implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id_anuncio")
	private Integer codigo;

	@NotNull
	@ManyToOne
	@JoinColumn(name="id_imovel")
	private Imovel imovel;
	
	
	@NotNull	
	private Date dataAnuncio;
	
	@NotNull
	private Integer status = 0; //1 - Ativo / 0 - Inativo / 2 - Cancelada / 3 - Concluida
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "id_anuncio")
	private Collection<Reserva> reservas;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "id_anuncio")
	private Collection<PeriodoAnuncio> periodos;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "id_anuncio")
	private Collection<ValorTipoAnuncio> valoresPorTipo;
	
	

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public Imovel getImovel() {
		return imovel;
	}

	public void setImovel(Imovel imovel) {
		this.imovel = imovel;
	}

	

	public Date getDataAnuncio() {
		return dataAnuncio;
	}

	public void setDataAnuncio(Date dataAnuncio) {
		this.dataAnuncio = dataAnuncio;
	}

	

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Collection<Reserva> getReservas() {
		return reservas;
	}

	public void setReservas(Collection<Reserva> reservas) {
		this.reservas = reservas;
	}

	public Collection<PeriodoAnuncio> getPeriodos() {
		return periodos;
	}

	public void setPeriodos(Collection<PeriodoAnuncio> periodos) {
		this.periodos = periodos;
	}

	public Collection<ValorTipoAnuncio> getValoresPorTipo() {
		return valoresPorTipo;
	}

	public void setValoresPorTipo(Collection<ValorTipoAnuncio> valoresPorTipo) {
		this.valoresPorTipo = valoresPorTipo;
	}	
	
	
	

}