package br.com.isoftware.rotatour.view;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.isoftware.rotatour.controller.Controller;
import br.com.isoftware.rotatour.controller.util.DateTrasform;
import br.com.isoftware.rotatour.domain.Acesso;
import br.com.isoftware.rotatour.domain.Clientes;
import br.com.isoftware.rotatour.domain.Imagens;
import br.com.isoftware.rotatour.domain.Lugares;
import br.com.isoftware.rotatour.domain.Pacotes;
import br.com.isoftware.rotatour.domain.Pagamento;
import br.com.isoftware.rotatour.domain.Viagem;
import br.com.isoftware.rotatour.model.repository.AcessoRepository;
import br.com.isoftware.rotatour.model.repository.ImagensRepository;
import br.com.isoftware.rotatour.model.repository.LugaresRepository;
import br.com.isoftware.rotatour.model.repository.PacotesRepository;
import br.com.isoftware.rotatour.util.ConverteValores;

/**
 * Servlet implementation class cadastrocliente
 */
@WebServlet("/cliente")
public class cliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Controller control = new Controller();
			DateTrasform dataTransform = new DateTrasform();
			ConverteValores converteValores;
			String pagina = (String) request.getSession().getAttribute("pagina");
			
			if(pagina.equals("acessar")) {
			    
					String login = request.getParameter("txtLogin");
					String senha = request.getParameter("txtSenha");
					//Short tipoAcesso = new Short((String) request.getSession().getAttribute("tipoAcesso"));
					boolean logar = false;
					AcessoRepository repository = new AcessoRepository();
					
					List<Acesso> acessoLisata = repository.listar();
					
					for (Acesso acesso : acessoLisata) {
						
						if((login.equals(acesso.getLogin())) && (senha.equals(acesso.getSenha()))){
							
							System.out.println("Login efetuado com sucesso!");
							logar = true;						
						}
					}
					 if(logar) {
						 
						 request.getSession().setAttribute("pagina", "cadastropacotes");
						 response.sendRedirect("cadastrospacotes.jsp");
					 }else {
						 
						 response.sendRedirect("index.jsp");
					 }	
			}if(pagina.equals("compras")) {
				
					request.getSession().setAttribute("Login", request.getParameter("txtLogin"));
					request.getSession().setAttribute("Senha", request.getParameter("txtSenha"));
					boolean selecionado = (boolean) request.getSession().getAttribute("selecionado");
					
					if(selecionado) {
						
						request.getSession().setAttribute("DataIda", request.getParameter("txtDataIda"));
						request.getSession().setAttribute("DataIda1", request.getParameter("txtDataIda1"));
						request.getSession().setAttribute("DataIda2", request.getParameter("txtDataIda2"));
					}
					request.getSession().setAttribute("mansagem", "Cadastros realizados com sucesso!");
					response.sendRedirect("cadastros.jsp");
			}if(pagina.equals("cadastros")){
					
						int quantidade = (int) request.getSession().getAttribute("quantidade");
						request.getSession().setAttribute("Nome", request.getParameter("txtNome"));
						request.getSession().setAttribute("CPF", request.getParameter("txtCPF"));
						request.getSession().setAttribute("Sexo", request.getParameter("sltSexo"));
						request.getSession().setAttribute("DataNascimento", request.getParameter("txtDataNascimento"));
						request.getSession().setAttribute("Logradouro", request.getParameter("txtLogradouro"));
						request.getSession().setAttribute("Bairro", request.getParameter("txtBairro"));
						request.getSession().setAttribute("Numero", request.getParameter("txtNumero"));
						request.getSession().setAttribute("Cidade", request.getParameter("txtCidade"));
						request.getSession().setAttribute("UF", request.getParameter("txtUF"));
						request.getSession().setAttribute("CEP", request.getParameter("txtCEP"));
						request.getSession().setAttribute("Email", request.getParameter("txtEmail"));
						request.getSession().setAttribute("Contato", request.getParameter("txtContato"));
						request.getSession().setAttribute("quantidade", quantidade);
						
						request.getSession().setAttribute("mansagem", "Cadastros realizados com sucesso!");
						
						if(quantidade > 1){
							
							response.sendRedirect("cadastrosacompanhante.jsp");
						}else{
							
							response.sendRedirect("pagamento.jsp");
						}
						//response.sendRedirect("cadastros.jsp");
			}if(pagina.equals("acompanhantes")){

					int quantidade = (int) request.getSession().getAttribute("quantidade");
					for (int i = 1; i < (quantidade-1); i++) {
						
							request.getSession().setAttribute("acNome"+String.valueOf(i), request.getParameter("txtNome"+String.valueOf(i)));
							request.getSession().setAttribute("acDataNascimento"+String.valueOf(i), request.getParameter("txtDataNascimento"+String.valueOf(i)));							
					 }						

					 request.getSession().setAttribute("mensagem", "Cadastros realizados com sucesso!");
					 request.getSession().setAttribute("pagina", "acompanhantes");
					 
					 response.sendRedirect("pagamento.jsp");
			}if(pagina.equals("finalizarcompra")){
				
				converteValores = new ConverteValores();
				
				int quantidade = (int) request.getSession().getAttribute("quantidade");
				String saida = (String) request.getSession().getAttribute("saida");
			
				Pacotes pacote = (Pacotes) request.getSession().getAttribute("pacote");
				String subtotal = (String) request.getSession().getAttribute("subtotal");
				
				String login = (String) request.getSession().getAttribute("Login");
				String senha = (String) request.getSession().getAttribute("Senha");
				
				Acesso acesso = control.cadastrarAcesso(login, senha, new Short("0"));

				String nome = (String) request.getSession().getAttribute("Nome");
				String cpf = ((String) request.getSession().getAttribute("CPF")).replace(".", "").replace("-", "");
				String sexo = (String) request.getSession().getAttribute("Sexo");
				Date dataNacimento = dataTransform.converterStrigParaData((String) request.getSession().getAttribute("DataNascimento"));
				String logradouro = (String) request.getSession().getAttribute("Logradouro");
				String bairro = (String) request.getSession().getAttribute("Bairro");
				String numero = (String) request.getSession().getAttribute("Numero");
				String cidade = (String) request.getSession().getAttribute("Cidade");
				String uf = (String) request.getSession().getAttribute("UF");
				String cep = ((String) request.getSession().getAttribute("CEP")).replace("-", "");
				String email = (String) request.getSession().getAttribute("Email");
				String[] numeroCompleto = ((String) request.getSession().getAttribute("Contato")).replace("(", "").replace(")", "").replace("-", "").split(" ");
				String ddd = numeroCompleto[0];
				String contato = numeroCompleto[1];
				
				//CLIENTE
				Clientes cliente = control.cadastrarCliente(cpf, nome, sexo, dataNacimento, ddd, contato, logradouro, numero, bairro, cidade, cep, uf, email);
				
				//ACOMPANHANTE
				if(quantidade > 1) {
					for (int i = 1; i < (quantidade-1); i++) {
						
						String acNome = (String) request.getSession().getAttribute("acNome"+String.valueOf(i));
						String acDataNascimento = (String) request.getSession().getAttribute("acDataNascimento"+String.valueOf(i));
						control.cadastrarAcompanhantes(cliente, acNome, dataTransform.converterStrigParaData(acDataNascimento));
					}
				}
				
				//VIAGEM
				Viagem viagem = control.cadastrarViagem(pacote, cliente, saida, new Date());
				
				boolean selecionado = (boolean) request.getSession().getAttribute("selecionado");
				
				if(selecionado) {
					
					control.cadastrarOpcoes(viagem, dataTransform.converterStrigParaData((String)request.getSession().getAttribute("DataIda")));
					control.cadastrarOpcoes(viagem, dataTransform.converterStrigParaData((String)request.getSession().getAttribute("DataIda1")));
					control.cadastrarOpcoes(viagem, dataTransform.converterStrigParaData((String)request.getSession().getAttribute("DataIda2")));
				}
							
				String numCartao = request.getParameter("inputNumero").replace(" ", "");
				String nomeTitular = request.getParameter("inputNome");
				String validade = request.getParameter("mes")+request.getParameter("year").substring(2);
				String codSeguranca = request.getParameter("inputCCV");
				String parcelas = request.getParameter("sltParcelas");				
				String cpfTitular = request.getParameter("txtCPFtitular").replace(".", "").replace("-", "");
				Date titularDataNacimento = dataTransform.converterStrigParaData(request.getParameter("txtDataNascimento"));
				String[] numCompleto = ((String) request.getSession().getAttribute("Contato")).replace("(", "").replace(")", "").replace("-", "").split(" ");
				String titularDDD = numCompleto[0];
				String titularContato = numCompleto[1];
				
				//PAGAMENTO 
				Pagamento pagamento = control.cadastrarPagamento(converteValores.valorParaBigDecimal(subtotal), new Date());
				
				if(!parcelas.equals("1")){
					
					BigDecimal parcela = converteValores.valorParcelaBigDecimal(subtotal, parcelas);
					control.cadastrarParcelamento(pagamento, parcela, new Short(parcelas));
				}
				
				//COMPRA
				control.cadastrarCompra(pagamento, viagem, acesso, new Short(String.valueOf(quantidade)), cupomFiscal(), converteValores.valorParaBigDecimal(subtotal), new Date());						
				
				//CARTÃO
				if(validade.length() < 4){
					
					validade = "0"+validade;
				}
				control.cadastrarCartao(pagamento, numCartao, nomeTitular, validade, codSeguranca, cpfTitular, titularDataNacimento, titularDDD, titularContato);
				
				response.sendRedirect("index.jsp");
			}
			if(pagina.equals("cadastropacotes")){
				
				LugaresRepository repositoryLugares = new LugaresRepository();
				PacotesRepository repositoryPacotes = new PacotesRepository();
				ImagensRepository repositoryImagem = new ImagensRepository();
				Imagens imagens;	
				
				String pais = request.getParameter("txtPais");
				String capital = request.getParameter("txtCapital");
				Date dataInicio = dataTransform.converterStrigParaData(request.getParameter("txtDataInicio"));
				Date dataFim = dataTransform.converterStrigParaData(request.getParameter("txtDataFim"));
				String diarias = request.getParameter("txtDiarias");
				String valor = request.getParameter("txtValor");
				String imagem = request.getParameter("txtImagem");
				String cidade = request.getParameter("txtCidade");
				String moeda = request.getParameter("txtMoeda");
				String detalhe = request.getParameter("txtDetalhe");
				
				String extensao = ".jpg";
				
				Lugares lugar = new Lugares();		
				lugar.setPais(pais);
				lugar.setCapital(capital);
				lugar.setDetalhe(detalhe);
				lugar.setCidade(cidade);
				lugar.setMoeda(moeda);
				lugar.setImagem(imagem+extensao);
				
				Lugares lugares = repositoryLugares.salvar(lugar);
				Pacotes pacote = new Pacotes();				
				pacote.setValor(new BigDecimal(valor));
				pacote.setDiarias(new Short(diarias));
				pacote.setDataInicio(dataInicio);
				pacote.setDataFim(dataFim);
				pacote.setLugaresFK(lugares);
				Pacotes pacotesFK = repositoryPacotes.salvar(pacote); 	
				imagens = new Imagens();				
				imagens.setImagem(imagem+"1"+extensao);			
				imagens.setImagemPacotesFK(pacotesFK.getId());
				repositoryImagem.salvar(imagens);
				
				imagens = new Imagens();				
				imagens.setImagem(imagem+"2"+extensao);			
				imagens.setImagemPacotesFK(pacotesFK.getId());
				repositoryImagem.salvar(imagens);
				
				imagens = new Imagens();				
				imagens.setImagem(imagem+"3"+extensao);			
				imagens.setImagemPacotesFK(pacotesFK.getId());
				repositoryImagem.salvar(imagens);
				
				imagens = new Imagens();				
				imagens.setImagem(imagem+"4"+extensao);			
				imagens.setImagemPacotesFK(pacotesFK.getId());
				
				repositoryImagem.salvar(imagens);
				response.sendRedirect("index.jsp");
			}
			//****************************Chave cadastros*************************************************************
			doGet(request, response);
		}//****************************Chave doPost*************************************************************
		public String cupomFiscal() {
			
			String cupomfiscal = "";
			Random gerador = new Random();
			for (int i = 0; i < 25; i++) {
				 cupomfiscal = cupomfiscal+String.valueOf(gerador.nextInt(9));
			}
			return cupomfiscal;
		}
}
