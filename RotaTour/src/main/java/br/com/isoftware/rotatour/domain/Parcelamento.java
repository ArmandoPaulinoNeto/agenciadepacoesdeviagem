package br.com.isoftware.rotatour.domain;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@SuppressWarnings("serial")
@Entity
public class Parcelamento extends GenericDomain{
	
	public Parcelamento(Pagamento pag, BigDecimal valor, short quantidade) {
		
		this.pagamento = pag;
		this.valor = valor;
		this.quantidade = quantidade;
	}
	
	@Column(nullable = false)
	private short quantidade;

	@Column(nullable = false, precision = 6, scale = 2)
	private BigDecimal valor;
	
	@OneToOne
	@JoinColumn	
	private Pagamento pagamento;
	
	public short getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(short quantidade) {
		this.quantidade = quantidade;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public Pagamento getPagamentoFK() {
		return pagamento;
	}

	public void setPagamentoFK(Pagamento pagamento) {
		this.pagamento = pagamento;
	}
}
