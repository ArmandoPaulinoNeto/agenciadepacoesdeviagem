package br.com.isoftware.rotatour.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.isoftware.rotatour.util.ConverteValores;

/**
 * Servlet implementation class cadastrocliente
 */
@WebServlet("/CadastroAcompanhante")
public class CadastroAcompanhante extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastroAcompanhante() {
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

			int quantidade = (int) request.getSession().getAttribute("quantidade");
			for (int i = 1; i < quantidade; i++) {
				
				request.getSession().setAttribute("acNome"+String.valueOf(i), request.getParameter("txtNome"+String.valueOf(i)));
				request.getSession().setAttribute("acDataNascimento"+String.valueOf(i), request.getParameter("txtDataNascimento"+String.valueOf(i)));							
			}
			
			ConverteValores converteValores = new ConverteValores();
			String subtotal = (String) request.getSession().getAttribute("subtotal");
			String parcelas[] = converteValores.RetornaValoresParcelas(subtotal);
			request.getSession().setAttribute("parcelas", parcelas);
			response.sendRedirect("pagamento.jsp");
			
			doGet(request, response);
		}
}
