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
			for (int i = 1; i < (quantidade-1); i++) {
				
				request.getSession().setAttribute("acNome"+String.valueOf(i), request.getParameter("txtNome"+String.valueOf(i)));
				request.getSession().setAttribute("acDataNascimento"+String.valueOf(i), request.getParameter("txtDataNascimento"+String.valueOf(i)));							
			}						
	
			request.getSession().setAttribute("mensagem", "Cadastros realizados com sucesso!");
			request.getSession().setAttribute("pagina", "acompanhantes");
			 
			response.sendRedirect("pagamento.jsp");
			
			doGet(request, response);
		}
}
