package br.com.db4.buskaza.model.reserva.ejb;

import java.util.List;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Reserva;

@Local
public interface ReservaBeanLocal {

	public static String LOCAL = "ejb/ReservaBean/local";
	
	public List<Reserva> listarReservas(Integer usuarioProprietario);
	
	}
