package br.com.db4.buskaza.model.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.CacheModeType;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;
import org.hibernate.validator.NotNull;

@Entity
@Table(name = "tb_reserva")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@NamedQueries( {
    @NamedQuery(name = "listarReservas", query = "select x from br.com.db4.buskaza.model.entity.Reserva x ", cacheable = true, cacheMode = CacheModeType.NORMAL)
})
public class Reserva implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id_reserva")
	private Integer codigo;
	
	@NotNull
	private Date periodoInicial;
	
	@NotNull
	private Date periodoFinal;
	
	@NotNull	
	private Date dataReserva;
	
	@NotNull
	private Integer status = 0; //0 - Em avaliação / 1 - Confirmada  / 2 - Cancelada / 3 -  Concluida 
	/* 
	  	novos STATUS vindos do MOIP
		1 autorizado
		2 iniciado
		3 boleto impresso
		4 concluido
		5 cancelado
		6 em análise
		7 estornado
	*/
	
	@OneToOne
	@ManyToOne
	@JoinColumn(name = "id_locatario")
	private Usuario locatario;
	
	@ManyToOne(cascade = { CascadeType.ALL }, fetch=FetchType.LAZY)	
	@JoinColumn(name = "id_imovel")	
	private Imovel imovel;

	private double valor;
	
	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public Imovel getImovel() {
		return imovel;
	}

	public void setImovel(Imovel imovel) {
		this.imovel = imovel;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public Date getPeriodoInicial() {
		return periodoInicial;
	}

	public void setPeriodoInicial(Date periodoInicial) {
		this.periodoInicial = periodoInicial;
	}

	public Date getPeriodoFinal() {
		return periodoFinal;
	}

	public void setPeriodoFinal(Date periodoFinal) {
		this.periodoFinal = periodoFinal;
	}

	public Date getDataReserva() {
		return dataReserva;
	}

	public void setDataReserva(Date dataReserva) {
		this.dataReserva = dataReserva;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Usuario getLocatario() {
		return locatario;
	}

	public void setLocatario(Usuario locatario) {
		this.locatario = locatario;
	}


}