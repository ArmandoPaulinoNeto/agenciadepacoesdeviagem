package br.com.isoftware.rotatour.controller.service;

import java.util.List;

import br.com.isoftware.rotatour.controller.iservice.IClientesServico;
import br.com.isoftware.rotatour.domain.Clientes;
import br.com.isoftware.rotatour.model.repository.ClientesRepository;

public class ClienteServico implements IClientesServico{           
	
	ClientesRepository clienteRepository = new ClientesRepository();
	
	public Clientes cadastrarCliente(Clientes cliente) {
		
		return clienteRepository.salvar(cliente);	
	}
	//********busca Cliente por nome****************
	public List<Clientes> pesquisarCliente(String nome) {
		// TODO Auto-generated method stub
		return clienteRepository.buscarPorNome(nome);
	}
	//********busca Cliente por id****************
	public Clientes pesquisarCliente(Long id) {
		// TODO Auto-generated method stub
		return clienteRepository.buscar(id);
	}
	
	public void atualizarCliente(Clientes cliente) {
		
		clienteRepository.editar(cliente);
	}
	
	public void deletarCliente(Clientes cliente) {
		clienteRepository.excluir(cliente);
	}
		
}
