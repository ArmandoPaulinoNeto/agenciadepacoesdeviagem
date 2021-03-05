package br.com.isoftware.rotatour.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
public class Viagem extends GenericDomain{
		
	public Viagem(Pacotes pacotes, Clientes cliente, String saida, Date data) {

		this.pacotesFK = pacotes;
		this.clienteFK = cliente;
		this.saida = saida;
		this.data = data;
	}
	
	@Column(length = 35, nullable = false)
	private String saida;
	
	@Temporal(TemporalType.DATE)
	private Date data;
	
	@OneToOne
	@JoinColumn(nullable = false)
	private Pacotes pacotesFK;
	
	@ManyToOne
	@JoinColumn(nullable = false)
	private Clientes clienteFK;	
	
	public String getSaida() {
		return saida;
	}

	public void setSaida(String saida) {
		this.saida = saida;
	}

	public Pacotes getViagemPacotesFK() {
		return pacotesFK;
	}

	public void setViagemPacotesFK(Pacotes pacotesFK) {
		this.pacotesFK = pacotesFK;
	}
	
	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}
	
}
