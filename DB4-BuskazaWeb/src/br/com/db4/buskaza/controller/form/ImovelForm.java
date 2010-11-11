package br.com.db4.buskaza.controller.form;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.util.LoggerUtil;


public class ImovelForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Imovel imovelEntity;
	
	private FormFile planta;
	
	private FormFile arquivoFoto;
	
	private List<FormFile> fotos;
	
	private int indexFotos;
	
	private Collection<Equipamento> equipamentos;
	
	private Integer capacidade;
	
	private Integer quartos;
	
	private Integer camas;
	
	private Integer idiomas;
	
	private boolean transportePublico;
	
	private double metragem;
	
	private double distanciaCentro;
	
	private String linkGoogleMaps;
	
	private Integer estado;
	
	private Integer pais;
	
	private String municipio;
	
	private String complemento;
	
	private String logradouro;
	
	public FormFile getArquivoFoto( int in ) {
        return this.arquivoFoto;
    }
	
    public int getIndexFotos() {
		return indexFotos;
	}
    
	public void setIndexFotos(int indexFotos) {
		this.indexFotos = indexFotos;
	}

    public void setArquivoFoto( int in, FormFile t ) {
        try {
            this.arquivoFoto = t;
            setFotos( t );
            this.indexFotos++;
        } catch ( Exception e ) {
            LoggerUtil.error( "Ocorreu um erro ao atribuir arquivos de um documento", e );
        }
    }

    public List<FormFile> getFotos() {
        return this.fotos;
    }
   
    public void setFotos( FormFile t ) {
        this.fotos.add( this.indexFotos, t );
    }
	
	public Integer getPais() {
		return pais;
	}

	public void setPais(Integer pais) {
		this.pais = pais;
	}

	public Imovel getImovelEntity() {
		return imovelEntity;
	}

	public void setImovelEntity(Imovel imovelEntity) {
		this.imovelEntity = imovelEntity;
	}

	public FormFile getPlanta() {
		return planta;
	}

	public void setPlanta(FormFile planta) {
		this.planta = planta;
	}


	public Collection<Equipamento> getEquipamentos() {
		return equipamentos;
	}

	public void setEquipamentos(Collection<Equipamento> equipamentos) {
		this.equipamentos = equipamentos;
	}

	public Integer getCapacidade() {
		return capacidade;
	}

	public void setCapacidade(Integer capacidade) {
		this.capacidade = capacidade;
	}

	public Integer getQuartos() {
		return quartos;
	}

	public void setQuartos(Integer quartos) {
		this.quartos = quartos;
	}

	public Integer getCamas() {
		return camas;
	}

	public void setCamas(Integer camas) {
		this.camas = camas;
	}

	public Integer getIdiomas() {
		return idiomas;
	}

	public void setIdiomas(Integer idiomas) {
		this.idiomas = idiomas;
	}

	public boolean isTransportePublico() {
		return transportePublico;
	}

	public void setTransportePublico(boolean transportePublico) {
		this.transportePublico = transportePublico;
	}

	public double getMetragem() {
		return metragem;
	}

	public void setMetragem(double metragem) {
		this.metragem = metragem;
	}

	public double getDistanciaCentro() {
		return distanciaCentro;
	}

	public void setDistanciaCentro(double distanciaCentro) {
		this.distanciaCentro = distanciaCentro;
	}

	public String getLinkGoogleMaps() {
		return linkGoogleMaps;
	}

	public void setLinkGoogleMaps(String linkGoogleMaps) {
		this.linkGoogleMaps = linkGoogleMaps;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public String getMunicipio() {
		return municipio;
	}

	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	
	public ImovelForm(){
		imovelEntity = new Imovel();
		imovelEntity.setEstado(new Estado());
		
		this.indexFotos = 0;
		this.fotos = new ArrayList<FormFile>();
	}	
	
}

