package br.com.isoftware.rotatour.domain;

import java.math.BigDecimal;

public class Conteudo {		
	
	private Long id;
	private String pais;
	private String capital;
	private String cidade;
	private Short diarias;
	private String detalhe;
	private String moeda;
	private String preco;
	private String principal;
	private String primeira;
	private String segunda;
	private String terceira;
	private String quarta;
	private BigDecimal valor;
	private Pacotes pacote;
	public Long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return the pais
	 */
	public String getPais() {
		return pais;
	}
	/**
	 * @param pais the pais to set
	 */
	public void setPais(String pais) {
		this.pais = pais;
	}
	/**
	 * @return the capital
	 */
	public String getCapital() {
		return capital;
	}
	/**
	 * @param capital the capital to set
	 */
	public void setCapital(String capital) {
		this.capital = capital;
	}
	/**
	 * @return the cidade
	 */
	public String getCidade() {
		return cidade;
	}
	/**
	 * @param cidade the cidade to set
	 */
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	/**
	 * @return the valor
	 */
	public BigDecimal getValor() {
		return valor;
	}
	/**
	 * @param valor the valor to set
	 */
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	/**
	 * @return the imagem
	 */
	public String getPrincipal() {
		return principal;
	}
	/**
	 * @param imagem the imagem to set
	 */
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	/**
	 * @return the diarias
	 */
	public Short getDiarias() {
		return diarias;
	}
	/**
	 * @param diarias the diarias to set
	 */
	public void setDiarias(Short diarias) {
		this.diarias = diarias;
	}
	/**
	 * @return the detalhe
	 */
	public String getDetalhe() {
		return detalhe;
	}
	/**
	 * @param detalhe the detalhe to set
	 */
	public void setDetalhe(String detalhe) {
		this.detalhe = detalhe;
	}
	/**
	 * @return the modes
	 */
	public String getMoeda() {
		return moeda;
	}
	/**
	 * @param modes the modes to set
	 */
	public void setMoeda(String moeda) {
		this.moeda = moeda;
	}
	/**
	 * @return the preco
	 */
	public String getPreco() {
		return preco;
	}
	/**
	 * @param preco the preco to set
	 */
	public void setPreco(String preco) {
		this.preco = preco;
	}
	/**
	 * @return the primeira
	 */
	public String getPrimeira() {
		return primeira;
	}
	/**
	 * @param primeira the primeira to set
	 */
	public void setPrimeira(String primeira) {
		this.primeira = primeira;
	}
	/**
	 * @return the segunda
	 */
	public String getSegunda() {
		return segunda;
	}
	/**
	 * @param segunda the segunda to set
	 */
	public void setSegunda(String segunda) {
		this.segunda = segunda;
	}
	/**
	 * @return the terceira
	 */
	public String getTerceira() {
		return terceira;
	}
	/**
	 * @param terceira the terceira to set
	 */
	public void setTerceira(String terceira) {
		this.terceira = terceira;
	}
	/**
	 * @return the quarta
	 */
	public String getQuarta() {
		return quarta;
	}
	/**
	 * @param quarta the quarta to set
	 */
	public void setQuarta(String quarta) {
		this.quarta = quarta;
	}
	/**
	 * @return the pacote
	 */
	public Pacotes getPacote() {
		return pacote;
	}
	/**
	 * @param pacote the pacote to set
	 */
	public void setPacote(Pacotes pacote) {
		this.pacote = pacote;
	}
	
}
