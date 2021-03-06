package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_imovel")
public class Imovel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "id_imovel")
	private Integer codigo;
		
	@OneToMany(cascade = { CascadeType.PERSIST }, fetch=FetchType.EAGER)	
	@JoinColumn(referencedColumnName="id_imovel",name="id_imovel")  
	private Collection<Foto> fotos;
	
	@OneToMany(fetch=FetchType.LAZY)	
	@JoinColumn(referencedColumnName="id_imovel",name="id_imovel")  
	private Set<Anuncio> anuncios;
	
	@OneToMany(fetch=FetchType.LAZY)	
	@JoinColumn(referencedColumnName="id_imovel",name="id_imovel")  
	private Set<Reserva> reservas;
	
	@OneToMany(fetch=FetchType.LAZY)	
	@JoinColumn(referencedColumnName="id_imovel",name="id_imovel")  
	private Set<Bloqueio> bloqueios;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_planta")
	private Planta planta;
	
	private int capacidade;
	
	private int quartos;
	
	private int camas;	
	
	private boolean transportePublico;
	
	private double metragem;
	
	private double distanciaCentro;
	
	@Lob
	private String linkGoogleMaps;
	
	@OneToOne
	@JoinColumn(name = "id_estado")
	private Estado estado;
	
	@OneToOne
	@JoinColumn(name = "id_pais")
	private Pais pais;
	
	private String municipio;
	
	private String complemento;
	
	private String bairro;
	
	private Integer numero;	
	
	private String logradouro;
	
	@ManyToMany(fetch = FetchType.LAZY)	
	@JoinTable(name ="tb_imovel_equipamento")    
	private Set<Equipamento> equipamentos;
	
	@ManyToMany(fetch = FetchType.LAZY)	
	@JoinTable(name ="tb_imovel_tipo_pagamento")    
	private Set<TipoPagamento> tiposPagamento;
	
	private double energia;
	
	private double internet;
	
	private double diarista;
	
	private String outraTaxaExtra; 
	
	private String condicoes;
	
	private double calcao;
	
	@Transient
	private String primeirafoto;
	
	@Temporal(TemporalType.TIME) 
	private Date checkInEntrada;
	
	@Temporal(TemporalType.TIME)
	private Date checkInSaida;
	
	@Temporal(TemporalType.TIME)
	private Date checkOutEntrada;
	
	@Temporal(TemporalType.TIME)
	private Date checkOutSaida; 
	
	@Temporal(TemporalType.TIME)
	private Date lateCheckOut;
	
	private String nomeCheckIn;
	
	private String telefone;
	
	private String telefone2;
	
	private String recepcionista;
		
	private Integer status = 0;// 0 - Em avalia��o /  1 - Aprovado para anuncios sem complemento /2 - Aprovado para anuncios com complemento 3 - Pendente 
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="id_usuario_proprietario")
	private Usuario usuarioProprietario;
	
	private String cep;
	
	@OneToOne
	@JoinColumn(name = "id_tipo_imovel")
	private TipoImovel tipoImovel;
	
	@Lob
	private String linkYouTube;
	
	@ManyToMany(fetch = FetchType.LAZY)	
	@JoinTable(name ="tb_imovel_idioma")    
	private Set<Idioma> idiomas;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCadastro;
	
	private boolean metro;
	
	private boolean onibus;
	
	private boolean trem;
	
	private boolean permiteOpcaoPagamento;
	
	/* NOVOS CAMPOS - 16-04-2011*/
	
	private String ddd;
	
	private String ddd2;
	
	private String emailCheckin;
	
	private String emailCheckin2;
	
	private double taxaAgua;
	
	private double taxaGas;
	
	private double taxaLateCheckout;
	
	private double taxaLateCheckin;
	
	/*****************************/
	
	
	/* adicionado pelo Otavio 13/05/2011 */
	
	private boolean prePagamento;
	private String preAgencia;	
	private String preBanco;	
	private String preNumBanco;	
	private String preTitular;	
	private double prePercentual;
	private double prePercentual2;
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
	
	
	public void setPrePercentual(double prePercentual) {
		this.prePercentual = prePercentual;
	}
	public double getPrePercentual() {
		return prePercentual;
	}
	
	
	public void setPrePercentual2(double prePercentual2) {
		this.prePercentual2 = prePercentual2;
	}
	public double getPrePercentual2() {
		return prePercentual2;
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
	
	
	/* adicionado pelo Otavio 13/05/2011 */
	
	
	
	
	
	
	
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

	public double getTaxaAgua() {
		return taxaAgua;
	}

	public void setTaxaAgua(double taxaAgua) {
		this.taxaAgua = taxaAgua;
	}

	public double getTaxaGas() {
		return taxaGas;
	}

	public void setTaxaGas(double taxaGas) {
		this.taxaGas = taxaGas;
	}

	public double getTaxaLateCheckout() {
		return taxaLateCheckout;
	}

	public void setTaxaLateCheckout(double taxaLateCheckout) {
		this.taxaLateCheckout = taxaLateCheckout;
	}

	public double getTaxaLateCheckin() {
		return taxaLateCheckin;
	}

	public void setTaxaLateCheckin(double taxaLateCheckin) {
		this.taxaLateCheckin = taxaLateCheckin;
	}

	public Set<Bloqueio> getBloqueios() {
		return bloqueios;
	}

	public void setBloqueios(Set<Bloqueio> bloqueios) {
		this.bloqueios = bloqueios;
	}

	public boolean isPermiteOpcaoPagamento() {
		return permiteOpcaoPagamento;
	}

	public void setPermiteOpcaoPagamento(boolean permiteOpcaoPagamento) {
		this.permiteOpcaoPagamento = permiteOpcaoPagamento;
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

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

	public String getLinkYouTube() {
		return linkYouTube;
	}

	public void setLinkYouTube(String linkYouTube) {
		this.linkYouTube = linkYouTube;
	}

	public TipoImovel getTipoImovel() {
		return tipoImovel;
	}

	public void setTipoImovel(TipoImovel tipoImovel) {
		this.tipoImovel = tipoImovel;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
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

	public String getOutro() {
		return outraTaxaExtra;
	}

	public void setOutro(String outro) {
		this.outraTaxaExtra = outro;
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

	public Date getCheckInEntrada() {
		return checkInEntrada;
	}

	public void setCheckInEntrada(Date checkInEntrada) {
		this.checkInEntrada = checkInEntrada;
	}

	public Date getCheckInSaida() {
		return checkInSaida;
	}

	public void setCheckInSaida(Date checkInSaida) {
		this.checkInSaida = checkInSaida;
	}

	public Date getCheckOutEntrada() {
		return checkOutEntrada;
	}

	public void setCheckOutEntrada(Date checkOutEntrada) {
		this.checkOutEntrada = checkOutEntrada;
	}

	public Date getCheckOutSaida() {
		return checkOutSaida;
	}

	public void setCheckOutSaida(Date checkOutSaida) {
		this.checkOutSaida = checkOutSaida;
	}

	public Date getLateCheckOut() {
		return lateCheckOut;
	}

	public void setLateCheckOut(Date lateCheckOut) {
		this.lateCheckOut = lateCheckOut;
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
	
	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
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

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public Collection<Foto> getFotos() {
		return fotos;
	}

	public void setFotos(Collection<Foto> fotos) {
		this.fotos = fotos;
	}

	public Planta getPlanta() {
		return planta;
	}

	public void setPlanta(Planta planta) {
		this.planta = planta;
	}

	public int getCapacidade() {
		return capacidade;
	}

	public void setCapacidade(int capacidade) {
		this.capacidade = capacidade;
	}

	public int getQuartos() {
		return quartos;
	}

	public void setQuartos(int quartos) {
		this.quartos = quartos;
	}

	public int getCamas() {
		return camas;
	}

	public void setCamas(int camas) {
		this.camas = camas;
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

	public Set<Equipamento> getEquipamentos() {
		return equipamentos;
	}

	public void setEquipamentos(Set<Equipamento> equipamentos) {
		this.equipamentos = equipamentos;
	}
	
	public Set<TipoPagamento> getTiposPagamento() {
		return tiposPagamento;
	}

	public void setTiposPagamento(Set<TipoPagamento> tiposPagamento) {
		this.tiposPagamento = tiposPagamento;
	}

	public Usuario getUsuarioProprietario() {
		return usuarioProprietario;
	}

	public void setUsuarioProprietario(Usuario usuarioProprietario) {
		this.usuarioProprietario = usuarioProprietario;
	}

	public String getPrimeirafoto() {
		if(this.fotos!= null && this.fotos.size() > 0){
			primeirafoto = this.fotos.iterator().next().getCaminhoThumbnail();
		}
		
		return primeirafoto;
	}

	public void setPrimeirafoto(String primeirafoto) {
		this.primeirafoto = primeirafoto;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getOutraTaxaExtra() {
		return outraTaxaExtra;
	}

	public void setOutraTaxaExtra(String outraTaxaExtra) {
		this.outraTaxaExtra = outraTaxaExtra;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}


	public Set<Idioma> getIdiomas() {
		return idiomas;
	}

	public void setIdiomas(Set<Idioma> idiomas) {
		this.idiomas = idiomas;
	}
	
	
	public String getTelefone2() {
		return telefone2;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public Set<Anuncio> getAnuncios() {
		return anuncios;
	}

	public void setAnuncios(Set<Anuncio> anuncios) {
		this.anuncios = anuncios;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public Set<Reserva> getReservas() {
		return reservas;
	}

	public void setReservas(Set<Reserva> reservas) {
		this.reservas = reservas;
	}

	

	
	
	
}
