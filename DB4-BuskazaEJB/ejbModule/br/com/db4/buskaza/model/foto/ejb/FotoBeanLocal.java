package br.com.db4.buskaza.model.foto.ejb;

import java.util.Collection;
import java.util.List;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Foto;
import br.com.db4.buskaza.model.entity.Imovel;

@Local
public interface FotoBeanLocal {
	
	public static String LOCAL = "ejb/FotoBean/local";

	
	public Foto alterarFoto(Foto foto);
	
	public List<Foto> listFotosImovel(Integer codigImovel);
	
	public void excluirFoto(Foto foto);
	
}
