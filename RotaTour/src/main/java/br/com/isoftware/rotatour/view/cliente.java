package br.com.isoftware.rotatour.view;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Iterator;
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
					Short tipoAcesso = new Short((String) request.getSession().getAttribute("tipoAcesso"));
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
			}else if(pagina.equals("compras")) {
				
					converteValores = new ConverteValores();
					String subtotal = (String) request.getSession().getAttribute("subtotal");			

					String numCartao = request.getParameter("txtNumCartao").replace(" ", "");
					String nomeTitular = request.getParameter("txtNomeTitular");
					String validade = request.getParameter("txtValidade").replace("/", "");
					String codSeguranca = request.getParameter("txtCodSeguranca");
					String parcelas = request.getParameter("sltParcelas");
					String cpfTitular = request.getParameter("txtCPFtitular").replace(".", "").replace("-", "");
					String login = request.getParameter("txtLogin");
					String senha = request.getParameter("txtSenha");
					Date dataNascimento = dataTransform.converterStrigParaData(request.getParameter("txtDataNascimento"));
					
					String[] numeroCompleto = (request.getParameter("txtContato").replace("(", "").replace(")", "").replace("-", "")).split(" ");					
					String ddd = numeroCompleto[0];
					String contato = numeroCompleto[1];	
					//ACESSO
					Acesso acesso = control.cadastrarAcesso(login, senha, new Short("0"));
					
					request.getSession().setAttribute("acesso", acesso);
					//PAGAMENTO 
					Pagamento pagamento = control.cadastrarPagamento(converteValores.valorParaBigDecimal(subtotal), new Date());					
					request.getSession().setAttribute("pagamento", pagamento);
					
					if(!parcelas.equals("1")){
						BigDecimal parcela = converteValores.valorParcelaBigDecimal(subtotal, parcelas);
						control.cadastrarParcelamento(pagamento, parcela, new Short(parcelas));
					}
					//CARTÃO
					control.cadastrarCartao(pagamento, numCartao, nomeTitular, validade, codSeguranca, cpfTitular, dataNascimento, ddd, contato);					
					
					boolean selecionado = (boolean) request.getSession().getAttribute("selecionado");
					
					if(selecionado) {
						request.getSession().setAttribute("DataIda", request.getParameter("txtDataIda"));
						request.getSession().setAttribute("DataIda1", request.getParameter("txtDataIda1"));
						request.getSession().setAttribute("DataIda2", request.getParameter("txtDataIda2"));
					}
					request.getSession().setAttribute("mansagem", "Cadastros realizados com sucesso!");
					request.getSession().setAttribute("acesso", acesso);
					response.sendRedirect("cadastros.jsp");
			}else if(pagina.equals("cadastros")){
			
						converteValores = new ConverteValores();
						int quantidade = (int) request.getSession().getAttribute("quantidade");
						Pacotes pacote = (Pacotes) request.getSession().getAttribute("pacote");
						Pagamento pagamento = (Pagamento) request.getSession().getAttribute("pagamento");						
						String subtotal = (String) request.getSession().getAttribute("subtotal");
						
						Acesso acesso = (Acesso) request.getSession().getAttribute("acesso");
						
						String saida = (String) request.getSession().getAttribute("saida");
				
						String nome = request.getParameter("txtNome");
						String cpf = request.getParameter("txtCPF").replace(".", "").replace("-", "");
						String sexo = request.getParameter("sltSexo");
						Date dataNacimento = dataTransform.converterStrigParaData(request.getParameter("txtDataNascimento"));
						String logradouro = request.getParameter("txtLogradouro");
						String bairro = request.getParameter("txtBairro");
						String numero = request.getParameter("txtNumero");
						String cidade = request.getParameter("txtCidade");
						String uf = request.getParameter("txtUF");
						String cep = request.getParameter("txtCEP").replace("-", "");
						String email = request.getParameter("txtEmail");
						String[] numeroCompleto = (request.getParameter("txtContato").replace("(", "").replace(")", "").replace("-", "")).split(" ");
						String ddd = numeroCompleto[0];
						String contato = numeroCompleto[1];
						//CLIENTE
						Clientes cliente = control.cadastrarCliente(cpf, nome, sexo, dataNacimento, ddd, contato, logradouro, numero, bairro, cidade, cep, uf, email);
						//VIAGEM
						Viagem viagem = control.cadastrarViagem(pacote, cliente, saida, new Date());
						//COMPRA
						control.cadastrarCompra(pagamento, viagem, acesso, new Short(String.valueOf(quantidade)), cupomFiscal(), converteValores.valorParaBigDecimal(subtotal), new Date());						
						
						boolean selecionado = (boolean) request.getSession().getAttribute("selecionado");
						
						if(selecionado) {
							
							control.cadastrarOpcoes(viagem, dataTransform.converterStrigParaData((String)request.getSession().getAttribute("DataIda")));
							control.cadastrarOpcoes(viagem, dataTransform.converterStrigParaData((String)request.getSession().getAttribute("DataIda1")));
							control.cadastrarOpcoes(viagem, dataTransform.converterStrigParaData((String)request.getSession().getAttribute("DataIda2")));
						}
						request.getSession().setAttribute("cliente", cliente);
						request.getSession().setAttribute("mensagem", "Cadastros realizados com sucesso!");
						response.sendRedirect("cadastros.jsp");
			}if(pagina.equals("acompanhantes")){
					int quantidade = (int) request.getSession().getAttribute("quantidade");
					Clientes cliente = (Clientes) request.getSession().getAttribute("cliente"); 
					
					for (int i = 1; i < (quantidade-1); i++) {
							
							control.cadastrarAcompanhantes(cliente, request.getParameter("txtNome"+String.valueOf(i)), dataTransform.converterStrigParaData(request.getParameter("txtDataNascimento"+String.valueOf(i))));
					 }						
						
					 request.getSession().setAttribute("mensagem", "Cadastros realizados com sucesso!");
					 response.sendRedirect("cadastros.jsp");
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
