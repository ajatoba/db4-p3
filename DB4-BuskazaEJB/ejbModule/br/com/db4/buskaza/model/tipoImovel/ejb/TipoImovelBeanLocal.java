package br.com.db4.buskaza.model.tipoImovel.ejb;

import java.util.Collection;

import br.com.db4.buskaza.model.entity.TipoImovel;

public interface TipoImovelBeanLocal {

	public static String LOCAL = "ejb/TipoImovelBean/local";
	public Collection<TipoImovel> listarTiposImovel();
	
}
