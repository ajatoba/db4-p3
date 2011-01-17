package br.com.db4.buskaza.controller.form;

import org.apache.struts.action.ActionForm;

import br.com.db4.buskaza.model.entity.Anuncio;


public class AnuncioForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected Anuncio anuncioEntity;
	
	private String periodoInicial;
	
	private String periodoFinal;
	
	
	public Anuncio getAnuncioEntity() {
		return anuncioEntity;
	}


	public void setAnuncioEntity(Anuncio anuncioEntity) {
		this.anuncioEntity = anuncioEntity;
	}

	
	
	public String getPeriodoInicial() {
		return periodoInicial;
	}


	public void setPeriodoInicial(String periodoInicial) {
		this.periodoInicial = periodoInicial;
	}


	public String getPeriodoFinal() {
		return periodoFinal;
	}


	public void setPeriodoFinal(String periodoFinal) {
		this.periodoFinal = periodoFinal;
	}


	public AnuncioForm(){
		anuncioEntity = new Anuncio();		
	}		
	
}

