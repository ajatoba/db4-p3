package br.com.db4.buskaza.controller.form;

import org.apache.struts.action.ActionForm;

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Endereco;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.TipoAnuncio;
import br.com.db4.buskaza.model.entity.Usuario;


public class AnuncioForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected Anuncio anuncioEntity;
	
	private int diaDataInicial;
	private int mesDataInicial;
	private int anoDataInicial;
	
	private int diaDataFinal;
	private int mesDataFinal;
	private int anoDataFinal;
	
	private double tarifaDiaria; 	
	private double tarifaSemanal;	
	private double tarifaQuinzenal;	
	private double tarifaMensal;
	
	private int tipoAnuncio;
	
	
	public Anuncio getAnuncioEntity() {
		return anuncioEntity;
	}


	public void setAnuncioEntity(Anuncio anuncioEntity) {
		this.anuncioEntity = anuncioEntity;
	}


	public int getDiaDataInicial() {
		return diaDataInicial;
	}


	public void setDiaDataInicial(int diaDataInicial) {
		this.diaDataInicial = diaDataInicial;
	}


	public int getMesDataInicial() {
		return mesDataInicial;
	}


	public void setMesDataInicial(int mesDataInicial) {
		this.mesDataInicial = mesDataInicial;
	}


	public int getAnoDataInicial() {
		return anoDataInicial;
	}


	public void setAnoDataInicial(int anoDataInicial) {
		this.anoDataInicial = anoDataInicial;
	}


	public int getDiaDataFinal() {
		return diaDataFinal;
	}


	public void setDiaDataFinal(int diaDataFinal) {
		this.diaDataFinal = diaDataFinal;
	}


	public int getMesDataFinal() {
		return mesDataFinal;
	}


	public void setMesDataFinal(int mesDataFinal) {
		this.mesDataFinal = mesDataFinal;
	}


	public int getAnoDataFinal() {
		return anoDataFinal;
	}


	public void setAnoDataFinal(int anoDataFinal) {
		this.anoDataFinal = anoDataFinal;
	}


	public int getTipoAnuncio() {
		return tipoAnuncio;
	}


	public void setTipoAnuncio(int tipoAnuncio) {
		this.tipoAnuncio = tipoAnuncio;
	}

	public AnuncioForm() {
		anuncioEntity = new Anuncio();		
		anuncioEntity.setTipoAnuncio(new TipoAnuncio());
	}


	public double getTarifaDiaria() {
		return tarifaDiaria;
	}


	public void setTarifaDiaria(double tarifaDiaria) {
		this.tarifaDiaria = tarifaDiaria;
	}


	public double getTarifaSemanal() {
		return tarifaSemanal;
	}


	public void setTarifaSemanal(double tarifaSemanal) {
		this.tarifaSemanal = tarifaSemanal;
	}


	public double getTarifaQuinzenal() {
		return tarifaQuinzenal;
	}


	public void setTarifaQuinzenal(double tarifaQuinzenal) {
		this.tarifaQuinzenal = tarifaQuinzenal;
	}


	public double getTarifaMensal() {
		return tarifaMensal;
	}


	public void setTarifaMensal(double tarifaMensal) {
		this.tarifaMensal = tarifaMensal;
	}
	
	
}

