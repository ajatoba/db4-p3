package br.com.db4.buskaza.controller.form;

import org.apache.struts.action.ActionForm;

import br.com.db4.buskaza.model.entity.Reserva;


public class ReservaForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected Reserva reservaEntity;
	
	private String periodoInicial;
	
	private String periodoFinal;
	
	
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

	

	public Reserva getReservaEntity() {
		return reservaEntity;
	}


	public void setReservaEntity(Reserva reservaEntity) {
		this.reservaEntity = reservaEntity;
	}


	public ReservaForm(){
		reservaEntity = new Reserva();		
	}		
	
}

