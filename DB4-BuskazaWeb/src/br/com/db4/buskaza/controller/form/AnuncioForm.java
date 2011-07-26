package br.com.db4.buskaza.controller.form;

import org.apache.struts.action.ActionForm;

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Endereco;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.Imovel;
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
	
	private String tarifaDiaria; 	
	private String tarifaSemanal;	
	private String tarifaQuinzenal;	
	private String tarifaMensal;	
	private String tarifaPacoteFechado;
	
	private boolean permitirEntrada;
	
	private int tipoAnuncio;
	
	protected Integer[] tiposPagamento;
	
	public AnuncioForm() {
		anuncioEntity = new Anuncio();		
		anuncioEntity.setTipoAnuncio(new TipoAnuncio());				
		anuncioEntity.setImovel(new Imovel());
	}

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

	public String getTarifaDiaria() {
		return tarifaDiaria;
	}

	public void setTarifaDiaria(String tarifaDiaria) {
		this.tarifaDiaria = tarifaDiaria;
	}

	public String getTarifaSemanal() {
		return tarifaSemanal;
	}

	public void setTarifaSemanal(String tarifaSemanal) {
		this.tarifaSemanal = tarifaSemanal;
	}

	public String getTarifaQuinzenal() {
		return tarifaQuinzenal;
	}

	public void setTarifaQuinzenal(String tarifaQuinzenal) {
		this.tarifaQuinzenal = tarifaQuinzenal;
	}

	public String getTarifaMensal() {
		return tarifaMensal;
	}

	public void setTarifaMensal(String tarifaMensal) {
		this.tarifaMensal = tarifaMensal;
	}

	public String getTarifaPacoteFechado() {
		return tarifaPacoteFechado;
	}

	public void setTarifaPacoteFechado(String tarifaPacoteFechado) {
		this.tarifaPacoteFechado = tarifaPacoteFechado;
	}

	public boolean isPermitirEntrada() {
		return permitirEntrada;
	}

	public void setPermitirEntrada(boolean permitirEntrada) {
		this.permitirEntrada = permitirEntrada;
	}

	public int getTipoAnuncio() {
		return tipoAnuncio;
	}

	public void setTipoAnuncio(int tipoAnuncio) {
		this.tipoAnuncio = tipoAnuncio;
	}

	public Integer[] getTiposPagamento() {
		return tiposPagamento;
	}

	public void setTiposPagamento(Integer[] tiposPagamento) {
		this.tiposPagamento = tiposPagamento;
	}
	
	
}

