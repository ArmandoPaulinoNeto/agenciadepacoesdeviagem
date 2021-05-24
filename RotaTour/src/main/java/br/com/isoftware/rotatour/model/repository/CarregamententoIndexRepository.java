package br.com.isoftware.rotatour.model.repository;

import java.util.ArrayList;
import java.util.List;

import br.com.isoftware.rotatour.domain.Conteudo;
import br.com.isoftware.rotatour.domain.Lugares;
import br.com.isoftware.rotatour.domain.Pacotes;

public class CarregamententoIndexRepository {

	LugaresRepository lr = new LugaresRepository();
	PacotesRepository lp = new PacotesRepository();
	
	Conteudo carregamententoIndex = new Conteudo();
	
	public List<Conteudo> conteudoIndex() {
		
		List<Conteudo> conteudoIndex = new ArrayList<>();		
		List<Lugares> listaLugares = lr.listar();
		List<Pacotes> listaPacotes = lp.listar();
		
		for(int i = 0; i < listaLugares.size(); i++) {
			
			 Conteudo objeto = new Conteudo();
			 
			 objeto.setPais(listaLugares.get(i).getPais());
			 objeto.setCapital(listaLugares.get(i).getCapital());
			 objeto.setCidade(listaLugares.get(i).getCidade());
			 objeto.setPrincipal(listaLugares.get(i).getImagem());
			 objeto.setId(listaPacotes.get(i).getId());
			 objeto.setValor(listaPacotes.get(i).getValor());
			 conteudoIndex.add(objeto);
		}
		return conteudoIndex;
	}
	
}
