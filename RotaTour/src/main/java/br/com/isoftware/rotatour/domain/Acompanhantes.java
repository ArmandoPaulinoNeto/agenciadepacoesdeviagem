package br.com.isoftware.rotatour.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
public class Acompanhantes extends GenericDomain{
	
	public Acompanhantes(Clientes cliente, String nome, Date data) {
		
		this.clientesFK = cliente;
		this.nome = nome;
		this.dataNacimento = data;
	}
	@Column(length = 45, nullable = false)
	private String nome;
	
	@Temporal(TemporalType.DATE)
	private Date dataNacimento;
	
	@ManyToOne
	@JoinColumn
	private Clientes clientesFK;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataNacimento() {
		return dataNacimento;
	}

	public void setDataNacimento(Date dataNacimento) {
		this.dataNacimento = dataNacimento;
	}

	public Clientes getClientesFK() {
		return clientesFK;
	}

	public void setClientesFK(Clientes clientesFK) {
		this.clientesFK = clientesFK;
	}
	
}
