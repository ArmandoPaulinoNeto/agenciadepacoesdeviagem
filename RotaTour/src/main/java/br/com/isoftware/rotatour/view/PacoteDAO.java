package br.com.isoftware.rotatour.view;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.isoftware.rotatour.domain.Imagens;
import br.com.isoftware.rotatour.domain.Lugares;
import br.com.isoftware.rotatour.domain.Pacotes;
import br.com.isoftware.rotatour.model.repository.ImagensRepository;
import br.com.isoftware.rotatour.model.repository.LugaresRepository;
import br.com.isoftware.rotatour.model.repository.PacotesRepository;
import br.com.isoftware.rotatour.util.ConverteValores;

/**
 * Servlet implementation class cadastrocliente
 */
@WebServlet("/PacoteDAO")
public class PacoteDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PacoteDAO() {
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
		
		ConverteValores converteValores = new ConverteValores();
		Long codigo = Long.parseLong(request.getParameter("id"));
		System.out.println(codigo);
		LugaresRepository lr = new LugaresRepository();
		PacotesRepository lp = new PacotesRepository();
		ImagensRepository li = new ImagensRepository();
		
		Lugares lugar = lr.buscar(codigo);
		Pacotes pacote = lp.buscar(lugar.getId());
		List<Imagens> ResultImagens = li.buscarImagens(codigo);		
		
		String valor = converteValores.valorParaReal(pacote.getValor()).replace("R$ ", "");
		
		request.getSession().setAttribute("diarias", pacote.getDiarias());
		request.getSession().setAttribute("pais", lugar.getPais());
		request.getSession().setAttribute("capital", lugar.getCapital());
		request.getSession().setAttribute("cidade", lugar.getCidade());
		request.getSession().setAttribute("detalhe", lugar.getDetalhe());
		request.getSession().setAttribute("moeda", lugar.getMoeda());
		request.getSession().setAttribute("precoPacote", pacote.getValor());
		request.getSession().setAttribute("preco", valor);
		request.getSession().setAttribute("codigo", codigo);
		request.getSession().setAttribute("primera", ResultImagens.get(0).getImagem());
		request.getSession().setAttribute("segunda", ResultImagens.get(1).getImagem());
		request.getSession().setAttribute("terceira", ResultImagens.get(2).getImagem());
		request.getSession().setAttribute("quarta", ResultImagens.get(3).getImagem());
		response.sendRedirect("pacotes.jsp");
		doGet(request, response);
}//****************************Chave doPost*************************************************************
		
}
