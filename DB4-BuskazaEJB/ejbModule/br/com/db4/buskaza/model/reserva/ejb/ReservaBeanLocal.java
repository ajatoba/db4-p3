package br.com.db4.buskaza.model.reserva.ejb;

import java.util.List;

import javax.ejb.Local;


import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Reserva;

@Local
public interface ReservaBeanLocal {

	public static String LOCAL = "ejb/ReservaBean/local";
	
	public List<Reserva> listarReservas(Integer usuarioProprietario);
	
	public List<Reserva> listarReservasImovelConfirmar(Integer codigoImovel, int status, int statusMoip);
	
	public Integer incluirReserva(Reserva reserva);
	
	public Integer aprovarReserva(Reserva reserva);
	
	public Reserva getReserva(Integer codigoReserva);
	
	//método adicionado para resolver problema no envio de email( equuipamento, idiomas e tipo de pagamento) 
	public Imovel getImovelEquipReserva(Integer codigoImovel);
	
	public List<Reserva> listarReservasImovel(Integer codigoImovel, int mes, int ano);
	

}
