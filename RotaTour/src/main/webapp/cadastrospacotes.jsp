<%@page import="br.com.isoftware.rotatour.controller.util.DateTrasform"%>
<%@page import="br.com.isoftware.rotatour.domain.Imagens"%>
<%@page import="java.util.List"%>
<%@page import="br.com.isoftware.rotatour.domain.Pacotes"%>
<%@page import="br.com.isoftware.rotatour.domain.Lugares"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
/*
String mensagem = (String) session.getAttribute("mensagem");
String pagina = (String) session.getAttribute("pagina");
String saida = (String) session.getAttribute("saida");
int quantidade = (int) session.getAttribute("quantidade");
if(pagina.equals("compras")){
	
	session.setAttribute("pagina", "cadastros");
}else{
	   if(mensagem.contains("sucesso")){
		   
		  	quantidade = (int) request.getSession().getAttribute("quantidade");
			if(quantidade > 1){
				response.sendRedirect("cadastrosacompanhante.jsp");
			}else{
				
				response.sendRedirect("index.jsp");
			}
	   }
}*/
%>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Rota Tour</title>   
    <link href="bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="bootstrap/swiper.min.css" rel="stylesheet" type="text/css">
    <link href="css/stile.css" rel="stylesheet" type="text/css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body id="corpo">	
     <section class="topo_site">
              <div class="container">
					<div class="row">
              			<div class="col-xs-12">
                        	<img src="imagens/logorotatour.png">
                        </div>
              		</div>                        	
              </div>
<!--Começo da teg NavBar-->  
	<nav class="navbar navbar-expand-lg navbar-dark bg-transparent">
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#">Principal<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Quem Somos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Fale conosco</a>
              </li>                      
            </ul>            
          </div>
          </nav><!--Fim da teg NavBar-->
          </section>  
<!--section contúdo do cadastros-->                  
          <section>
				<div class="container">
					<div class="row">
              			<div class="col-12 text-center my-5">
                        	<h2 class="display-5 text-primary">Cadastro de pacotes</h2>                            
                        </div>
              		</div> 
                    <div class="row justify-content-center mb-5">
              			<div class="col-sm-12 col-md-10 col-lg-8 text-center my-3">
                        <div class="linha mb-5"></div>
                        	  <form name="cadastroPacotes" action="${pageContext.request.contextPath}/cliente" method="post"><!-- onSubmit="return enviardados();" -->
                                <div class="form-row">
                                     <div class="form-group col-sm-4">
                                            <label>País:</label>
                                            <input class="form-control" name="txtPais" id="txtPais">
                                     </div>
                                     <div class="form-group col-sm-4">
                                            <label>Capital:</label>
                                            <input class="form-control" name="txtCapital" id="txtCapital">
                                     </div>
                                     <div class="form-group col-sm-4">
                                            <label>Cidade:</label>
                                            <input class="form-control" name="txtCidade" id="txtCidade">
                                     </div>
                                     <div class="form-group col-sm-4">
                                            <label>Moeda:</label>
                                            <input class="form-control" name="txtMoeda" id="txtMoeda">
                                     </div>                                     
                                     <div class="form-group col-sm-2">
                                            <label>Data inicio:</label>
                                            <input class="dataNasc form-control" name="txtDataInicio" id="txtDataInicio">
                                     </div>
									 <div class="form-group col-sm-2">
                                            <label>Data fim:</label>
                                            <input class="dataNasc form-control" name="txtDataFim" id="txtDataFim">
                                     </div>
                                     <div class="form-group col-sm-1">
                                            <label>Diarias:</label>
                                            <input class="form-control" name="txtDiarias" id="txtDiarias">
                                     </div>
                                     <div class="form-group col-sm-2">
                                            <label>Valor:</label>
                                            <input class="numero form-control" name="txtValor" id="txtValor">
                                     </div>                                     
                                     <div class="form-group col-sm-6">
                                            <label>Imagem:</label>
                                            <input class="form-control" name="txtImagem" id="txtImagem">
                                     </div>
                                     <div class="form-row">
                                     	 
	                                     <div class="form-group col-sm-12">
	                                     	<label class="form-group col-sm-12">Detalhe:</label>                                            
                                            <textarea class="form-control ml-1" rows="5" cols="98" name="txtDetalhe" id="txtDetalhe" maxlength="500"></textarea>
	                                     </div>
                                     </div>  
                                     <div class="linha mb-5"></div>                                                                      
                                </div>
                                <div class="row justify-content-end mr-2"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Enviar formulário</button></div>
                              </form>                        
                        </div>
              		</div>                       	
              </div>
          </section>
<!--Fim da section contúdo do Pacote-->          
<!--segunda_secao: O paralax do contúdo-->          
          <section class="segunda_secao"></section> 
<!-- rodape_site-->          
   		  <section class="rodape_site">
              <div class="container">
					<div class="row">
              			<div class="col-xs-12">
                        	<h1>Rota Tour - É um prazer te-lo conosco!</h1>
                            <p>Todos os direitos reservados!</p>
                        </div>
              		</div>                        	
              </div>
          </section>
<!--fim rodape_site-->
<!--Link para as pasta com os Scripts-->         
  	<script src="js/jquery.js"></script>
    <script src="js/jquery.mask.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.js"></script>    
    <script><!--máscaras para Inputs-->
        $('.cpf').mask('000.000.000-00');
        $('.cnpj').mask('00.000.000/0000-00');
        $('.contato').mask('(00) 00000-0000');
        $('.cep').mask('00000-000');
		$('.numero').mask('00000');		
        $('.dataNasc').mask('00/00/0000');
        $('.placaCarro').mask('AAA-0000');
        $('.horasMinutos').mask('00:00');
        $('.cartaoCredito').mask('0000 0000 0000 0000');
	</script>
  <script type="text/javascript">
		function enviardados(){		
							
			if(document.cadastroCliente.txtNome.value.length < 15){
				
					document.getElementById('mensagem').innerHTML = "Preencha campo Nome corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtNome.focus();
					return false;
			}			  
			  
			if(document.cadastroCliente.txtCPF.value.length < 14){
				    
					document.getElementById('mensagem').innerHTML = "Preencha campo CPF corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtCPF.focus();
					return false;
			}
			  
			if (document.cadastroCliente.txtDataNascimento.value.length < 10){
				
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtDataNascimento.focus();
					return false;
			}		
			
			if (document.cadastroCliente.txtLogradouro.value.length < 5){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Logradouro corretamente!";
				$("#myModal").modal({show: true});
				document.cadastroCliente.txtLogradouro.focus();
				return false;
			}
			if (document.cadastroCliente.txtBairro.value.length < 5){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Bairro corretamente!";
				$("#myModal").modal({show: true});
				document.cadastroCliente.txtBairro.focus();
				return false;
			}
			if (document.cadastroCliente.txtNumero.value == ""){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Numero corretamente!";
				$("#myModal").modal({show: true});
				document.cadastroCliente.txtNumero.focus();
				return false;
			}
			if (document.cadastroCliente.txtCidade.value == ""){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Cidade corretamente!";
				$("#myModal").modal({show: true});
				document.cadastroCliente.txtCidade.focus();
				return false;
			}
			if (document.cadastroCliente.txtContato.value.length < 15){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Contato corretamente!";
				$("#myModal").modal({show: true});
				document.cadastroCliente.txtContato.focus();
				return false;
			}
			if (document.cadastroCliente.txtCEP.value.length < 9){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo CEP corretamente!";
				$("#myModal").modal({show: true});
				document.cadastroCliente.txtCEP.focus();
				return false;
			}
			if (document.cadastroCliente.txtContato.value.length < 15){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Contado corretamente!";
				$("#myModal").modal({show: true});
				document.cadastroCliente.txtContato.focus();
				return false;
			}
			if (document.cadastroCliente.txtUF.value.length < 2){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo UF corretamente!";
				$("#myModal").modal({show: true});
				document.cadastroCliente.txtUF.focus();
				return false;
			}
			if(document.cadastroCliente.txtEmail.value.length < 12 || document.cadastroCliente.txtEmail.value.indexOf('@') == -1 || document.cadastroCliente.txtEmail.value.indexOf('.') == -1){
				
				document.getElementById('mensagem').innerHTML = "Preencha campo Email corretamente!";
				$("#myModal").modal({show: true});
				document.cadatroCartao.txtEmail.focus();
				return false;
			}
			return true;
		}		  
	</script>
 </body>  
 </html>
