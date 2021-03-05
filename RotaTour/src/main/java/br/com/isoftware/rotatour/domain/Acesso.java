package br.com.isoftware.rotatour.domain;

import javax.persistence.Column;
import javax.persistence.Entity;

@SuppressWarnings("serial")
@Entity
public class Acesso extends GenericDomain{
	
	public Acesso() {
		super();
	}
	public Acesso(String login, String senha, Short tipoLogin) {
		this.login = login;
		this.senha = senha;
		this.tipoLogin = tipoLogin;
	}
	
	@Column(length = 25, nullable = false)
	private String login;
	
	@Column(length = 25, nullable = false)
	private String senha;
	
	@Column(nullable = false)
	private short tipoLogin;
		
	public String getLogin() {
		return login;
	}	
	
	public void setLogin(String login) {
		this.login = login;
	}
	/**
	 * @return the senha
	 */
	public String getSenha() {
		return senha;
	}
	/**
	 * @param senha the senha to set
	 */
	public void setSenha(String senha) {
		this.senha = senha;
	}

	/**
	 * @return the tipoLogin
	 */
	public int getTipoLogin() {
		return tipoLogin;
	}

	/**
	 * @param tipoLogin the tipoLogin to set
	 */
	public void setTipoLogin(short tipoLogin) {
		this.tipoLogin = tipoLogin;
	}
	
	
}
