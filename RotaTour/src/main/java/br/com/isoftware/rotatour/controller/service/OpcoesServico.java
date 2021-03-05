package br.com.isoftware.rotatour.controller.service;

import br.com.isoftware.rotatour.domain.Opcoes;
import br.com.isoftware.rotatour.model.repository.OpcoesRepository;

public class OpcoesServico {
	
	OpcoesRepository repository = new OpcoesRepository();
	
	public void cadastrarOpcoes(Opcoes opcoes) {
		
		repository.salvar(opcoes);
	}
}
