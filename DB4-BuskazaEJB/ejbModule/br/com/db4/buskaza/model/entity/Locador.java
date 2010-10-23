package br.com.db4.buskaza.model.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_locador")
public class Locador extends Pessoa implements Serializable {

	private static final long serialVersionUID = 1L;

	@NotNull
	protected String nomeContato;

	public String getNomeContato() {
		return nomeContato;
	}

	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}

}