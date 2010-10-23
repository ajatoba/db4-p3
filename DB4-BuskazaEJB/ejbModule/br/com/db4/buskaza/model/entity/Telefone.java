package br.com.db4.buskaza.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_telefone")
public class Telefone implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id_telefone")
	private Integer codigo;

	@NotNull
	private Integer ddd;


	private Integer dddi;

	@NotNull
	private Integer numero;

	private Integer ramal;
	
	@ManyToOne
	@JoinColumn(name = "id_pessoa")  
	private Pessoa pessoa;
	
	//{F fixo, C celular}
	private char tipoTelefone;

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public Integer getDdd() {
		return ddd;
	}

	public void setDdd(Integer ddd) {
		this.ddd = ddd;
	}

	public Integer getDddi() {
		return dddi;
	}

	public void setDddi(Integer dddi) {
		this.dddi = dddi;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public Integer getRamal() {
		return ramal;
	}

	public void setRamal(Integer ramal) {
		this.ramal = ramal;
	}

	
	

	public char getTipoTelefone() {
		return tipoTelefone;
	}

	public void setTipoTelefone(char tipoTelefone) {
		this.tipoTelefone = tipoTelefone;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	

}