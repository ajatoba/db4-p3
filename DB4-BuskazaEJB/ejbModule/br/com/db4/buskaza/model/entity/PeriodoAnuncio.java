package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_periodo_anuncio")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)

public class PeriodoAnuncio implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id_periodo_anuncio")
	private Integer codigo;

	@NotNull
	@ManyToOne
	@JoinColumn(name="id_anuncio")
	private Anuncio anuncio;
	
	@NotNull
	private Date periodoInicial;
	
	@NotNull
	private Date periodoFinal;	
	
	@OneToOne
	@JoinColumn(name = "id_tipo_anuncio")
	private TipoAnuncio tipoAnuncio;

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public Anuncio getAnuncio() {
		return anuncio;
	}

	public void setAnuncio(Anuncio anuncio) {
		this.anuncio = anuncio;
	}

	public Date getPeriodoInicial() {
		return periodoInicial;
	}

	public void setPeriodoInicial(Date periodoInicial) {
		this.periodoInicial = periodoInicial;
	}

	public Date getPeriodoFinal() {
		return periodoFinal;
	}

	public void setPeriodoFinal(Date periodoFinal) {
		this.periodoFinal = periodoFinal;
	}

	public TipoAnuncio getTipoAnuncio() {
		return tipoAnuncio;
	}

	public void setTipoAnuncio(TipoAnuncio tipoAnuncio) {
		this.tipoAnuncio = tipoAnuncio;
	}
	
	

}