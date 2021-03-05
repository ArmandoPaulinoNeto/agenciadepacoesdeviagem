package br.com.isoftware.rotatour.domain;

import javax.persistence.Column;
import javax.persistence.Entity;

@SuppressWarnings("serial")
@Entity
public class Imagens extends GenericDomain{
	
	@Column(length = 25, nullable = false)
	private String imagem;
	
	@Column(nullable = false)
	private Long imagemPacotesFK;

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	
	public Long getImagemPacotesFK() {
		return imagemPacotesFK;
	}

	public void setImagemPacotesFK(Long imagemPacotesFK) {
		this.imagemPacotesFK = imagemPacotesFK;
	}
	
}
