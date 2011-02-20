package br.com.db4.buskaza.controller.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Reserva;
import br.com.db4.buskaza.model.entity.TipoAnuncio;

public class ReservaUtil {
	
	private static ReservaUtil instance;
	
	
	private ReservaUtil(){
		
	}

	public static ReservaUtil getInstance(){
		if (instance==null) {
			instance = new ReservaUtil();
		}
		
		return instance;
	}
	
	public static double calculaPrecoReserva(Set<Anuncio> anuncios,  Reserva reserva){
		
		Iterator<Anuncio > it = anuncios.iterator();
		List<String> diasPeriodo = null;		
		List<String> diasReservados = null;
		
		Map<String, Anuncio> diaValor = new LinkedHashMap<String, Anuncio>();
		
		while (it.hasNext()) {
			Anuncio anuncio = (Anuncio) it.next();
			
			diasPeriodo 	= CalendarioUtil.getInstance().getDiasPeriodoMes(anuncio.getDataInicial(), anuncio.getDataFinal());			
			diasReservados 	= CalendarioUtil.getInstance().getDiasPeriodoMes(reserva.getPeriodoInicial(), reserva.getPeriodoFinal());
			
			Iterator<String> its = diasPeriodo.iterator();			
			
			while (its.hasNext()) {
				String diaAnuncio = its.next();

				Iterator<String> itReservas = diasReservados.iterator();
				
				while (itReservas.hasNext()) {
					String diaReserva = itReservas.next();
					if(diaAnuncio.equals(diaReserva)){
						//System.out.println("DIA:" + diaReserva + "-" + anuncio.getCodigo());
						diaValor.put(diaReserva, anuncio);
						
						break;
					}					
				}				
			}			
		}
		
		Iterator itValor = diaValor.entrySet().iterator();
		
		double precoTotal = 0.0;
		int qtdDias = diaValor.size();
		
	    while (itValor.hasNext()) {
	        Map.Entry mapa = (Map.Entry)itValor.next();	        
	        
	        if (qtdDias < 7)
	        	precoTotal = precoTotal + ((Anuncio)mapa.getValue()).getTarifaDiaria();
	        
	        if (qtdDias >= 7 && qtdDias < 15)
	        	precoTotal = precoTotal + ((Anuncio)mapa.getValue()).getTarifaSemanal();
	        
	        if (qtdDias >= 15 && qtdDias < 30)
	        	precoTotal = precoTotal + ((Anuncio)mapa.getValue()).getTarifaQuinzenal();
	        
	        if (qtdDias >= 30)
	        	precoTotal = precoTotal + ((Anuncio)mapa.getValue()).getTarifaMensal();
	        
	    }

	    return precoTotal;
	}
	
	public static void main (String[] args){
		
		ReservaUtil util = new ReservaUtil();
		
		//MONTANDO ANUNCIO
		Set<Anuncio> anuncios = new HashSet<Anuncio>();
		
		Anuncio anuncio = new Anuncio();
		anuncio.setCodigo(1);
		
		Date dataInicial = new Date(2011-1900,2-1,18);
		Date dataFinal = new Date(2011-1900,2-1,25);
		
		anuncio.setDataInicial(dataInicial);
		anuncio.setDataFinal(dataFinal);
		TipoAnuncio tipoAnuncio = new TipoAnuncio();
		tipoAnuncio.setCodigo(1);
		tipoAnuncio.setNome("Alta Temporada");
		anuncio.setTipoAnuncio(tipoAnuncio);
		
		anuncio.setTarifaDiaria(300.00);
		anuncio.setTarifaSemanal(200.00);		
		anuncio.setTarifaQuinzenal(100.00);
		anuncio.setTarifaMensal(50.00);
		anuncio.setTarifaPacoteFechado(10000.00);		
		
		Anuncio anuncio2 = new Anuncio();
		anuncio2.setCodigo(2);
		
		Date dataInicial2 = new Date(2011-1900,2-1,27);
		Date dataFinal2 = new Date(2011-1900,3-1,2);
		
		anuncio2.setDataInicial(dataInicial2);
		anuncio2.setDataFinal(dataFinal2);
		TipoAnuncio tipoAnuncio2 = new TipoAnuncio();
		tipoAnuncio2.setCodigo(2);
		tipoAnuncio2.setNome("Média Temporada");
		anuncio2.setTipoAnuncio(tipoAnuncio2);		
		
		anuncio2.setTarifaDiaria(150.00);
		anuncio2.setTarifaSemanal(140.00);		
		anuncio2.setTarifaQuinzenal(130.00);
		anuncio2.setTarifaMensal(120.00);
		anuncio2.setTarifaPacoteFechado(900.00);
		
		anuncios.add(anuncio);
		anuncios.add(anuncio2);
		//*************************
		
		//MONTANDO RESERVA
		Reserva reserva = new Reserva();
		
		Date dataInicialR = new Date(2011-1900,2-1,20);
		Date dataFinalR = new Date(2011-1900,3-1,1);
		
		reserva.setPeriodoInicial(dataInicialR);
		reserva.setPeriodoFinal(dataFinalR);
		//*************************
		util.calculaPrecoReserva(anuncios, reserva);
	}
	
}
