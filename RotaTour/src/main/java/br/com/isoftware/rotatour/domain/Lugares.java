package br.com.isoftware.rotatour.domain;

import javax.persistence.Column;
import javax.persistence.Entity;

import org.hibernate.annotations.Type;

@SuppressWarnings("serial")
@Entity
public class Lugares extends GenericDomain{
	
	@Column(length = 25, nullable = false)
	private String pais;
	
	@Column(length = 25, nullable = false)
	private String capital;
	
	@Column(length = 25, nullable = false)
	private String cidade;
	
	@Column(columnDefinition = "TEXT")
	private String detalhe;
	
	@Column(length = 15, nullable = false)
	private String moeda;

	@Column(length = 25, nullable = false)
	private String imagem;
	
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getCapital() {
		return capital;
	}
	public void setCapital(String capital) {
		this.capital = capital;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getDetalhe() {
		return detalhe;
	}
	public void setDetalhe(String detalhe) {
		this.detalhe = detalhe;
	}
	public String getMoeda() {
		return moeda;
	}
	public void setMoeda(String moeda) {
		this.moeda = moeda;
	}
	public String getImagem() {
		return imagem;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}	
}
