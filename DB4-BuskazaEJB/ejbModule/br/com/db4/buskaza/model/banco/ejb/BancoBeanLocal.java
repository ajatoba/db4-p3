package br.com.db4.buskaza.model.banco.ejb;
import java.util.Collection;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Banco;

@Local
public interface BancoBeanLocal {
	
	public static String LOCAL = "ejb/BancoBean/local";
	public Collection<Banco> listarBancos();
	

}
