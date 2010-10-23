package br.com.db4.buskaza.model.pais.ejb;
import java.util.Collection;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Pais;

@Local
public interface PaisBeanLocal {

	public static String LOCAL = "ejb/PaisBean/local";
	public Collection<Pais> listarPaises();
	
}
