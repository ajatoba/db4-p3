package br.com.db4.buskaza.controller.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
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
	
	public static List<String> getDiasPeriodoMes(Date dataInicial,Date dataFinal){
		int intervalo = 0;  
		int i = 0;  
		   
		Calendar periodo1 = Calendar.getInstance();  
		periodo1.set(dataInicial.getYear()+1900,dataInicial.getMonth()+1,dataInicial.getDate()-1);   
		   
		Calendar periodo2 = Calendar.getInstance();  
		periodo2.set(dataFinal.getYear()+1900,dataFinal.getMonth()+1,dataFinal.getDate()-1);   
		  
		intervalo = (periodo2.get(periodo2.DAY_OF_YEAR) - periodo1.get(periodo1.DAY_OF_YEAR)) + 1;  
		
		List<String> lista = new ArrayList<String>();
		String data = "";
		for (;i<intervalo;i++) {  
			periodo1.add(periodo1.DATE,1);
			data = periodo1.get(periodo1.DATE) + "/" + (periodo1.get(periodo1.MONTH) + 1) + "/" + periodo1.get(periodo1.YEAR);
			
			lista.add(data);
		}  
		    
		return lista;
		
	}
	
	public static void main(String[] args){
		
		Date dataInicial2 = new Date(2011-1900,3-1,01);
		Date dataFinal2 = new Date(2011-1900,3-1,07);
		
		List<String> diasPeriodo = getDiasPeriodoMes(dataInicial2, dataFinal2);
		
		/*
		Iterator<String> it = diasPeriodo.iterator();
		
		while (it.hasNext()) {
			String string = (String) it.next();
			System.out.println(string);;
		}*/
	}
}
