package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

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
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_estado")
	private Estado estado;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_pais")
	private Pais pais;
	
	private String municipio;
	
	private String complemento;
	
	private String logradouro;
	
	@ManyToMany(fetch = FetchType.LAZY)	
	@JoinTable(name ="tb_imovel_equipamento")    
	private Collection<Equipamento> equipamentos;
	
	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
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
