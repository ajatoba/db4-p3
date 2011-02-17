package br.com.db4.buskaza.controller.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import br.com.db4.buskaza.model.entity.Anuncio;

public class CalendarioUtil {
	
	private static CalendarioUtil cInstance;
	
	private CalendarioUtil(){
		
	}
	
	public static CalendarioUtil getInstance(){
		if (cInstance == null)
			cInstance = new CalendarioUtil();
	
	return cInstance;
	}
	
	// método utilitario para montar o calendario puro, sem os tipos.
	private static Map<String,Calendario> montaCalendario(int mes,int ano){
		Map<String,Calendario> calendarios = new LinkedHashMap<String, Calendario>();
		
		Calendar dataEscolhida = new GregorianCalendar(ano,mes,1);

		int diaMax = dataEscolhida.getActualMaximum(Calendar.DAY_OF_MONTH);
		int dia = 1;	
		String strDia;
		
		while (dia <= diaMax) {
			
			strDia = Integer.toString(dia);				
			
			Calendar dataDia = new GregorianCalendar(ano,mes,dia);		
			
			CalendarioUtil t = new CalendarioUtil();
			Calendario c =  new Calendario();
			c.setData(strDia+"/"+mes+"/"+ano);
			c.setDiaSemana(dataDia.get(Calendar.DAY_OF_WEEK));
			
			calendarios.put(strDia, c);
			
			dia++;
		}
		
		return calendarios;
	}
	
	
	//metodo para ser utilizado para montar o calendario para tela de reserva
	/*
	private  Map<String,Calendario> montaCalendarioReserva(int mes,int ano){
		
		Map<String,Calendario> calendario = montaCalendario(mes, ano);
		Collection<Reserva> reservas = getReservas(mes, ano);
		for (Reserva reserva : reservas) {
			List<String> dias = getDiasPeriodo(reserva.getDataInicial(), reserva.getDataFinal());
			for (String dia : dias) {
				calendario.get(dia).setTipoAnuncio(6); // seta o dia q está reservado
			}
		}	
	
		return calendario;
		
	}
	*/
	//metodo para ser utilizado para montar o calendario para tela de anuncio
	public static Map<String,Calendario> montaCalendarioAnuncio(int mes,int ano, Collection<Anuncio> anuncios){
		
		Map<String,Calendario> calendario = montaCalendario(mes, ano);

		for (Anuncio anuncio : anuncios) {
			List<String> dias = getDiasPeriodo(anuncio.getDataInicial(), anuncio.getDataFinal());
			for (String dia : dias) {
				calendario.get(dia).setTipoAnuncio(anuncio.getTipoAnuncio().getCodigo());
			}
		}	
		
		/*
		Collection<Reserva> reservas = getReservas(mes, ano);
		
		for (Reserva reserva : reservas) {
			List<String> dias = getDiasPeriodo(reserva.getDataInicial(), reserva.getDataFinal());
			for (String dia : dias) {
				calendario.get(dia).setTipoAnuncio(60); // seta o tipo reservado está reservado
			}
		}	
		*/
	
		return calendario;
	}
	
	//metodo para retornar os dias a partir de um período
	public static List<String> getDiasPeriodo(Date dataInicial,Date dataFinal){
		Calendar c = Calendar.getInstance();
		c.setTime(dataInicial);
		int diaInicial = c.get(Calendar.DATE);
		c.setTime(dataFinal);
		int diaFinal = c.get(Calendar.DATE);
		List<String> lista = new ArrayList<String>();
		for (int i = diaInicial; i <= diaFinal; i++) {
			lista.add(String.valueOf(i));			
		}		
		return lista;
		
	}
	
}
