package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.IndexColumn;
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
	Set<Perfil> perfis;

	protected boolean recebeInfo;
	
	protected boolean leuCondicoes;
		
	protected String nomeContato;
	
	@NotNull
	protected boolean confirmado;
	
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "id_usuario_proprietario")
	protected Set<Imovel> imoveis;
	
	
	public Set<Imovel> getImoveis() {
		return imoveis;
	}

	public void setImoveis(Set<Imovel> imoveis) {
		this.imoveis = imoveis;
	}

	public boolean isConfimado() {
		return confirmado;
	}

	public void setConfimado(boolean confimado) {
		this.confirmado = confimado;
	}

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

	public Set<Perfil> getPerfis() {
		return perfis;
	}

	public void setPerfis(Set<Perfil> perfis) {
		this.perfis = perfis;
	}

	public String getNomeContato() {
		return nomeContato;
	}

	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}
	
	

}