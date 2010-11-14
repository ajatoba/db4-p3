package br.com.db4.buskaza.controller.form;

import org.apache.struts.action.ActionForm;

import br.com.db4.buskaza.model.entity.Endereco;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.Usuario;

public class UsuarioForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Usuario usuarioEntity;

	private Integer dddFixo;

	private Integer numeroFixo;

	private Integer dddCelular;

	private Integer numeroCelular;

	private String emailConfirma;

	private String senhaConfirma;

	private String cep;

	private Integer pais;	
	
	protected boolean recebeInfo;
	
	protected boolean leuCondicoes;
	
	private String diaNascimento;

	private String mesNascimento;

	private String anoNascimento;

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

	public Usuario getUsuarioEntity() {
		return usuarioEntity;
	}

	public void setUsuarioEntity(Usuario usuarioEntity) {
		this.usuarioEntity = usuarioEntity;
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

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public Integer getPais() {
		return pais;
	}

	public void setPais(Integer pais) {
		this.pais = pais;
	}
	
	
	public String getDiaNascimento() {
		return diaNascimento;
	}

	public void setDiaNascimento(String diaNascimento) {
		this.diaNascimento = diaNascimento;
	}

	public String getMesNascimento() {
		return mesNascimento;
	}

	public void setMesNascimento(String mesNascimento) {
		this.mesNascimento = mesNascimento;
	}

	public String getAnoNascimento() {
		return anoNascimento;
	}

	public void setAnoNascimento(String anoNascimento) {
		this.anoNascimento = anoNascimento;
	}

	public UsuarioForm() {
		usuarioEntity = new Usuario();		
		usuarioEntity.setEndereco(new Endereco());
		usuarioEntity.getEndereco().setEstado(new Estado());	
	}

}
