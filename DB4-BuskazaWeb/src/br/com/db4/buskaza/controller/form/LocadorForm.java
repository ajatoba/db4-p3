package br.com.db4.buskaza.controller.form;

import org.apache.struts.action.ActionForm;

import br.com.db4.buskaza.model.entity.Banco;
import br.com.db4.buskaza.model.entity.Endereco;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.Locador;

public class LocadorForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Locador locadorEntity;	

	private Integer dddFixo;

	private Integer numeroFixo;

	private Integer dddCelular;

	private Integer numeroCelular;

	private String emailConfirma;

	private String senhaConfirma;

	private String cep;

	private Integer pais;
	
	


	public Locador getLocadorEntity() {
		return locadorEntity;
	}

	public void setLocadorEntity(Locador locadorEntity) {
		this.locadorEntity = locadorEntity;
	}

	public Integer getDddFixo() {
		return dddFixo;
	}

	public void setDddFixo(Integer dddFixo) {
		this.dddFixo = dddFixo;
	}

	public Integer getNumeroFixo() {
		return numeroFixo;
	}

	public void setNumeroFixo(Integer numeroFixo) {
		this.numeroFixo = numeroFixo;
	}

	public Integer getDddCelular() {
		return dddCelular;
	}

	public void setDddCelular(Integer dddCelular) {
		this.dddCelular = dddCelular;
	}

	public Integer getNumeroCelular() {
		return numeroCelular;
	}

	public void setNumeroCelular(Integer numeroCelular) {
		this.numeroCelular = numeroCelular;
	}

	public String getEmailConfirma() {
		return emailConfirma;
	}

	public void setEmailConfirma(String emailConfirma) {
		this.emailConfirma = emailConfirma;
	}

	public String getSenhaConfirma() {
		return senhaConfirma;
	}

	public void setSenhaConfirma(String senhaConfirma) {
		this.senhaConfirma = senhaConfirma;
	}

	public Integer getPais() {
		return pais;
	}

	public void setPais(Integer pais) {
		this.pais = pais;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public LocadorForm() {
		locadorEntity = new Locador();
		locadorEntity.setBanco(new Banco());
		locadorEntity.setEndereco(new Endereco());
		locadorEntity.getEndereco().setEstado(new Estado());	
	}

}
