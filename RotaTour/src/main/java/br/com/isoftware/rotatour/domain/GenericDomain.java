package br.com.isoftware.rotatour.domain;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@SuppressWarnings("serial") // anotação do java 
@MappedSuperclass // anotação do hibernate

public class GenericDomain implements Serializable {
	@Id// anotação do hibernate anotations	
	@GeneratedValue(strategy = GenerationType.AUTO)//@GeneratedValue(strategy=GenerationType.IDENTITY)// anotação do hibernate
	private Long id;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
}
