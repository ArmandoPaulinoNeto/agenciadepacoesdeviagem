package br.com.isoftware.rotatour.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.isoftware.rotatour.controller.service.AcessoServico;
import br.com.isoftware.rotatour.controller.service.AcompanhanteServico;
import br.com.isoftware.rotatour.controller.service.CarregamententoIndexServico;
import br.com.isoftware.rotatour.controller.service.CartaoServico;
import br.com.isoftware.rotatour.controller.service.ClienteServico;
import br.com.isoftware.rotatour.controller.service.CompraServico;
import br.com.isoftware.rotatour.controller.service.OpcoesServico;
import br.com.isoftware.rotatour.controller.service.PagamentoServico;
import br.com.isoftware.rotatour.controller.service.ParcelamentoServico;
import br.com.isoftware.rotatour.controller.service.ViagemServico;
import br.com.isoftware.rotatour.controller.util.DateTrasform;
import br.com.isoftware.rotatour.domain.Acompanhantes;
import br.com.isoftware.rotatour.domain.CarregamententoIndex;
import br.com.isoftware.rotatour.domain.Cartao;
import br.com.isoftware.rotatour.domain.Clientes;
import br.com.isoftware.rotatour.domain.Compra;
import br.com.isoftware.rotatour.domain.Acesso;
import br.com.isoftware.rotatour.domain.Opcoes;
import br.com.isoftware.rotatour.domain.Pacotes;
import br.com.isoftware.rotatour.domain.Pagamento;
import br.com.isoftware.rotatour.domain.Parcelamento;
import br.com.isoftware.rotatour.domain.Viagem;

public class Controller {

	ClienteServico clienteServico;
	ViagemServico viagemServico;
	OpcoesServico opcoesServico;
	PagamentoServico pagamentoServico;
	CompraServico compraServico;
	CartaoServico cartaoServico;
	ParcelamentoServico parcelamentoServico;
	AcompanhanteServico acompanhanteServico;
	AcessoServico acessoServico;
	CarregamententoIndexServico carregamententoIndexServico;
	public Controller() {
		
		clienteServico = new ClienteServico();
		pagamentoServico = new PagamentoServico();
		viagemServico = new ViagemServico();
		opcoesServico = new OpcoesServico();
		acessoServico = new AcessoServico();
		compraServico = new CompraServico();
		parcelamentoServico = new ParcelamentoServico();
		cartaoServico = new CartaoServico();
		acompanhanteServico = new AcompanhanteServico();
		carregamententoIndexServico = new CarregamententoIndexServico();
	}
	//********Cadastra Clientes****************
	public Clientes cadastrarCliente(String cpf,String nome, String sexo, Date dataNacimento, String ddd, String contato, String logradouro, String numero, String bairro, String cidade, String cep, String uf, String email) {
		
		try {
			 
			Clientes cliente = new Clientes(cpf, nome, sexo, dataNacimento, ddd, contato, logradouro, numero, bairro, cidade, cep, uf, email);			
			return clienteServico.cadastrarCliente(cliente);
		} catch (Exception e) {
			System.out.println(e);
		 	return null;
		}		
	}
	//********busca Lugares e Pacotes por nome****************
	public List<CarregamententoIndex> buscarLugaresEpacotes() {
		
		return carregamententoIndexServico.carregamententoIndex();
	}
	//********busca Cliente por nome****************
	public List<Clientes> perquisarClientes(String nome) {
		
		return clienteServico.pesquisarCliente(nome);
	}
	//********busca Cliente por id****************
	public Clientes perquisarClientes(Long id) {
		
		return clienteServico.pesquisarCliente(id);
	}
	//********Atualiza Clientes****************
	public boolean atualizarCliente(int id, String cpf,String nome, String sexo, Date dataNacimento, String ddd, String contato, String logradouro, String numero, String bairro, String cidade, String cep, String uf, String email) {
			
			try {
				Clientes cliente = new Clientes(cpf, nome, sexo, dataNacimento, ddd, contato, logradouro, numero, bairro,cidade, cep, uf, email);
				clienteServico.atualizarCliente(cliente);
				return true;
			} catch (Exception e) {
			 	return false;
			}			
		}
	//********Deleta Clientes****************
	public void deletarCliente(Clientes cliente) {
			clienteServico.deletarCliente(cliente);
	}
	// Acompanhantes(Clientes cliente, String nome, Date data)
	public boolean cadastrarAcompanhantes(Clientes cliente, String nome, Date data) {

			Acompanhantes acompanhante = new Acompanhantes(cliente, nome, data);		
			acompanhanteServico.cadastrarAcompanhante(acompanhante);		
		 	return true;
				
	}
	//********Viagem****************
	public Pagamento cadastrarPagamento(BigDecimal valor, Date dataPagamento){
		
		Pagamento pagamento = new Pagamento(valor, dataPagamento);
		//Corrigir objeto pagamento		
		return pagamentoServico.cadastrarPagamento(pagamento);
	}
	public Viagem cadastrarViagem(Pacotes pacote, Clientes cliente, String saida, Date data){
		
		Viagem viagem = new Viagem(pacote, cliente, saida, data);	
		return viagemServico.cadastrarViagem(viagem);
	}
	public Acesso cadastrarAcesso(String login, String senha, short tipoLogin){
		
		Acesso acesso = new Acesso(login, senha, tipoLogin);	
		return acessoServico.cadastrarAcesso(acesso);
	}
	
	//******** cadastrarOpcoes****************
	public boolean cadastrarOpcoes(Viagem viagem, Date data){
		
		Opcoes opcoes = new Opcoes(viagem, data);	
		opcoesServico.cadastrarOpcoes(opcoes);
		return true;
	}
	//Conferir os valores do objoeto compra 
	public boolean cadastrarCompra(Pagamento pagamento, Viagem viagem, Acesso acesso, Short quantidade, String codigoNotaFisca, BigDecimal valor, Date dataCompra){
			
		Compra compra = new Compra(pagamento, viagem, acesso, quantidade, codigoNotaFisca, valor,  dataCompra);
		compraServico.cadastrarCompra(compra);
		return true;	
	}//(Pagamento pagamento, BigDecimal valor, short quantidade)
	//********Cadastra Parcelamento****************	
	public boolean cadastrarParcelamento(Pagamento pagamento, BigDecimal valor, short quantidade){

		try {
				Parcelamento parcelamento = new Parcelamento(pagamento, valor, quantidade);
				parcelamentoServico.cadastrarParcelamento(parcelamento);
				return true;
		} catch (Exception e) { 	
	 		e.printStackTrace();
	 		return false;
		}
	}
	//********Cadastra Cartão****************
		public boolean cadastrarCartao(Pagamento pagamento,String numCartao, String nomeTitular, String validade, String codSeguranca, String cpfTitular, Date dataNascimento, String ddd,	String contato) {
			
			try {
				 
					Cartao cartao = new Cartao(pagamento,numCartao, nomeTitular, validade, codSeguranca, cpfTitular, dataNascimento, ddd, contato);
					cartaoServico.cadastrarCartao(cartao);
					return true;
			} catch (Exception e) {
			 		
					e.printStackTrace();
			 		return false;
			}		
		}
	
	
	
}