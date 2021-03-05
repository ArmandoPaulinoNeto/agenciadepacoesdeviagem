package br.com.isoftware.rotatour.controller.service;

import br.com.isoftware.rotatour.controller.iservice.IAcompanhanteServico;
import br.com.isoftware.rotatour.domain.Acompanhantes;
import br.com.isoftware.rotatour.model.repository.AcompanhanteRepository;

public class AcompanhanteServico implements IAcompanhanteServico{
	
	AcompanhanteRepository repository = new AcompanhanteRepository();
	
	public void cadastrarAcompanhante(Acompanhantes acompanhante) {
		
		repository.salvar(acompanhante);
	}
}
