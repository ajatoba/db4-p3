package br.com.db4.buskaza.model.estado.ejb;
import java.util.Collection;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Estado;

@Local
public interface EstadoBeanLocal {
	
	public static String LOCAL = "ejb/EstadoBean/local";
	public Collection<Estado> listarEstados();

}
