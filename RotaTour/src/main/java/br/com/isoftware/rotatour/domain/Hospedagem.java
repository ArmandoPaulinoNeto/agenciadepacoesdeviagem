package br.com.isoftware.rotatour.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
public class Hospedagem extends GenericDomain{

	@Column(length = 10, nullable = false)
	private String hotel;
	
	@Temporal(TemporalType.DATE)
	private Date chegada;
	
	@Temporal(TemporalType.DATE)
	private Date saida;
	
	@Column(length = 5, nullable = false)
	private String quarto;
	
	@Column(length = 10, nullable = false)
	private String andar;
	
	@Column(length = 5, nullable = false)
	private String numero;
	
	@OneToOne
	@JoinColumn(nullable = false)
	private Pacotes PacotesFK;

	public String getHotel() {
		return hotel;
	}

	public void setHotel(String hotel) {
		this.hotel = hotel;
	}

	public Date getChegada() {
		return chegada;
	}

	public void setChegada(Date chegada) {
		this.chegada = chegada;
	}

	public Date getSaida() {
		return saida;
	}

	public void setSaida(Date saida) {
		this.saida = saida;
	}

	public String getQuarto() {
		return quarto;
	}

	public void setQuarto(String quarto) {
		this.quarto = quarto;
	}

	public String getAndar() {
		return andar;
	}

	public void setAndar(String andar) {
		this.andar = andar;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}
	
	public Pacotes getHospedagemPacotesFK() {
		return PacotesFK;
	}

	public void setHospedagemPacotesFK(Pacotes hospedagemPacotesFK) {
		this.PacotesFK = hospedagemPacotesFK;
	}

}
