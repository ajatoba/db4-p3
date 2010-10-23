package br.com.db4.buskaza.controller.form;

import org.apache.struts.action.ActionForm;

import br.com.db4.buskaza.model.entity.Usuario;

public class UsuarioForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Usuario usuarioEntity;

	private String emailConfirma;

	private String senhaConfirma;

	private String cep;

	private Integer pais;

	public Usuario getUsuarioEntity() {
		return usuarioEntity;
	}

	public void setUsuarioEntity(Usuario usuarioEntity) {
		this.usuarioEntity = usuarioEntity;
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

	public UsuarioForm() {
		
	}

}
