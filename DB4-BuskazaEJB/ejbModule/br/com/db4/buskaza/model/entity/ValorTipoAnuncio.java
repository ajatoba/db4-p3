package br.com.db4.buskaza.model.entity;

import java.io.Serializable;

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
@Table(name = "tb_valor_tipo_anuncio")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)

public class ValorTipoAnuncio implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id_valor_tipo_anuncio")
	private Integer codigo;

	@NotNull
	@ManyToOne
	@JoinColumn(name="id_anuncio")
	private Anuncio anuncio;	
	
	@OneToOne
	@JoinColumn(name = "id_tipo_anuncio")
	private TipoAnuncio tipoAnuncio;
	
	private Double valorDiario;
	
	private Double valorQuinzenal;
	
	private Double valorSemanal;
	
	private Double valorMensal;
	
	private Double valorPacote;

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

	public TipoAnuncio getTipoAnuncio() {
		return tipoAnuncio;
	}

	public void setTipoAnuncio(TipoAnuncio tipoAnuncio) {
		this.tipoAnuncio = tipoAnuncio;
	}

	public Double getValorDiario() {
		return valorDiario;
	}

	public void setValorDiario(Double valorDiario) {
		this.valorDiario = valorDiario;
	}

	public Double getValorQuinzenal() {
		return valorQuinzenal;
	}

	public void setValorQuinzenal(Double valorQuinzenal) {
		this.valorQuinzenal = valorQuinzenal;
	}

	public Double getValorSemanal() {
		return valorSemanal;
	}

	public void setValorSemanal(Double valorSemanal) {
		this.valorSemanal = valorSemanal;
	}

	public Double getValorMensal() {
		return valorMensal;
	}

	public void setValorMensal(Double valorMensal) {
		this.valorMensal = valorMensal;
	}

	public Double getValorPacote() {
		return valorPacote;
	}

	public void setValorPacote(Double valorPacote) {
		this.valorPacote = valorPacote;
	}


}