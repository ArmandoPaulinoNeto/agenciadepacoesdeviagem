package br.com.isoftware.rotatour.controller.iservice;

import java.util.List;

import br.com.isoftware.rotatour.domain.Clientes;

public interface IClientesServico {
	
	public Clientes cadastrarCliente(Clientes cliente);
	//********busca Cliente por nome****************
	public List<Clientes> pesquisarCliente(String nome);
	//********busca Cliente por id****************
	public Clientes pesquisarCliente(Long id);
	
	public void atualizarCliente(Clientes cliente);
	
	public void deletarCliente(Clientes cliente);
}
