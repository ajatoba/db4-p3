package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_locatario")
public class Locatario extends Pessoa implements Serializable {

	private static final long serialVersionUID = 1L;

	@NotNull
	protected String nacionalidade;

	protected Date nascimento;

	public String getNacionalidade() {
		return nacionalidade;
	}

	public void setNacionalidade(String nacionalidade) {
		this.nacionalidade = nacionalidade;
	}

	public Date getNascimento() {
		return nascimento;
	}

	public void setNascimento(Date nascimento) {
		this.nascimento = nascimento;
	} 
	
	

}