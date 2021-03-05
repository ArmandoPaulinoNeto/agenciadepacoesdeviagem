package br.com.isoftware.rotatour.controller.service;
import br.com.isoftware.rotatour.controller.iservice.ICartaoServico;
import br.com.isoftware.rotatour.domain.Cartao;
import br.com.isoftware.rotatour.model.repository.CartaoRepository;

public class CartaoServico implements ICartaoServico{

	CartaoRepository clienteRepository = new CartaoRepository();
	
	public void cadastrarCartao(Cartao cartao) {
		
		clienteRepository.salvar(cartao);	
	}	
}
