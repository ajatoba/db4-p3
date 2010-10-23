package br.com.db4.buskaza.model.locador.ejb;
import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Locador;

@Local
public interface LocadorBeanLocal {
	
	public static String LOCAL = "ejb/LocadorBean/local";
	
	public Integer incluirLocador(Locador locador);
	
	public Boolean existeCNPJCPF(String cnpjcpf);
}
