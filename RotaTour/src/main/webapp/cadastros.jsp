<%@page import="br.com.isoftware.rotatour.controller.util.DateTrasform"%>
<%@page import="br.com.isoftware.rotatour.domain.Imagens"%>
<%@page import="java.util.List"%>
<%@page import="br.com.isoftware.rotatour.domain.Pacotes"%>
<%@page import="br.com.isoftware.rotatour.domain.Lugares"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                        	<h2 class="display-5 text-primary">Cadastro de Cliente</h2>                            
                        </div>
              		</div> 
                    <div class="row justify-content-center mb-5">
              			<div class="col-sm-12 col-md-10 col-lg-8 text-center my-3">
                        <div class="linha mb-5"></div>
                        	  <form name="cadastroCliente" action="${pageContext.request.contextPath}/CadastroCliente" method="post" onSubmit="return enviardados();">
                                <div class="form-row">
                                     <div class="form-group col-sm-5">
                                            <label>Nome:</label>
                                            <input class="form-control" name="txtNome" id="txtNome" placeholder="Digite seu nome completo" maxlength="45">
                                     </div>
                                     <div class="form-group col-sm-3">
                                            <label>CPF:</label>
                                            <input class="cpf form-control" name="txtCPF" id="txtCPF">
                                     </div>
                                     <div class="form-group col-sm-1">
                                            <label>Sexo:</label></br>
                                            <select class="my-1" name="sltSexo">
                                                <option value="M">M</option>
                                                <option value="F">F</option>		                                                
                                            </select>
                                     </div>
                                     <div class="form-group col-sm-3">
                                            <label>Data Nasc:</label>
                                            <input class="dataNasc form-control" name="txtDataNascimento" id="txtDataNascimento">
                                     </div>

                                     <div class="form-group col-sm-5">
                                            <label>Logradouro:</label>
                                            <input class="form-control" name="txtLogradouro" id="txtLogradouro" maxlength="35">
                                     </div>
                                     <div class="form-group col-sm-3">
                                            <label>Bairro:</label>
                                            <input class="form-control" name="txtBairro" id="txtBairro" maxlength="35">
                                     </div>
                                     <div class="form-group col-sm-2">
                                            <label>Num:</label>
                                            <input class="numero form-control" name="txtNumero" id="txtNumero">
                                     </div>

                                     <div class="form-group col-sm-5">
                                            <label>Cidade:</label>
                                            <input class="form-control" name="txtCidade" id="txtCidade" maxlength="35">
                                     </div>
                                     <div class="form-group col-sm-2">
                                            <label>CEP:</label>
                                            <input class="cep form-control" name="txtCEP" id="txtCEP">
                                     </div>
                                     <div class="form-group col-sm-1">
                                            <label>UF:</label>
                                            <input class="form-control" name="txtUF" id="txtUF">
                                     </div>
							
									 <div class="form-group col-sm-3">
                                           <label>Contato:</label>
                                           <input class="contato form-control" name="txtContato" id="txtContato">
                                     </div>
                                     <div class="form-group col-sm-6">
                                           <label>Email:</label>
                                           <input class="form-control" name="txtEmail" id="txtEmail" maxlength="40">
                                     </div>                                   
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
<!-- Alerta com Modal -->	
	<div id="myModal" class="modal" tabindex="-1" role="dialog">
 		 <div class="modal-dialog" role="document">
    	 <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">Rota Tour - Compras</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
           </button>
         </div>
         <div class="modal-body">
               <p id="mensagem"></p>
         </div>
         <div class="modal-footer">              
         </div>
       </div>
  </div>
</div>
</body>

<!--Link para as pasta com os Scripts-->         
  	<script src="js/jquery.js"></script>
    <script src="js/jquery.mask.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.js"></script>    
    <script><!--máscaras para Inputs-->
        $('.cpf').mask('000.000.000-00');
        $('.contato').mask('(00) 00000-0000');
        $('.cep').mask('00000-000');
		$('.numero').mask('00000');		
        $('.dataNasc').mask('00/00/0000');
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
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Contato corretamente!";
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
			if (document.cadastroCliente.txtEmail.value == "" || document.cadastroCliente.txtEmail.value.length < 5  || document.cadastroCliente.txtEmail.value.indexOf("@") == -1 || document.cadastroCliente.txtEmail.value.indexOf(".") == -1){
				document.getElementById('mensagem').innerHTML = "Preencha o campo Login corretamente!";
				$("#myModal").modal({show: true});
				document.cadastroCliente.txtEmail.focus();
				return false;
			}
				return true;		
		}		  
	</script>
	<script>
		$('#myModal').on('shown.bs.modal', function() {
	
		    var $me = $(this);
	
		    $me.delay(3000).hide(0, function() {
		        $me.modal('hide');
		    });
		});
	</script>
 </html>
