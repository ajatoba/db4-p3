package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
public class Usuario extends Pessoa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;	

		
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
	
	@NotNull
	protected String nomeContato;
	
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

	public String getNomeContato() {
		return nomeContato;
	}

	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}
	
	

}