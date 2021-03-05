package br.com.isoftware.rotatour.controller.service;

import br.com.isoftware.rotatour.controller.iservice.ICompraServico;
import br.com.isoftware.rotatour.domain.Compra;
import br.com.isoftware.rotatour.model.repository.CompraRepository;

public class CompraServico implements ICompraServico{
	
    CompraRepository compraRepository = new CompraRepository();
	
	public void cadastrarCompra(Compra compra) {
		
		compraRepository.salvar(compra);
	}
}
