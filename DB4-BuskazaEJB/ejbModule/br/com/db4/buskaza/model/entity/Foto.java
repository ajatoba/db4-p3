package br.com.db4.buskaza.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_foto")
public class Foto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id_foto")
	private Integer codigo;
	
	@NotNull
	private String caminho;
	
	@NotNull
	private String caminhoThumbnail;

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getCaminho() {
		return caminho;
	}

	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

	public String getCaminhoThumbnail() {
		return caminhoThumbnail;
	}

	public void setCaminhoThumbnail(String caminhoThumbnail) {
		this.caminhoThumbnail = caminhoThumbnail;
	}
	
}
