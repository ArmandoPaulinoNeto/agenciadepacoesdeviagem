package br.com.isoftware.rotatour.domain;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
public class Pacotes extends GenericDomain{
	
	@Column(nullable = false, precision = 6, scale = 2)
	private BigDecimal valor;
	
	@Column(nullable = false)
	private short diarias;
	
	@Temporal(TemporalType.DATE)
	private Date dataInicio;
	
	@Temporal(TemporalType.DATE)
	private Date dataFim;
	
	@ManyToOne
	@JoinColumn
	private Lugares lugaresFK;
	
	public BigDecimal getValor() {
		return valor;
	}
	public String getValorReal() {
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		String real = nf.format (valor); // deve mostrar "R$ 12,34"
		return real;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public short getDiarias() {
		return diarias;
	}
	public void setDiarias(short diarias) {
		this.diarias = diarias;
	}
	public Date getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}
	public Date getDataFim() {
		return dataFim;
	}
	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}
	public Lugares getLugaresFK() {
		return lugaresFK;
	}
	public void setLugaresFK(Lugares LugaresFK) {
		this.lugaresFK = LugaresFK;
	}
		
}
