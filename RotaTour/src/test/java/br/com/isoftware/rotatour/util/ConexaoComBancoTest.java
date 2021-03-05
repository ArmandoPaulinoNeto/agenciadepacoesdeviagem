package br.com.isoftware.rotatour.util;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Ignore;

import br.com.isoftware.rotatour.controller.util.DateTrasform;
import br.com.isoftware.rotatour.domain.Acesso;
import br.com.isoftware.rotatour.domain.Imagens;
import br.com.isoftware.rotatour.domain.Lugares;
import br.com.isoftware.rotatour.domain.Pacotes;
import br.com.isoftware.rotatour.model.repository.AcessoRepository;
import br.com.isoftware.rotatour.model.repository.ImagensRepository;
import br.com.isoftware.rotatour.model.repository.LugaresRepository;
import br.com.isoftware.rotatour.model.repository.PacotesRepository;

public class ConexaoComBancoTest {

	@Ignore
	public void salvar(){
//*********Lugares*************************************************************************
				
		LugaresRepository repository;
		ImagensRepository repo;
		PacotesRepository rep;
		Pacotes pacote;		
		Lugares lugar;
		String extensao = ".jpg";
		Imagens imagem;
		
		String[] imagens = new String[]{"itacare","lisboa","torresdelpaine","fernandonoronha","buzios","miami","desertoatacama","roma","orlando","florianopolis"};
		String[] valor = new String[]{"314","1861","864","417","496","1447","1010","1810","2404","343"};
		String[] diarias = new String[]{"2","4","3","2","4","3","3","5","5","4"};
		
		lugar = new Lugares();		
		lugar.setPais("Brasil");
		lugar.setCapital("Brasília");
		lugar.setDetalhe("Itacaré foi, durante anos, um paraíso quase secreto, conhecido apenas entre pescadores, surfistas e amantes de praias desertas. A intensa faixa de Mata Atlântica que recobre a região a manteve assim, quase intocada. Com o passar do tempo, viajantes de todo o Brasil começaram a desvendar os segredos desse pequeno povoado no Litoral Sul da Bahia.");
		lugar.setCidade("Itacaré - BA");
		lugar.setMoeda("Real");
		lugar.setImagem("itacare"+extensao);
		
		repository = new LugaresRepository();
		repository.salvar(lugar);
		
		lugar = new Lugares();		
		lugar.setPais("Portugal");
		lugar.setCapital("Lisboa");
		lugar.setDetalhe("Lisboa é um lugar de perder o fôlego com suas belas paisagens e ladeiras. Nada melhor do que caminhar pelas estreitas ruas de Alfama e se encantar com cada cantinho que a capital portuguesa tem a oferecer. Um belo passeio pelas margens do Rio Tejo não pode faltar em seu roteiro, assim como uma subida ao Bairro Alto e uma caminhada pelo centro apreciando as lojas e os doces portugueses. A capital de Portugal também é um belo destino para quem busca comer bem. Em nossos guias de Lisboa e do Porto você encontra informações e dicas para planejar e aproveitar melhor a sua viagem para Portugal.");
		lugar.setCidade("Lisboa");
		lugar.setMoeda("Euro");
		lugar.setImagem("lisboa"+extensao);		
		
		repository = new LugaresRepository();
		repository.salvar(lugar);
		
		lugar.setPais("Chile");
		lugar.setCapital("Santiago");
		lugar.setDetalhe("Torres del Paine - No extremo sul das Américas está um dos lugares mais selvagens do planeta. Uma paisagem quase intocada aguarda para ser descoberta e explorada. Essa é a sensação dos viajantes que chegam à Patagônia e ao Parque Torres del Paine . O acesso ao parque se dá pelo aeroporto de Punta arenas, cidade também famosa pela colônia de pinguins em Isla Magdalena e próxima à estação de esqui Club Andino de Punta Arenas, lugar que tem uma das poucas pistas de esqui do mundo com vista pro mar.");
		lugar.setCidade("Comuna do Chile");
		lugar.setMoeda("Peso chileno");
		lugar.setImagem("torresdelpaine"+extensao);

		repository = new LugaresRepository();
		repository.salvar(lugar);
		
		lugar = new Lugares();		
		lugar.setPais("Brasil");
		lugar.setCapital("Brasília");
		lugar.setDetalhe("Fernando de Noronha - Comumente chamado de paraíso brasileiro, Fernando de Noronha surpreende pela cor do mar, pela natureza bem preservada e pela intensa vida marinha, que pode ser vista de pertinho em passeios de barco, mergulhos ou mesmo com snorkel. Destino perfeito para quem procura tranquilidade e inspiração.");
		lugar.setCidade("Fernando de Noronha - PE");
		lugar.setMoeda("Real");
		lugar.setImagem("fernandonoronha"+extensao);
		
		repository = new LugaresRepository();
		repository.salvar(lugar);
		
		lugar.setPais("Brasil");
		lugar.setCapital("Brasília");
		lugar.setDetalhe("Búzios Beach Resort - Ideal para toda família, o Búzios Beach Resort é considerado o maior resort da Região dos Lagos. A estada, repleta de lazer e bem-estar, é para quem deseja aproveitar um dos destinos mais famosos do Rio de Janeiro, com ótima localização à beira da Praia de Tucuns e a cerca de 7 km da Orla Bardot e da Rua das Pedras.");
		lugar.setCidade("Lagos - RJ");
		lugar.setMoeda("Euro");
		lugar.setImagem("buzios"+extensao);

		repository = new LugaresRepository();
		repository.salvar(lugar);
		
		lugar.setPais("Estados Unidos");
		lugar.setCapital("Washington");
		lugar.setDetalhe("Miami é uma das cidades preferidas dos brasileiros. E não faltam motivos para isso: para além das atrações culturais e ampla variedade gastronômica, a cidade da Flórida oferece ótimas opções para as compras e praias belíssimas!");
		lugar.setCidade("Miami");
		lugar.setMoeda("Dolar");
		lugar.setImagem("miami"+extensao);
		
		repository = new LugaresRepository();
		repository.salvar(lugar);		
				
		lugar = new Lugares();		
		lugar.setPais("Chile");
		lugar.setCapital("Santiago");
		lugar.setDetalhe("O Deserto do Atacama é considerado o mais seco do mundo e vai muito além das dunas de areia: lagos em que não se afunda, formações rochosas esculpidas pelo vento, vida selvagem, sítios arqueológicos, deserto de sal…e um céu azul como em nenhum outro lugar. Clique nas imagens abaixo pra ter uma ideia do que lhe espera: Não é a toa que os leitores do Melhores Destinos deram nota 10 para este lugar no nosso Guia de Destinos.");
		lugar.setCidade("San Pedro de Atacama");
		lugar.setMoeda("Peso chileno");
		lugar.setImagem("desertoatacama"+extensao);

		repository = new LugaresRepository();
		repository.salvar(lugar);
		
		lugar.setPais("Itália");
		lugar.setCapital("Roma");
		lugar.setDetalhe("Roma - Não é à toa que Roma é conhecida como “A Cidade Eterna”. A capital da Itália oferece ao visitante uma viagem no tempo por meio de patrimônio histórico riquíssimo  — além, é claro, dos museus interessantes, bons restaurantes e tantos outros motivos que levam uma grande quantidade de turistas à cidade todos os anos. Uma cidade que vai te surpreender a cada esquina!");
		lugar.setCidade("Roma");
		lugar.setMoeda("Euro");
		lugar.setImagem("roma"+extensao);
		
		repository = new LugaresRepository();
		repository.salvar(lugar);
		
		lugar = new Lugares();		
		lugar.setPais("Estados Unidos");
		lugar.setCapital("Washington");
		lugar.setDetalhe("Mesmo que você leia todas as notícias e dicas sobre a Disney, você só vai saber como é a sensação mágica dos parques estando lá. É impossível descrever! Se você se deixar levar pelas músicas, pelas memórias que cada atração traz e realmente deixar as preocupações para trás, vai ser uma experiência inesquecível.");
		lugar.setCidade("Orlando");
		lugar.setMoeda("Dolar");
		lugar.setImagem("orlando"+extensao);
		
		repository = new LugaresRepository();
		repository.salvar(lugar);
		
		lugar = new Lugares();		
		lugar.setPais("Brasil");
		lugar.setCapital("Brasília");
		lugar.setDetalhe("No alto da lista das cidades mais visitadas por estrangeiros, Florianópolis encanta por sua variedade de praias e pela capacidade de agradar todo tipo de público. É uma capital que cresceu em meio à natureza, que oferece belas paisagens naturais por toda sua extensão, onde se pode curtir tanto o movimento de uma capital efervescente quanto a tranquilidade de uma cidade — quase — do interior.");
		lugar.setCidade("Florianópolis - SC");
		lugar.setMoeda("Real");
		lugar.setImagem("florianopolis"+extensao);
		
		repository = new LugaresRepository();
		repository.salvar(lugar);
		
		List<Lugares> result = repository.listar();
		
		for (int i = 0; i < result.size(); i++) {
				//System.out.println(lugares.getPais()+" + "+lugares.getCapital()+" + "+lugares.getCidade()+" + "+lugares.getDetalhe()+" + "+lugares.getMoeda());
				pacote = new Pacotes();				
				pacote.setValor(new BigDecimal(valor[i]));
				pacote.setDiarias(new Short(diarias[i]));
				pacote.setDataInicio(new DateTrasform().converterStrigParaData("01/04/2021"));
				pacote.setDataFim(new DateTrasform().converterStrigParaData("01/11/2021"));
				pacote.setLugaresFK(result.get(i));
				rep =new PacotesRepository();
				rep.salvar(pacote);				
		}
		
		rep =new PacotesRepository();
		List<Pacotes> resultPacotes = rep.listar();
		for (int i = 0; i < resultPacotes.size(); i++) {
			//System.out.println(lugares.getPais()+" + "+lugares.getCapital()+" + "+lugares.getCidade()+" + "+lugares.getDetalhe()+" + "+lugares.getMoeda());
			imagem = new Imagens();				
			imagem.setImagem(imagens[i]+"1"+extensao);			
			imagem.setImagemPacotesFK(resultPacotes.get(i).getId());
			repo  = new ImagensRepository();
			repo.salvar(imagem);
			
			imagem = new Imagens();				
			imagem.setImagem(imagens[i]+"2"+extensao);			
			imagem.setImagemPacotesFK(resultPacotes.get(i).getId());
			repo  = new ImagensRepository();
			repo.salvar(imagem);
			
			imagem = new Imagens();				
			imagem.setImagem(imagens[i]+"3"+extensao);			
			imagem.setImagemPacotesFK(resultPacotes.get(i).getId());
			repo  = new ImagensRepository();
			repo.salvar(imagem);
			
			imagem = new Imagens();				
			imagem.setImagem(imagens[i]+"4"+extensao);			
			imagem.setImagemPacotesFK(resultPacotes.get(i).getId());
			repo  = new ImagensRepository();
			repo.salvar(imagem);
		}
		
		AcessoRepository repositoryAcesso = new AcessoRepository();
		Acesso acesso = new Acesso();//Acesso acesso = control.cadastrarAcesso(login, senha, new Short("0"));
		acesso.setLogin("administrador");
		acesso.setSenha("12345");
		acesso.setTipoLogin(new Short("1"));
		repositoryAcesso.salvar(acesso);	
	}
	
	//**********************************************************************************

	//**********************************************************************************	
}

