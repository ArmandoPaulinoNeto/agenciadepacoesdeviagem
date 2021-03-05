package br.com.isoftware.rotatour.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
public class Clientes extends GenericDomain{  
		
	public Clientes(String cpf, String nome, String sexo, Date dataNacimento, String ddd, String contato, String logradouro, String numero, String bairro, String cidade, String cep, String uf, String email) {
		
		this.cpf = cpf;
		this.nome = nome;
		this.sexo = sexo;
		this.dataNacimento = dataNacimento;
		this.ddd = ddd;
		this.contato = contato;
		this.logradouro = logradouro;
		this.numero = numero;
		this.bairro = bairro;
		this.cidade = cidade;
		this.cep = cep;
		this.uf = uf;
		this.email = email;
	}

	@Column(length = 11, nullable = false)
	private String cpf;
	
	@Column(length = 45, nullable = false)
	private String nome;
	
	@Column(length = 1, nullable = false)
	private String sexo;
	
	@Temporal(TemporalType.DATE)
	private Date dataNacimento;
	
	@Column(length = 40, nullable = false)
	private String email;
	
	@Column(length = 2, nullable = false)
	private String ddd;
	
	@Column(length = 9, nullable = false)
	private String contato;
	
	@Column(length = 35, nullable = false)
	private String logradouro;
	
	@Column(length = 5)
	private String numero;
	
	@Column(length = 35, nullable = false)
	private String bairro;
	
	@Column(length = 35, nullable = false)
	private String cidade;
	
	@Column(length = 8)
	private String cep;
	
	@Column(length = 2)
	private String uf;
	
		public String getCpf() {
			return cpf;
		}
		public void setCpf(String cpf) {
			this.cpf = cpf;
		}
		public String getNome() {
			return nome;
		}
		public void setNome(String nome) {
			this.nome = nome;
		}
		public String getSexo() {
			return sexo;
		}
		public void setSexo(String sexo) {
			this.sexo = sexo;
		}
		public Date getDataNacimento() {
			return dataNacimento;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public void setDataNacimento(Date dataNacimento) {
			this.dataNacimento = dataNacimento;
		}		
		public String getDD() {
			return ddd;
		}
		public void setDD(String ddd) {
			this.ddd = ddd;
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
		public String getLogradouro() {
			return logradouro;
		}
		public void setLogradouro(String logradouro) {
			this.logradouro = logradouro;
		}
		public String getNumero() {
			return numero;
		}
		public void setNumero(String numero) {
			this.numero = numero;
		}
		public String getBairro() {
			return bairro;
		}
		public void setBairro(String bairro) {
			this.bairro = bairro;
		}
		
		public String getCidade() {
			return cidade;
		}
		
		public void setCidade(String cidade) {
			this.cidade = cidade;
		}
		public String getCep() {
			return cep;
		}
		public void setCep(String cep) {
			this.cep = cep;
		}
		public String getUf() {
			return uf;
		}
		public void setUf(String uf) {
			this.uf = uf;
		}
		
}
