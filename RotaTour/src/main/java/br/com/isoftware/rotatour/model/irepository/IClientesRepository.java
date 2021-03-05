package br.com.isoftware.rotatour.model.irepository;

import java.util.ArrayList;

import br.com.isoftware.rotatour.domain.Clientes;

public interface IClientesRepository {

	public void cadastraCliente(Clientes cliente);
	public ArrayList<Clientes> pesquisarCliente(String nome);
	public Clientes pesquisarCliente(int id);
	public void atualizaCliente(Clientes cliente, int id);
	public void deletarCliente(int id);
}
