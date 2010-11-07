package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.validator.NotNull;

/**
 * Entity implementation class for Entity: Usuario
 * 
 */
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "tb_usuario")
public class Usuario implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "id_cadastro")
	protected Integer codigo;
	
	@NotNull
	@Column(unique = true)
	protected String email;
	
	@NotNull
	private String senha;
	
	@ManyToMany(fetch = FetchType.LAZY)	
	@JoinTable(name ="tb_usuario_perfil")    
	Collection<Perfil> perfis;

	protected boolean recebeInfo;
	
	protected boolean leuCondicoes;
	
	public boolean isRecebeInfo() {
		return recebeInfo;
	}

	public void setRecebeInfo(boolean recebeInfo) {
		this.recebeInfo = recebeInfo;
	}

	public boolean isLeuCondicoes() {
		return leuCondicoes;
	}

	public void setLeuCondicoes(boolean leuCondicoes) {
		this.leuCondicoes = leuCondicoes;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Collection<Perfil> getPerfis() {
		return perfis;
	}

	public void setPerfis(Collection<Perfil> perfis) {
		this.perfis = perfis;
	}

}