package br.com.db4.buskaza.model.tipoanuncio.ejb;

import java.util.Collection;

import br.com.db4.buskaza.model.entity.TipoAnuncio;

public interface TipoAnuncioBeanLocal {

	public static String LOCAL = "ejb/TipoAnuncioBean/local";
	public Collection<TipoAnuncio> listarTiposAnuncio();
	
}
