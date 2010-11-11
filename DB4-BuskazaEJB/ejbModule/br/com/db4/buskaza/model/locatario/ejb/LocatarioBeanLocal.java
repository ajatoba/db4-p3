package br.com.db4.buskaza.model.locatario.ejb;
import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Locatario;

@Local
public interface LocatarioBeanLocal {
	
	public static String LOCAL = "ejb/LocatarioBean/local";
	
	public Integer incluirLocatario(Locatario locatario);
	
}
