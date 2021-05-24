package br.com.isoftware.rotatour.controller.service;

import java.util.List;

import br.com.isoftware.rotatour.domain.CarregamententoIndex;
import br.com.isoftware.rotatour.model.repository.CarregamententoIndexRepository;

public class CarregamententoIndexServico {
	
	CarregamententoIndexRepository carregamententoIndexRepository = new CarregamententoIndexRepository();
	
	public List<CarregamententoIndex> carregamententoIndex(){
		return carregamententoIndexRepository.conteudoIndex();
	}
}
