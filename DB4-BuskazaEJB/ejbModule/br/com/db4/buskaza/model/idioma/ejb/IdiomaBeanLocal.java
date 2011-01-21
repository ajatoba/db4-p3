package br.com.db4.buskaza.model.idioma.ejb;
import java.util.Collection;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Idioma;

@Local
public interface IdiomaBeanLocal {

	public static String LOCAL = "ejb/IdiomaBean/local";
	public Collection<Idioma> listarIdiomas();
	
}
