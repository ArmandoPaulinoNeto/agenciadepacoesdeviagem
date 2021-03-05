package br.com.isoftware.rotatour.controller.service;

import br.com.isoftware.rotatour.domain.Parcelamento;
import br.com.isoftware.rotatour.model.repository.ParcelamentoRepository;

public class ParcelamentoServico {
	
	ParcelamentoRepository parcelamentoRepository = new ParcelamentoRepository();
	
	public void cadastrarParcelamento(Parcelamento parcelamento) {
		
		parcelamentoRepository.salvar(parcelamento);
	}
}
