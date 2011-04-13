package br.com.db4.buskaza.model.bloqueio.ejb;

import java.util.List;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Bloqueio;
import br.com.db4.buskaza.model.entity.Imovel;

@Local
public interface BloqueioBeanLocal {

	public static String LOCAL = "ejb/BloqueioBean/local";
	
	public Integer incluirBloqueio (Bloqueio bloqueio);
	
	public boolean checkBloqueios(Imovel imovel, Bloqueio bloqueio);
	
	public List<Bloqueio> listarBloqueiosImovel(Integer codigoImovel, int mes, int ano);
}
