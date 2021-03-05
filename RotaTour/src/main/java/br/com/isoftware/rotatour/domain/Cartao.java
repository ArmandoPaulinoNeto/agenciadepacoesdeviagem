package br.com.isoftware.rotatour.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
public class Cartao extends GenericDomain{

	public Cartao(Pagamento pagamento,String numCartao, String nomeTitular, String validade, String codSeguranca, String cpfTitular, Date dataNascimento, String ddd, String contato) {
		
		this.pagamento = pagamento;
		this.numeroCartao = numCartao;
		this.nomeTitular = nomeTitular;
		this.validade = validade;
		this.codSeguranca = codSeguranca;
		this.cpfTitular = cpfTitular;
		this.dataNacimento = dataNascimento;
		this.ddd = ddd;
		this.contato = contato;
	}
	
	@Column(length = 16, nullable = false)
	private String numeroCartao;
	
	@Column(length = 25, nullable = false)
	private String nomeTitular;
	
	@Column(length = 4, nullable = false)
	private String validade;	
	
	@Column(length = 3, nullable = false)
	private String codSeguranca;
	
	@Column(length = 9, nullable = false)
	private String contato;
	
	@Column(length = 2, nullable = false)
	private String ddd;
	
	@Column(length = 11, nullable = false)
	private String cpfTitular;
	
	@Temporal(TemporalType.DATE)
	private Date dataNacimento;	
	
	@OneToOne
	@JoinColumn(nullable = false)
	private Pagamento pagamento;

	public String getNumeroCartao() {
		return numeroCartao;
	}

	public void setNumeroCartao(String numeroCartao) {
		this.numeroCartao = numeroCartao;
	}

	public String getNomeTitular() {
		return nomeTitular;
	}

	public void setNomeTitular(String nomeTitular) {
		this.nomeTitular = nomeTitular;
	}

	public String getValidade() {
		return validade;
	}

	public void setValidade(String validade) {
		this.validade = validade;
	}

	public String getCodSeguranca() {
		return codSeguranca;
	}

	public void setCodSeguranca(String codSeguranca) {
		this.codSeguranca = codSeguranca;
	}

	public String getContato() {
		return contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
	}

	public String getDdd() {
		return ddd;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getCpfTitular() {
		return cpfTitular;
	}

	public void setCpfTitular(String cpfTitular) {
		this.cpfTitular = cpfTitular;
	}

	public Date getDataNacimento() {
		return dataNacimento;
	}

	public void setDataNacimento(Date dataNacimento) {
		this.dataNacimento = dataNacimento;
	}
	
}
