package br.com.isoftware.rotatour.controller.service;

import br.com.isoftware.rotatour.controller.iservice.IPagamentoServico;
import br.com.isoftware.rotatour.domain.Pagamento;
import br.com.isoftware.rotatour.model.repository.PagamentoRepository;

public class PagamentoServico implements IPagamentoServico{

	PagamentoRepository pagamentoRepository = new PagamentoRepository();
	
	public Pagamento cadastrarPagamento(Pagamento pagamento) {		
		
		return pagamentoRepository.salvar(pagamento);	
	}
}
