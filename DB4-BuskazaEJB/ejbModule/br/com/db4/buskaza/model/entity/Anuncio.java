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
import javax.persistence.OneToOne;
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
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "id_tipo_anuncio")
	private TipoAnuncio tipoAnuncio;
	
	@NotNull
	private Date dataInicial;
	
	@NotNull
	private Date dataFinal;
	
	private double tarifaDiaria; 
	
	private double tarifaSemanal;
	
	private double tarifaQuinzenal;
	
	private double tarifaMensal;

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

	public TipoAnuncio getTipoAnuncio() {
		return tipoAnuncio;
	}

	public void setTipoAnuncio(TipoAnuncio tipoAnuncio) {
		this.tipoAnuncio = tipoAnuncio;
	}

	public Date getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(Date dataInicial) {
		this.dataInicial = dataInicial;
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}

	public double getTarifaDiaria() {
		return tarifaDiaria;
	}

	public void setTarifaDiaria(double tarifaDiaria) {
		this.tarifaDiaria = tarifaDiaria;
	}

	public double getTarifaSemanal() {
		return tarifaSemanal;
	}

	public void setTarifaSemanal(double tarifaSemanal) {
		this.tarifaSemanal = tarifaSemanal;
	}

	public double getTarifaQuinzenal() {
		return tarifaQuinzenal;
	}

	public void setTarifaQuinzenal(double tarifaQuinzenal) {
		this.tarifaQuinzenal = tarifaQuinzenal;
	}

	public double getTarifaMensal() {
		return tarifaMensal;
	}

	public void setTarifaMensal(double tarifaMensal) {
		this.tarifaMensal = tarifaMensal;
	} 
	
	

}