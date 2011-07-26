package br.com.db4.buskaza.controller.form;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Estado;
import br.com.db4.buskaza.model.entity.Idioma;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.TipoPagamento;
import br.com.db4.buskaza.model.util.LoggerUtil;

public class ImovelForm extends ActionForm {

	/**
	 * 
	 */

	public ImovelForm() {
		imovelEntity = new Imovel();
		imovelEntity.setEstado(new Estado());
		imovelEntity.setIdiomas(new HashSet<Idioma>());
		imovelEntity.setCamas(new Integer(0).intValue());
		imovelEntity.setEquipamentos(new HashSet<Equipamento>());
		imovelEntity.setTiposPagamento(new HashSet<TipoPagamento>());

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

	private Integer[] idiomas;

	private boolean transportePublico;

	private String metragem;

	private String distanciaCentro;

	private String linkGoogleMaps;

	protected String estado;

	protected Integer pais;

	private String municipio;

	private String complemento;

	private String logradouro;

	private String energia;

	private String internet;

	private String diarista;

	private String outraTaxaExtra;

	private String condicoes;

	private String calcao;

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

	// Campos para buscar im�veis pela data de an�ncio

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

	/* NOVOS CAMPOS - 16-04-2011 */

	private String emailCheckin;

	private String emailCheckin2;

	private String taxaAgua;

	private String taxaGas;

	private String taxaLateCheckout;

	private String taxaLateCheckin;

	/*****************************/

	/* adionado pelo Otavio 13/05/2011 */

	private boolean prePagamento;
	private String preAgencia;
	private String preBanco;
	private String preNumBanco;
	private String preTitular;
	private String prePercentual;
	private String prePercentual2;
	private String preEmailPayPal;
	private String preCpf;
	private String preContaCorrente;
	private Integer preCheckIn;
	private Integer preCheckIn2;

	public boolean isPrePagamento() {
		return prePagamento;
	}

	public void setPrePagamento(boolean prePagamento) {
		this.prePagamento = prePagamento;
	}

	public String getPreAgencia() {
		return preAgencia;
	}

	public void setPreAgencia(String preAgencia) {
		this.preAgencia = preAgencia;
	}

	public String getPreBanco() {
		return preBanco;
	}

	public void setPreBanco(String preBanco) {
		this.preBanco = preBanco;
	}

	public String getPreNumBanco() {
		return preNumBanco;
	}

	public void setPreNumBanco(String preNumBanco) {
		this.preNumBanco = preNumBanco;
	}

	public String getPreTitular() {
		return preTitular;
	}

	public void setPreTitular(String preTitular) {
		this.preTitular = preTitular;
	}

	public String getPreEmailPayPal() {
		return preEmailPayPal;
	}

	public void setPreEmailPayPal(String preEmailPayPal) {
		this.preEmailPayPal = preEmailPayPal;
	}

	public String getPreCpf() {
		return preCpf;
	}

	public void setPreCpf(String preCpf) {
		this.preCpf = preCpf;
	}

	public String getPreContaCorrente() {
		return preContaCorrente;
	}

	public void setPreContaCorrente(String preContaCorrente) {
		this.preContaCorrente = preContaCorrente;
	}

	public Integer getPreCheckIn() {
		return preCheckIn;
	}

	public void setPreCheckIn(Integer preCheckIn) {
		this.preCheckIn = preCheckIn;
	}

	public Integer getPreCheckIn2() {
		return preCheckIn2;
	}

	public void setPreCheckIn2(Integer preCheckIn2) {
		this.preCheckIn2 = preCheckIn2;
	}

	/* adionado pelo Otavio 13/05/2011 */

	public Integer getTiposAnuncio() {
		return tiposAnuncio;
	}

	public FormFile getArquivoFoto() {
		return arquivoFoto;
	}

	public void setArquivoFoto(FormFile arquivoFoto) {
		this.arquivoFoto = arquivoFoto;
	}

	public String getEmailCheckin() {
		return emailCheckin;
	}

	public void setEmailCheckin(String emailCheckin) {
		this.emailCheckin = emailCheckin;
	}

	public String getEmailCheckin2() {
		return emailCheckin2;
	}

	public void setEmailCheckin2(String emailCheckin2) {
		this.emailCheckin2 = emailCheckin2;
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

	// ************************************

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

	public FormFile getArquivoFoto(int in) {
		return this.arquivoFoto;
	}

	public int getIndexFotos() {
		return indexFotos;
	}

	public void setIndexFotos(int indexFotos) {
		this.indexFotos = indexFotos;
	}

	public void setArquivoFoto(int in, FormFile t) {
		try {
			this.arquivoFoto = t;
			setFotos(t);
			this.indexFotos++;
		} catch (Exception e) {
			LoggerUtil.error("Ocorreu um erro ao atribuir arquivos de um documento", e);
		}
	}

	public List<FormFile> getFotos() {
		return this.fotos;
	}

	public void setFotos(FormFile t) {
		this.fotos.add(this.indexFotos, t);
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

	public Integer[] getIdiomas() {
		return idiomas;
	}

	public void setIdiomas(Integer[] idiomas) {
		this.idiomas = idiomas;
	}

	public boolean isTransportePublico() {
		return transportePublico;
	}

	public void setTransportePublico(boolean transportePublico) {
		this.transportePublico = transportePublico;
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

	public String getMetragem() {
		return metragem;
	}

	public void setMetragem(String metragem) {
		this.metragem = metragem;
	}

	public String getDistanciaCentro() {
		return distanciaCentro;
	}

	public void setDistanciaCentro(String distanciaCentro) {
		this.distanciaCentro = distanciaCentro;
	}

	public String getEnergia() {
		return energia;
	}

	public void setEnergia(String energia) {
		this.energia = energia;
	}

	public String getInternet() {
		return internet;
	}

	public void setInternet(String internet) {
		this.internet = internet;
	}

	public String getDiarista() {
		return diarista;
	}

	public void setDiarista(String diarista) {
		this.diarista = diarista;
	}

	public String getCalcao() {
		return calcao;
	}

	public void setCalcao(String calcao) {
		this.calcao = calcao;
	}

	public String getTaxaAgua() {
		return taxaAgua;
	}

	public void setTaxaAgua(String taxaAgua) {
		this.taxaAgua = taxaAgua;
	}

	public String getTaxaGas() {
		return taxaGas;
	}

	public void setTaxaGas(String taxaGas) {
		this.taxaGas = taxaGas;
	}

	public String getTaxaLateCheckout() {
		return taxaLateCheckout;
	}

	public void setTaxaLateCheckout(String taxaLateCheckout) {
		this.taxaLateCheckout = taxaLateCheckout;
	}

	public String getTaxaLateCheckin() {
		return taxaLateCheckin;
	}

	public void setTaxaLateCheckin(String taxaLateCheckin) {
		this.taxaLateCheckin = taxaLateCheckin;
	}

	public String getPrePercentual() {
		return prePercentual;
	}

	public void setPrePercentual(String prePercentual) {
		this.prePercentual = prePercentual;
	}

	public String getPrePercentual2() {
		return prePercentual2;
	}

	public void setPrePercentual2(String prePercentual2) {
		this.prePercentual2 = prePercentual2;
	}

}
