package br.com.isoftware.rotatour.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cadastrocliente
 */
@WebServlet("/Compra")
public class Compra extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compra() {
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
		
			doGet(request, response);
		}//****************************Chave doPost*************************************************************
		
}
