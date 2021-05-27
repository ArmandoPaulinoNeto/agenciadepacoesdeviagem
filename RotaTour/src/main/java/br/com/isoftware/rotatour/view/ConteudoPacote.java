package br.com.isoftware.rotatour.view;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.isoftware.rotatour.controller.Controller;
import br.com.isoftware.rotatour.domain.Conteudo;
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
@WebServlet("/ConteudoPacote")
public class ConteudoPacote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConteudoPacote() {
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
				
		Long codigo = Long.parseLong(request.getParameter("id"));
		Controller controller = new Controller();
		Conteudo conteudo = controller.buscarPacotes(codigo);
		
		request.getSession().setAttribute("diarias", conteudo.getDiarias());
		request.getSession().setAttribute("pais", conteudo.getPais());
		request.getSession().setAttribute("capital", conteudo.getCapital());
		request.getSession().setAttribute("cidade", conteudo.getCidade());
		request.getSession().setAttribute("detalhe", conteudo.getDetalhe());
		request.getSession().setAttribute("moeda", conteudo.getMoeda());
		request.getSession().setAttribute("precoPacote", conteudo.getValor());
		request.getSession().setAttribute("preco", conteudo.getPreco());
		request.getSession().setAttribute("codigo", codigo);
		request.getSession().setAttribute("primera", conteudo.getPrimeira());
		request.getSession().setAttribute("segunda", conteudo.getSegunda());
		request.getSession().setAttribute("terceira", conteudo.getTerceira());
		request.getSession().setAttribute("quarta", conteudo.getQuarta());
		request.getSession().setAttribute("pacote", conteudo.getPacote());
		response.sendRedirect("pacotes.jsp");
		doGet(request, response);
}//****************************Chave doPost*************************************************************
		
}
