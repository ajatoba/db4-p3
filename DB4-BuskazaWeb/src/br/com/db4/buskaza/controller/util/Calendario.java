package br.com.db4.buskaza.controller.util;

//Simulando o objeto de calendario que será retornado para montar as disponibilidade do anuncio ou reserva
public class Calendario{
	private String data;
	private int tipoAnuncio;
	private int diaSemana;
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int getTipoAnuncio() {
		return tipoAnuncio;
	}
	public void setTipoAnuncio(int tipoAnuncio) {
		this.tipoAnuncio = tipoAnuncio;
	}
	public int getDiaSemana() {
		return diaSemana;
	}
	public void setDiaSemana(int diaSemana) {
		this.diaSemana = diaSemana;
	}		
	
}