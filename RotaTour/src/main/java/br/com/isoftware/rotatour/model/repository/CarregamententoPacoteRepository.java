package br.com.isoftware.rotatour.model.repository;

import java.util.List;
import br.com.isoftware.rotatour.domain.Conteudo;
import br.com.isoftware.rotatour.domain.Imagens;
import br.com.isoftware.rotatour.domain.Lugares;
import br.com.isoftware.rotatour.domain.Pacotes;
import br.com.isoftware.rotatour.util.ConverteValores;

public class CarregamententoPacoteRepository {

	
	Conteudo carregamententoIndex = new Conteudo();
	
	public Conteudo conteudoPacote(Long codigo) {
		
		ConverteValores converteValores = new ConverteValores();
		LugaresRepository lr = new LugaresRepository();
		PacotesRepository lp = new PacotesRepository();
		ImagensRepository li = new ImagensRepository();
		
		Lugares lugar = lr.buscar(codigo);
		Pacotes pacote = lp.buscar(lugar.getId());
		List<Imagens> ResultImagens = li.buscarImagens(codigo);		
		
		String valor = converteValores.valorParaReal(pacote.getValor()).replace("R$ ", "");
		Conteudo conteudo = new Conteudo();
		conteudo.setId(codigo);
		conteudo.setDiarias(pacote.getDiarias());
		conteudo.setPais(lugar.getPais());
		conteudo.setCapital(lugar.getCapital());
		conteudo.setCidade(lugar.getCidade());
		conteudo.setDetalhe(lugar.getDetalhe());
		conteudo.setMoeda(lugar.getMoeda());
		conteudo.setValor(pacote.getValor());
		conteudo.setPreco(valor);
		conteudo.setPrimeira(ResultImagens.get(0).getImagem());;
		conteudo.setSegunda(ResultImagens.get(1).getImagem());
		conteudo.setTerceira(ResultImagens.get(2).getImagem());
		conteudo.setQuarta(ResultImagens.get(3).getImagem());		
		
		return conteudo;
	}
	
}
