package br.com.isoftware.rotatour.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
public class Compra extends GenericDomain {
			
		public Compra(Pagamento pagamento, Viagem viagem, Acesso acesso, Short quantidade, String codigoNotaFisca, BigDecimal valor, Date dataCompra) {		
			
			this.pagamentoFK = pagamento;
			this.viagemFK = viagem;
			this.acessoFK = acesso;
			this.quantidade = quantidade;
			this.codigoNotaFisca = codigoNotaFisca;
			this.valor = valor;		
			this.dataCompra = dataCompra;
		}	

		@Column(nullable = false, precision = 7, scale = 2)
		private BigDecimal valor;
		
		@Column(nullable = false)
		private short quantidade;
		
		@Temporal(TemporalType.DATE)
		private Date dataCompra;
		
		@OneToOne
		@JoinColumn(nullable = false)
		private Pagamento pagamentoFK;
			
		@ManyToOne
		@JoinColumn(nullable = false)
		private Viagem viagemFK;

		@ManyToOne
		@JoinColumn(nullable = false)
		private Acesso acessoFK;
		
		@Column(length = 25, nullable = false)
		private String codigoNotaFisca;		
		
		public BigDecimal getValor() {
			return valor;
		}

		public void setValor(BigDecimal valor) {
			this.valor = valor;
		}

		public int getQuantide() {
			return quantidade;
		}

		public void setQuantide(short quantidePessoa) {
			this.quantidade = quantidePessoa;
		}

		public Date getDataCompra() {
			return dataCompra;
		}

		public void setDataCompra(Date dataCompra) {
			this.dataCompra = dataCompra;
		}

		
		public String getCodigoNotaFisca() {
			return codigoNotaFisca;
		}

		public void setCodigoNotaFisca(String codigoNotaFisca) {
			this.codigoNotaFisca = codigoNotaFisca;
		}

		public Pagamento getPagamentoFK() {
			return pagamentoFK;
		}

		public void setPagamentoFK(Pagamento pagamento) {
			this.pagamentoFK = pagamento;
		}

		public short getQuantidade() {
			return quantidade;
		}
		
		public void setQuantidade(short quantidade) {
			this.quantidade = quantidade;
		}

		public Viagem getViagemFK() {
			return viagemFK;
		}

		public void setViagemFK(Viagem viagem) {
			this.viagemFK = viagem;
		}
		
}
