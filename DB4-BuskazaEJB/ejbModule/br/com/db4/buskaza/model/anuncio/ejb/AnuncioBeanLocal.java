package br.com.db4.buskaza.model.anuncio.ejb;

import java.util.List;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Anuncio;

@Local
public interface AnuncioBeanLocal {

	public static String LOCAL = "ejb/AnuncioBean/local";
	
	public List<Anuncio> listarAnuncios(Integer usuarioProprietario);
	
	public List<Anuncio> listarAnunciosImovel(Integer codigoImovel, int mes, int ano);
	
	public Integer incluirAnuncio(Anuncio anuncio);
	
	public Anuncio getAnuncio(Integer codigoAnuncio);
	
	public void excluirAnuncio(Anuncio anuncio);

}
