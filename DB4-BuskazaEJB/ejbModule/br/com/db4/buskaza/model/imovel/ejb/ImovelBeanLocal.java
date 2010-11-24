package br.com.db4.buskaza.model.imovel.ejb;

import java.util.List;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Pais;

@Local
public interface ImovelBeanLocal {

	public static String LOCAL = "ejb/ImovelBean/local";
	
	public Integer incluirImovel(Imovel imovel);
	
	public void altualiza(Imovel imovel);
	
	public List<Imovel> buscarImovel(Imovel imovel);
}
