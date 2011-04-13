package br.com.db4.buskaza.controller.form;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.util.LoggerUtil;


public class ImovelForm extends ActionForm {

	/**
	 * 
	 */
	
	public ImovelForm(){
		imovelEntity = new Imovel();
		imovelEntity.setEstado(new Estado());
	
		this.indexFotos = 0;
		this.fotos = new ArrayList<FormFile>();
	}
	
	private static final long serialVersionUID = 1L;

	protected Imovel imovelEntity;
	
	private FormFile planta;
	
	private FormFile arquivoFoto;
	
	private List<FormFile> fotos;
	
	private int indexFotos;
	
	protected Integer[] equipamentos;
	
	protected Integer[] tiposPagamento;
	
	protected Integer capacidade;
	
	private Integer quartos;
	
	private Integer camas;
	
	private int[] idiomas;
	
	private boolean transportePublico;
	
	private double metragem;
	
	private double distanciaCentro;
	
	private String linkGoogleMaps;
	
	protected String estado;
	
	protected Integer pais;
	
	private String municipio;
	
	private String complemento;
	
	private String logradouro;
	
	private double energia;
	
	private double internet;
	
	private double diarista;
	
	private String outraTaxaExtra; 
	
	private String condicoes;
	
	private double calcao;
	
	private Integer checkInEntradaHora;
	
	private Integer checkInSaidaHora;
	
	private Integer checkOutEntradaHora;
	
	private Integer checkOutSaidaHora; 
	
	private Integer lateCheckOutHora;
	
	private Integer checkInEntradaMinuto;
	
	private Integer checkInSaidaMinuto;
	
	private Integer checkOutEntradaMinuto;
	
	private Integer checkOutSaidaMinuto; 
	
	private Integer lateCheckOutMinuto;
	
	private String nomeCheckIn;
	
	private String telefone;
	
	private String telefone2;
	
	private String email;
	
	private String email2;
	
	private String recepcionista;
		
	private String bairro;
	
	private String numero;
	
	private String cep;
	
	private Integer tipoImovel;
	
	private String linkYouTube;
	
	private String ddd;
	
	private String ddd2;
		
	//Campos para buscar imóveis pela data de anúncio
	
	private int diaDataInicialAnuncio;
	private int mesDataInicialAnuncio;
	private int anoDataInicialAnuncio;
	
	private int diaDataFinalAnuncio;
	private int mesDataFinalAnuncio;
	private int anoDataFinalAnuncio;
	
	private boolean metro;	
	private boolean onibus;	
	private boolean trem;
	
	protected Integer tiposAnuncio;
	
	
	
	public Integer getTiposAnuncio() {
		return tiposAnuncio;
	}

	public void setTiposAnuncio(Integer tiposAnuncio) {
		this.tiposAnuncio = tiposAnuncio;
	}

	public boolean isMetro() {
		return metro;
	}

	public void setMetro(boolean metro) {
		this.metro = metro;
	}

	public boolean isOnibus() {
		return onibus;
	}

	public void setOnibus(boolean onibus) {
		this.onibus = onibus;
	}

	public boolean isTrem() {
		return trem;
	}

	public void setTrem(boolean trem) {
		this.trem = trem;
	}

	public int getDiaDataInicialAnuncio() {
		return diaDataInicialAnuncio;
	}

	public void setDiaDataInicialAnuncio(int diaDataInicialAnuncio) {
		this.diaDataInicialAnuncio = diaDataInicialAnuncio;
	}

	public int getMesDataInicialAnuncio() {
		return mesDataInicialAnuncio;
	}

	public void setMesDataInicialAnuncio(int mesDataInicialAnuncio) {
		this.mesDataInicialAnuncio = mesDataInicialAnuncio;
	}

	public int getAnoDataInicialAnuncio() {
		return anoDataInicialAnuncio;
	}

	public void setAnoDataInicialAnuncio(int anoDataInicialAnuncio) {
		this.anoDataInicialAnuncio = anoDataInicialAnuncio;
	}

	public int getDiaDataFinalAnuncio() {
		return diaDataFinalAnuncio;
	}

	public void setDiaDataFinalAnuncio(int diaDataFinalAnuncio) {
		this.diaDataFinalAnuncio = diaDataFinalAnuncio;
	}

	public int getMesDataFinalAnuncio() {
		return mesDataFinalAnuncio;
	}

	public void setMesDataFinalAnuncio(int mesDataFinalAnuncio) {
		this.mesDataFinalAnuncio = mesDataFinalAnuncio;
	}

	public int getAnoDataFinalAnuncio() {
		return anoDataFinalAnuncio;
	}

	public void setAnoDataFinalAnuncio(int anoDataFinalAnuncio) {
		this.anoDataFinalAnuncio = anoDataFinalAnuncio;
	}
	
	//************************************
	
	public String getLinkYouTube() {
		return linkYouTube;
	}

	public void setLinkYouTube(String linkYouTube) {
		this.linkYouTube = linkYouTube;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public Integer getTipoImovel() {
		return tipoImovel;
	}

	public void setTipoImovel(Integer tipoImovel) {
		this.tipoImovel = tipoImovel;
	}

	public Integer getCheckInEntradaHora() {
		return checkInEntradaHora;
	}

	public void setCheckInEntradaHora(Integer checkInEntradaHora) {
		this.checkInEntradaHora = checkInEntradaHora;
	}

	public Integer getCheckInSaidaHora() {
		return checkInSaidaHora;
	}

	public void setCheckInSaidaHora(Integer checkInSaidaHora) {
		this.checkInSaidaHora = checkInSaidaHora;
	}

	public Integer getCheckOutEntradaHora() {
		return checkOutEntradaHora;
	}

	public void setCheckOutEntradaHora(Integer checkOutEntradaHora) {
		this.checkOutEntradaHora = checkOutEntradaHora;
	}

	public Integer getCheckOutSaidaHora() {
		return checkOutSaidaHora;
	}

	public void setCheckOutSaidaHora(Integer checkOutSaidaHora) {
		this.checkOutSaidaHora = checkOutSaidaHora;
	}

	public Integer getLateCheckOutHora() {
		return lateCheckOutHora;
	}

	public void setLateCheckOutHora(Integer lateCheckOutHora) {
		this.lateCheckOutHora = lateCheckOutHora;
	}

	public Integer getCheckInEntradaMinuto() {
		return checkInEntradaMinuto;
	}

	public void setCheckInEntradaMinuto(Integer checkInEntradaMinuto) {
		this.checkInEntradaMinuto = checkInEntradaMinuto;
	}

	public Integer getCheckInSaidaMinuto() {
		return checkInSaidaMinuto;
	}

	public void setCheckInSaidaMinuto(Integer checkInSaidaMinuto) {
		this.checkInSaidaMinuto = checkInSaidaMinuto;
	}

	public Integer getCheckOutEntradaMinuto() {
		return checkOutEntradaMinuto;
	}

	public void setCheckOutEntradaMinuto(Integer checkOutEntradaMinuto) {
		this.checkOutEntradaMinuto = checkOutEntradaMinuto;
	}

	public Integer getCheckOutSaidaMinuto() {
		return checkOutSaidaMinuto;
	}

	public void setCheckOutSaidaMinuto(Integer checkOutSaidaMinuto) {
		this.checkOutSaidaMinuto = checkOutSaidaMinuto;
	}

	public Integer getLateCheckOutMinuto() {
		return lateCheckOutMinuto;
	}

	public void setLateCheckOutMinuto(Integer lateCheckOutMinuto) {
		this.lateCheckOutMinuto = lateCheckOutMinuto;
	}

	public double getEnergia() {
		return energia;
	}

	public void setEnergia(double energia) {
		this.energia = energia;
	}

	public double getInternet() {
		return internet;
	}

	public void setInternet(double internet) {
		this.internet = internet;
	}

	public double getDiarista() {
		return diarista;
	}

	public void setDiarista(double diarista) {
		this.diarista = diarista;
	}

	public String getOutraTaxaExtra() {
		return outraTaxaExtra;
	}

	public void setOutraTaxaExtra(String outraTaxaExtra) {
		this.outraTaxaExtra = outraTaxaExtra;
	}

	public String getCondicoes() {
		return condicoes;
	}

	public void setCondicoes(String condicoes) {
		this.condicoes = condicoes;
	}

	public double getCalcao() {
		return calcao;
	}

	public void setCalcao(double calcao) {
		this.calcao = calcao;
	}

	public Integer getCheckInEntrada() {
		return checkInEntradaHora;
	}

	public void setCheckInEntrada(Integer checkInEntrada) {
		this.checkInEntradaHora = checkInEntrada;
	}

	public Integer getCheckInSaida() {
		return checkInSaidaHora;
	}

	public void setCheckInSaida(Integer checkInSaida) {
		this.checkInSaidaHora = checkInSaida;
	}

	public Integer getCheckOutEntrada() {
		return checkOutEntradaHora;
	}

	public void setCheckOutEntrada(Integer checkOutEntrada) {
		this.checkOutEntradaHora = checkOutEntrada;
	}

	public Integer getCheckOutSaida() {
		return checkOutSaidaHora;
	}

	public void setCheckOutSaida(Integer checkOutSaida) {
		this.checkOutSaidaHora = checkOutSaida;
	}

	public Integer getLateCheckOut() {
		return lateCheckOutHora;
	}

	public void setLateCheckOut(Integer lateCheckOut) {
		this.lateCheckOutHora = lateCheckOut;
	}

	public String getNomeCheckIn() {
		return nomeCheckIn;
	}

	public void setNomeCheckIn(String nomeCheckIn) {
		this.nomeCheckIn = nomeCheckIn;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getRecepcionista() {
		return recepcionista;
	}

	public void setRecepcionista(String recepcionista) {
		this.recepcionista = recepcionista;
	}
	
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public void setFotos(List<FormFile> fotos) {
		this.fotos = fotos;
	}

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


	public Integer[] getEquipamentos() {
		return equipamentos;
	}

	public void setEquipamentos(Integer[] equipamentos) {
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
	
	public int[] getIdiomas() {
		return idiomas;
	}

	
	public void setIdiomas(int[] idiomas) {
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

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
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
		
	
	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}
	
	public String getTelefone2() {
		return telefone2;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getDdd() {
		return ddd;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getDdd2() {
		return ddd2;
	}

	public void setDdd2(String ddd2) {
		this.ddd2 = ddd2;
	}

	public Integer[] getTiposPagamento() {
		return tiposPagamento;
	}

	public void setTiposPagamento(Integer[] tiposPagamento) {
		this.tiposPagamento = tiposPagamento;
	}

	
	
	
}

