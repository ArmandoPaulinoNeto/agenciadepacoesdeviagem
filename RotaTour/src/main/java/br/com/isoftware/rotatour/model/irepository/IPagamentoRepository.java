package br.com.isoftware.rotatour.model.irepository;

import br.com.isoftware.rotatour.domain.Pagamento;

public interface IPagamentoRepository {
	
	public int cadastraPagamento(Pagamento pagamento);
}
