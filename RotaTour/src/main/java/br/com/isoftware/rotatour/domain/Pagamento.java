package br.com.isoftware.rotatour.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
public class Pagamento extends GenericDomain{

	public Pagamento(BigDecimal valor, Date dataPagamento) {
		Valor = valor;
		this.dataPagamento = dataPagamento;
	}	

	@Column(nullable = false, precision = 7, scale = 2)
	private BigDecimal Valor;
	
	@Temporal(TemporalType.DATE)
	private Date dataPagamento;
	
	
	public BigDecimal getValor() {
		return Valor;
	}

	public void setValor(BigDecimal valor) {
		Valor = valor;
	}

	public Date getDataPagamento() {
		return dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}
}
