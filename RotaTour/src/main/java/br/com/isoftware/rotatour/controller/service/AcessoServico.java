package br.com.isoftware.rotatour.controller.service;

import br.com.isoftware.rotatour.domain.Acesso;
import br.com.isoftware.rotatour.model.repository.AcessoRepository;

public class AcessoServico {
	
	public Acesso cadastrarAcesso(Acesso acesso){
		
		AcessoRepository repository = new AcessoRepository();
			
		return repository.salvar(acesso);
	}
	
}
