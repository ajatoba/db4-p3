package br.com.db4.buskaza.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.CacheModeType;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@Table(name = "tb_idioma")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@NamedQueries( {
    @NamedQuery(name = "listarIdiomas", query = "select x from br.com.db4.buskaza.model.entity.Idioma x ", cacheable = true, cacheMode = CacheModeType.NORMAL)
})
public class Idioma implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id_idioma")
	private Integer codigo;

	private String nome;

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	

}