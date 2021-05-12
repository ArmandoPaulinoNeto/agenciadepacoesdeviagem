package br.com.isoftware.rotatour.view;

import java.io.IOException;
import java.math.BigDecimal;
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
@WebServlet("/CompraDAO")
public class CompraDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompraDAO() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ConverteValores converteValores = new ConverteValores();

		int quantidade = Integer.parseInt(request.getParameter("quantidade"));				
		request.getSession().setAttribute("quantidade", quantidade);		
		request.getSession().setAttribute("saida", request.getParameter("saida"));		
		BigDecimal valor = (BigDecimal) request.getSession().getAttribute("precoPacote");
		String subtotal = converteValores.valorParaReal(valor, quantidade);
		request.getSession().setAttribute("subtotal", subtotal.replace("R$ ", ""));	
		
		response.sendRedirect("compras.jsp");
		doGet(request, response);
	}//****************************Chave doPost*************************************************************
		
}
