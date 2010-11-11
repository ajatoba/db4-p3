package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.NotNull;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "tb_pessoa")
public class Pessoa extends Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	

	@NotNull
	protected String nome;

	protected String agencia;

	protected String contaCorrente;	

	@NotNull
	protected char modalidade;
	

	@ManyToOne
	@JoinColumn(name = "id_banco")  
	@Transient
	protected Banco banco;

	@OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL)
	protected Collection<Telefone> telefones;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_endereco")
	protected Endereco endereco;
	
	@Column(unique = true)
	protected String cpfCnpj;

	public String getAgencia() {
		return agencia;
	}

	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}

	public String getContaCorrente() {
		return contaCorrente;
	}

	public void setContaCorrente(String contaCorrente) {
		this.contaCorrente = contaCorrente;
	}

	
	public char getModalidade() {
		return modalidade;
	}

	public void setModalidade(char modalidade) {
		this.modalidade = modalidade;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Banco getBanco() {
		return banco;
	}

	public void setBanco(Banco banco) {
		this.banco = banco;
	}

	public Collection<Telefone> getTelefones() {
		return telefones;
	}

	public void setTelefones(Collection<Telefone> telefones) {
		this.telefones = telefones;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	
	public String getCpfCnpj() {
		return cpfCnpj;
	}

	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}

}