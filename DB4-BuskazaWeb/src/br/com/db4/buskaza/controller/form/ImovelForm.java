package br.com.db4.buskaza.controller.form;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Pais;
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
	
	private Integer[] equipamentos;
	
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
	
	private String recepcionista;
	
	private double tarifaDiaria; 
	
	private double tarifaSemanal;
	
	private double tarifaQuinzenal;
	
	private double tarifaMensal;
	
	private String tarifaEspecialDescricao;
	
	private double tarifaEspecialValor; 

	
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

	public double getTarifaDiaria() {
		return tarifaDiaria;
	}

	public void setTarifaDiaria(double tarifaDiaria) {
		this.tarifaDiaria = tarifaDiaria;
	}

	public double getTarifaSemanal() {
		return tarifaSemanal;
	}

	public void setTarifaSemanal(double tarifaSemanal) {
		this.tarifaSemanal = tarifaSemanal;
	}

	public double getTarifaQuinzenal() {
		return tarifaQuinzenal;
	}

	public void setTarifaQuinzenal(double tarifaQuinzenal) {
		this.tarifaQuinzenal = tarifaQuinzenal;
	}

	public double getTarifaMensal() {
		return tarifaMensal;
	}

	public void setTarifaMensal(double tarifaMensal) {
		this.tarifaMensal = tarifaMensal;
	}

	public String getTarifaEspecialDescricao() {
		return tarifaEspecialDescricao;
	}

	public void setTarifaEspecialDescricao(String tarifaEspecialDescricao) {
		this.tarifaEspecialDescricao = tarifaEspecialDescricao;
	}

	public double getTarifaEspecialValor() {
		return tarifaEspecialValor;
	}

	public void setTarifaEspecialValor(double tarifaEspecialValor) {
		this.tarifaEspecialValor = tarifaEspecialValor;
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

