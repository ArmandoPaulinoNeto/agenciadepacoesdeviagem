package br.com.isoftware.rotatour.view;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.isoftware.rotatour.domain.Acesso;
import br.com.isoftware.rotatour.model.repository.AcessoRepository;

/**
 * Servlet implementation class cadastrocliente
 */
@WebServlet("/Acessar")
public class Acessar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Acessar() {
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
					    
			String login = request.getParameter("txtLogin");
			String senha = request.getParameter("txtSenha");
			//Short tipoAcesso = new Short((String) request.getSession().getAttribute("tipoAcesso"));
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
				 
				 response.sendRedirect("cadastrospacotes.jsp");
			 }else {
				 
				 response.sendRedirect("index.jsp");
			 }	

			doGet(request, response);
		}//****************************Chave doPost*************************************************************
		
}
