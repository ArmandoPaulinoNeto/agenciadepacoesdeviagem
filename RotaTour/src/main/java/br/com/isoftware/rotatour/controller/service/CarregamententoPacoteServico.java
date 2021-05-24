package br.com.isoftware.rotatour.controller.service;

import br.com.isoftware.rotatour.domain.Conteudo;
import br.com.isoftware.rotatour.model.repository.CarregamententoPacoteRepository;

public class CarregamententoPacoteServico {
	
	CarregamententoPacoteRepository carregamententoPacoteRepository = new CarregamententoPacoteRepository();
	
	public Conteudo carregamententoPacote(Long codigo){
		return carregamententoPacoteRepository.conteudoPacote(codigo);
	}
}
