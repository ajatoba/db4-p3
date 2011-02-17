package br.com.db4.buskaza.model.imovel.ejb;

import java.util.List;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Imovel;

@Local
public interface ImovelBeanLocal {

	public static String LOCAL = "ejb/ImovelBean/local";
	
	public Integer incluirImovel(Imovel imovel);
	
	public Integer alterarImovel(Imovel imovel);
	
	public void altualiza(Imovel imovel);
	
	public List<Imovel> buscarImovel(Imovel imovel, Integer codigoPais);
	
	public List<Imovel> listarImoveis(Integer usuarioProprietario);
	
	public Imovel getImovel(Integer codigoImovel);
	
	public List<Imovel> listarImoveisPorStatus(int Status);
}
