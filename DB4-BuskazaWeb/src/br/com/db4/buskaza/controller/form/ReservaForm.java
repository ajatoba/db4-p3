package br.com.db4.buskaza.controller.form;

import org.apache.struts.action.ActionForm;

import br.com.db4.buskaza.model.entity.Reserva;


public class ReservaForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected Reserva reservaEntity;
	
	private int diaPeriodoInicial;
	private int mesPeriodoInicial;
	private int anoPeriodoInicial;
	
	private int diaPeriodoFinal;
	private int mesPeriodoFinal;
	private int anoPeriodoFinal;
	
	private int codigoImovel;
	
	private String valor;
	
	private int status;
	
	private int statusMoip;
	
	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	public int getStatusMoip() {
		return statusMoip;
	}
	public void setStatusMoip(int statusMoip) {
		this.statusMoip = statusMoip;
	}


	public int getCodigoImovel() {
		return codigoImovel;
	}


	public void setCodigoImovel(int codigoImovel) {
		this.codigoImovel = codigoImovel;
	}


	public int getDiaPeriodoInicial() {
		return diaPeriodoInicial;
	}


	public void setDiaPeriodoInicial(int diaPeriodoInicial) {
		this.diaPeriodoInicial = diaPeriodoInicial;
	}


	public int getMesPeriodoInicial() {
		return mesPeriodoInicial;
	}


	public void setMesPeriodoInicial(int mesPeriodoInicial) {
		this.mesPeriodoInicial = mesPeriodoInicial;
	}


	public int getAnoPeriodoInicial() {
		return anoPeriodoInicial;
	}


	public void setAnoPeriodoInicial(int anoPeriodoInicial) {
		this.anoPeriodoInicial = anoPeriodoInicial;
	}


	public int getDiaPeriodoFinal() {
		return diaPeriodoFinal;
	}


	public void setDiaPeriodoFinal(int diaPeriodoFinal) {
		this.diaPeriodoFinal = diaPeriodoFinal;
	}


	public int getMesPeriodoFinal() {
		return mesPeriodoFinal;
	}


	public void setMesPeriodoFinal(int mesPeriodoFinal) {
		this.mesPeriodoFinal = mesPeriodoFinal;
	}


	public int getAnoPeriodoFinal() {
		return anoPeriodoFinal;
	}


	public void setAnoPeriodoFinal(int anoPeriodoFinal) {
		this.anoPeriodoFinal = anoPeriodoFinal;
	}

	public Reserva getReservaEntity() {
		return reservaEntity;
	}


	public void setReservaEntity(Reserva reservaEntity) {
		this.reservaEntity = reservaEntity;
	}


	public ReservaForm(){
		reservaEntity = new Reserva();		
	}


	public String getValor() {
		return valor;
	}


	public void setValor(String valor) {
		this.valor = valor;
	}		
	
}

