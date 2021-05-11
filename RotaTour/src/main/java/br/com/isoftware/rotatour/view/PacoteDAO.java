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
		ConverteValores converteValores = new ConverteValores();
		Long codigo = Long.parseLong(request.getParameter("id"));
		
		LugaresRepository LR = new LugaresRepository();
		PacotesRepository LP = new PacotesRepository();
		ImagensRepository LI = new ImagensRepository();
		
		Lugares lugar = LR.buscar(codigo);
		Pacotes pacote = LP.buscar(lugar.getId());
		List<Imagens> ResultImagens = LI.buscarImagens(codigo);
		
		
		String valor = converteValores.valorParaReal(pacote.getValor()).replace("R$ ", "");
		
		request.setAttribute("diarias", pacote.getDiarias());
		request.setAttribute("pais", lugar.getPais());
		request.setAttribute("capital", lugar.getCapital());
		request.setAttribute("cidade", lugar.getCidade());
		request.setAttribute("detalhe", lugar.getDetalhe());
		request.setAttribute("moeda", lugar.getMoeda());		
		request.setAttribute("preco", valor);
		request.setAttribute("codigo", codigo);
		request.setAttribute("primera", ResultImagens.get(0).getImagem());
		request.setAttribute("segunda", ResultImagens.get(1).getImagem());
		request.setAttribute("terceira", ResultImagens.get(2).getImagem());
		request.setAttribute("quarta", ResultImagens.get(3).getImagem());
		
		RequestDispatcher destino = request.getRequestDispatcher("pacotes.jsp");
		destino.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					
			doGet(request, response);
}//****************************Chave doPost*************************************************************
		
}
