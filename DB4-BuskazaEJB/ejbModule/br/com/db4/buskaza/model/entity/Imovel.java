package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_imovel")
public class Imovel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "id_imovel")
	private Integer codigo;
	
	@OneToMany(fetch = FetchType.LAZY)	
	@JoinTable(name ="tb_foto")
	@JoinColumn(name = "id_foto")
	private Collection<Foto> fotos;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_planta")
	private Planta planta;
	
	private int capacidade;
	
	private int quartos;
	
	private int camas;
	
	private int idiomas;
	
	private boolean transportePublico;
	
	private double metragem;
	
	private double distanciaCentro;
	
	private String linkGoogleMaps;
	
	@OneToOne
	@JoinColumn(name = "id_estado")
	private Estado estado;
	
	private String municipio;
	
	private String complemento;
	
	private String logradouro;
	
	@ManyToMany(fetch = FetchType.LAZY)	
	@JoinTable(name ="tb_imovel_equipamento")    
	private Collection<Equipamento> equipamentos;
	
	private double energia;
	
	private double internet;
	
	private double diarista;
	
	private String outraTaxaExtra; 
	
	private String condicoes;
	
	private double calcao;
	
	private Date checkInEntrada;
	
	private Date checkInSaida;
	
	private Date checkOutEntrada;
	
	private Date checkOutSaida; 
	
	private Date lateCheckOut;
	
	private String nomeCheckIn;
	
	private String telefone;
	
	private String recepcionista;
	
	private double tarifaDiaria; 
	
	private double tarifaSemanal;
	
	private double tarifaQuinzenal;
	
	private double tarifaMensal;
	
	private String tarifaEspecialDescricao;
	
	private double tarifaEspecialValor; 
	
	
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

	public int getIdiomas() {
		return idiomas;
	}

	public void setIdiomas(int idiomas) {
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

	public Collection<Equipamento> getEquipamentos() {
		return equipamentos;
	}

	public void setEquipamentos(Collection<Equipamento> equipamentos) {
		this.equipamentos = equipamentos;
	}
	
	
}
