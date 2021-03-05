package br.com.isoftware.rotatour.controller.service;

import br.com.isoftware.rotatour.controller.iservice.IViagemServico;
import br.com.isoftware.rotatour.domain.Viagem;
import br.com.isoftware.rotatour.model.repository.ViagemRepository;

public class ViagemServico implements IViagemServico {
	
	ViagemRepository viagemRepository = new ViagemRepository();
	
	public Viagem cadastrarViagem(Viagem viagem) {
			
		return viagemRepository.salvar(viagem);
	}
}
