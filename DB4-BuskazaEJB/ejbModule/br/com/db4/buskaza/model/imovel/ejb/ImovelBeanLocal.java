package br.com.db4.buskaza.model.imovel.ejb;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Imovel;

@Local
public interface ImovelBeanLocal {

	public static String LOCAL = "ejb/ImovelBean/local";
	
	public Integer incluirImovel(Imovel imovel);
	
	public void altualiza(Imovel imovel);
}
