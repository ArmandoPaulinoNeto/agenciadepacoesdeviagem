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
import br.com.isoftware.rotatour.domain.Acesso;
import br.com.isoftware.rotatour.domain.Conteudo;
import br.com.isoftware.rotatour.domain.Imagens;
import br.com.isoftware.rotatour.domain.Lugares;
import br.com.isoftware.rotatour.domain.Pacotes;
import br.com.isoftware.rotatour.model.repository.AcessoRepository;
import br.com.isoftware.rotatour.model.repository.ImagensRepository;
import br.com.isoftware.rotatour.model.repository.LugaresRepository;
import br.com.isoftware.rotatour.model.repository.PacotesRepository;
import br.com.isoftware.rotatour.util.ConverteValores;

/**
 * Servlet implementation class cadastrocliente
 */
@WebServlet("/ConteudoIndex")
public class ConteudoIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConteudoIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Controller controller = new Controller();
		List<Conteudo> conteudo = controller.buscarLugaresEpacotes();
		request.getSession().setAttribute("conteudo", conteudo);
		response.sendRedirect("principal.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		}//****************************Chave doPost*************************************************************
		
}
