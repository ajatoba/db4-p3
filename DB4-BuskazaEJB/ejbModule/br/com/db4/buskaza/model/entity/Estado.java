package br.com.db4.buskaza.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.CacheModeType;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;
import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_estado")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@NamedQueries( {
    @NamedQuery(name = "listarEstados", query = "select x from br.com.db4.buskaza.model.entity.Estado x ", cacheable = true, cacheMode = CacheModeType.NORMAL)
})
public class Estado implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id	
	@Column(length=2,name = "id_estado")
	private String codigo;

	@NotNull
	private String nome;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "id_pais")  
	private Pais pais;

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

}