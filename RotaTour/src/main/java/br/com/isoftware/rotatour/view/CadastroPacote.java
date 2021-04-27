package br.com.isoftware.rotatour.view;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.isoftware.rotatour.controller.util.DateTrasform;
import br.com.isoftware.rotatour.domain.Imagens;
import br.com.isoftware.rotatour.domain.Lugares;
import br.com.isoftware.rotatour.domain.Pacotes;
import br.com.isoftware.rotatour.model.repository.ImagensRepository;
import br.com.isoftware.rotatour.model.repository.LugaresRepository;
import br.com.isoftware.rotatour.model.repository.PacotesRepository;

/**
 * Servlet implementation class cadastrocliente
 */
@WebServlet("/CadastroPacote")
public class CadastroPacote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastroPacote() {
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
		
			DateTrasform dataTransform = new DateTrasform();		
				
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
			
			doGet(request, response);
		}		
}
