package br.com.db4.buskaza.controller.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;


public class FotoForm extends ActionForm{

	private Integer codigo;
	
	private FormFile arquivoFoto;
	
	private String caminho;
	
	private String caminhoThumbnail;

	
	
	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public FormFile getArquivoFoto() {
		return arquivoFoto;
	}

	public void setArquivoFoto(FormFile arquivoFoto) {
		this.arquivoFoto = arquivoFoto;
	}

	public String getCaminho() {
		return caminho;
	}

	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

	public String getCaminhoThumbnail() {
		return caminhoThumbnail;
	}

	public void setCaminhoThumbnail(String caminhoThumbnail) {
		this.caminhoThumbnail = caminhoThumbnail;
	}
	
	
}
