package br.com.isoftware.rotatour.view;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.isoftware.rotatour.domain.CamposAcompanhante;
import br.com.isoftware.rotatour.util.ConverteValores;

/**
 * Servlet implementation class cadastrocliente
 */
@WebServlet("/CadastroCliente")
public class CadastroCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastroCliente() {
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
		
		request.getSession().setAttribute("Nome", request.getParameter("txtNome"));
		request.getSession().setAttribute("CPF", request.getParameter("txtCPF"));
		request.getSession().setAttribute("Sexo", request.getParameter("sltSexo"));
		request.getSession().setAttribute("DataNascimento", request.getParameter("txtDataNascimento"));
		request.getSession().setAttribute("Logradouro", request.getParameter("txtLogradouro"));
		request.getSession().setAttribute("Bairro", request.getParameter("txtBairro"));
		request.getSession().setAttribute("Numero", request.getParameter("txtNumero"));
		request.getSession().setAttribute("Cidade", request.getParameter("txtCidade"));
		request.getSession().setAttribute("UF", request.getParameter("txtUF"));
		request.getSession().setAttribute("CEP", request.getParameter("txtCEP"));
		request.getSession().setAttribute("Email", request.getParameter("txtEmail"));
		request.getSession().setAttribute("Contato", request.getParameter("txtContato"));
		request.getSession().setAttribute("quantidade", quantidade);
		
		request.getSession().setAttribute("mansagem", "Cadastros realizados com sucesso!");
		
		if(quantidade > 1){
			
			ArrayList<CamposAcompanhante> campos = new ArrayList<CamposAcompanhante>();
			
			for (int i = 1; i < quantidade; i++) {
				
				CamposAcompanhante obj = new CamposAcompanhante();
				obj.setCampoNome("txtNome"+String.valueOf(i));
				obj.setCampoData("txtDataNascimento"+String.valueOf(i));
				campos.add(obj);
			}
			request.getSession().setAttribute("campos", campos);
			response.sendRedirect("cadastrosacompanhante.jsp");
		}else{
			
			ConverteValores converteValores = new ConverteValores();
			String subtotal = (String) request.getSession().getAttribute("subtotal");
			String parcelas[] = converteValores.RetornaValoresParcelas(subtotal);
			request.getSession().setAttribute("parcelas", parcelas);
			response.sendRedirect("pagamento.jsp");			
		}
		doGet(request, response);
	}
}
