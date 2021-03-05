package br.com.isoftware.rotatour.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
public class Opcoes extends GenericDomain{
		
	public Opcoes(Viagem viagem, Date data) {
		this.viagemFK = viagem;
		this.data = data;
	}
	
	@Temporal(TemporalType.DATE)
	private Date data;
	
	@ManyToOne
	@JoinColumn
	private Viagem viagemFK;
	
	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Viagem getViagemFK() {
		return viagemFK;
	}

	public void setViagemFK(Viagem opcaoViagemFK) {
		this.viagemFK = opcaoViagemFK;
	}	
}
