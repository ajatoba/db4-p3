package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.NotNull;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "tb_pessoa")
public class Pessoa implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "id_cadastro")
	protected Integer codigo;

	@NotNull
	protected String nome;

	protected String agencia;

	protected String contaCorrente;	
	
	protected String nacionalidade;

	@NotNull
	protected char modalidade;	

	@ManyToOne
	@JoinColumn(name = "id_banco")  	
	protected Banco banco;

	@OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL)
	protected Collection<Telefone> telefones;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_endereco")
	protected Endereco endereco;
	
	protected Date nascimento;
	
	@Column(unique = true)
	protected String cpfCnpj;	
	

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	
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