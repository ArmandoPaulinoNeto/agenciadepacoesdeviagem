<%@page import="br.com.isoftware.rotatour.controller.util.DateTrasform"%>
<%@page import="br.com.isoftware.rotatour.domain.Imagens"%>
<%@page import="java.util.List"%>
<%@page import="br.com.isoftware.rotatour.domain.Pacotes"%>
<%@page import="br.com.isoftware.rotatour.domain.Lugares"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                        	<h2 class="display-5 text-primary">Cadastro de acompanhate</h2>                            
                        </div>
              		</div> 
                    <div class="row justify-content-center mb-5">
              			<div class="col-sm-12 col-md-10 col-lg-8 text-center my-3">
                        <div class="linha mb-5"></div>
                        	  <form name="cadastroCliente" action="${pageContext.request.contextPath}/CadastroAcompanhante" method="post" onSubmit="return enviardados();">
                                <div class="form-row"> 
                                <c:forEach items="${campos}" var="obj">
                       		       
                                	<div class="form-group col-sm-7 ml-5">
                                       <label>Nome:</label>
                                       <input class="form-control" name="${obj.getCampoNome()}" id="${obj.getCampoNome()}" placeholder="Digite seu nome completo">
                                	</div>
                                	<div class="form-group col-sm-3">
                                       <label>Data Nasc:</label>
                                       <input class="dataNasc form-control" name="${obj.getCampoData()}" id="${obj.getCampoData()}">
                                	</div>                    	
                       			</c:forEach>
                                </div>
                                <div class="row justify-content-end mr-5"><button class="btn btn-outline-success mr-4 my-sm-4" type="submit">Enviar formulário</button></div>
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
        $('.dataNasc').mask('00/00/0000');
	</script>
	<!-- Alerta com Modal -->	
	<div id="myModal" class="modal" tabindex="-1" role="dialog">
 		 <div class="modal-dialog" role="document">
	    	 <div class="modal-content">
		         <div class="modal-header">
		            <h5 class="modal-title">Rota Tour - Acompanhantes</h5>
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
  <script type="text/javascript">
		function enviardados(){
			
			var quantidade = ${quantidade};
			
			if(quantidade > 1){		
											
					if(document.cadastroCliente.txtNome1.value.length < 15){
						document.getElementById('mensagem').innerHTML = "Preencha o campo Nome do Acompanhante corretamente!";
						$("#myModal").modal({show: true});
						document.cadastroCliente.txtNome1.focus();
						return false;
					}
					if(document.cadastroCliente.txtDataNascimento1.value.length < 10 || validaDat(document.cadastroCliente.txtDataNascimento1, document.cadastroCliente.txtDataNascimento1.value)){
						
						document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento do Acompanhante corretamente!";
						$("#myModal").modal({show: true});
						document.cadastroCliente.txtDataNascimento1.focus();
						return false;
					}
			}			
			if(quantidade > 2){		
								
				if(document.cadastroCliente.txtNome2.value.length < 15){
					document.getElementById('mensagem').innerHTML = "Preencha o campo Nome do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtNome2.focus();
					return false;
				}
				if(document.cadastroCliente.txtDataNascimento2.value.length < 10 || validaDat(document.cadastroCliente.txtDataNascimento2, document.cadastroCliente.txtDataNascimento2.value)){
					
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtDataNascimento2.focus();
					return false;
				}
			}
			if(quantidade > 3){		
				
				
				if(document.cadastroCliente.txtNome3.value.length < 15){
					document.getElementById('mensagem').innerHTML = "Preencha o campo Nome do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtNome3.focus();
					return false;
				}
				if(document.cadastroCliente.txtDataNascimento3.value.length < 10 || validaDat(document.cadastroCliente.txtDataNascimento3, document.cadastroCliente.txtDataNascimento3.value)){
					
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtDataNascimento3.focus();
					return false;
				}
			}
			if(quantidade > 4){		
								
				if(document.cadastroCliente.txtNome4.value.length < 15){
					document.getElementById('mensagem').innerHTML = "Preencha o campo Nome do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtNome4.focus();
					return false;
				}
				if(document.cadastroCliente.txtDataNascimento4.value.length < 10 || validaDat(document.cadastroCliente.txtDataNascimento4, document.cadastroCliente.txtDataNascimento4.value)){
					
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtDataNascimento4.focus();
					return false;
				}
			}
			if(quantidade > 5){		
								
				if(document.cadastroCliente.txtNome5.value.length < 15){
					document.getElementById('mensagem').innerHTML = "Preencha o campo Nome do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtNome5.focus();
					return false;
				}
				if(document.cadastroCliente.txtDataNascimento5.value.length < 10 || validaDat(document.cadastroCliente.txtDataNascimento5, document.cadastroCliente.txtDataNascimento5.value)){
					
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtDataNascimento5.focus();
					return false;
				}
			}
			if(quantidade > 6){		
								
				if(document.cadastroCliente.txtNome6.value.length < 15){
					document.getElementById('mensagem').innerHTML = "Preencha o campo Nome do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtNome6.focus();
					return false;
				}
				if(document.cadastroCliente.txtDataNascimento6.value.length < 10 || validaDat(document.cadastroCliente.txtDataNascimento6, document.cadastroCliente.txtDataNascimento6.value)){
					
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtDataNascimento6.focus();
					return false;
				}
			}
			if(quantidade > 7){		
								
				if(document.cadastroCliente.txtNome7.value.length < 15){
					document.getElementById('mensagem').innerHTML = "Preencha o campo Nome do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtNome7.focus();
					return false;
				}
				if(document.cadastroCliente.txtDataNascimento7.value.length < 10 || validaDat(document.cadastroCliente.txtDataNascimento7, document.cadastroCliente.txtDataNascimento7.value)){
					
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtDataNascimento7.focus();
					return false;
				}
			}
			if(quantidade > 8){		
								
				if(document.cadastroCliente.txtNome8.value.length < 15){
					document.getElementById('mensagem').innerHTML = "Preencha o campo Nome do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtNome8.focus();
					return false;
				}
				if(document.cadastroCliente.txtDataNascimento8.value.length < 10 || validaDat(document.cadastroCliente.txtDataNascimento8, document.cadastroCliente.txtDataNascimento8.value)){
					
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento do Acompanhante corretamente!"; 
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtDataNascimento8.focus();
					return false;
				}
			}
			if(quantidade > 9){		
								
				if(document.cadastroCliente.txtNome9.value.length < 15){
					document.getElementById('mensagem').innerHTML = "Preencha o campo Nome do Acompanhante corretamente!";
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtNome9.focus();
					return false;
				}
				if(document.cadastroCliente.txtDataNascimento9.value.length < 10 || validaDat(document.cadastroCliente.txtDataNascimento9, document.cadastroCliente.txtDataNascimento9.value)){
					
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento do Acompanhante corretamente!"; 
					$("#myModal").modal({show: true});
					document.cadastroCliente.txtDataNascimento9.focus();
					return false;
				}
			}
			return true;
		}		  
	</script>
	<script>
		function validaDat(campo,valor) {
			var date=valor;
			var ardt=new Array;
			var ExpReg=new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
			ardt=date.split("/");
			erro=false;
			if ( date.search(ExpReg)==-1){
				erro = true;
				}
			else if (((ardt[1]==4)||(ardt[1]==6)||(ardt[1]==9)||(ardt[1]==11))&&(ardt[0]>30))
				erro = true;
			else if ( ardt[1]==2) {
				if ((ardt[0]>28)&&((ardt[2]%4)!=0))
					erro = true;
				if ((ardt[0]>29)&&((ardt[2]%4)==0))
					erro = true;
			}
			if (erro) {		
				campo.focus();
				campo.value = "";
				$(campo).addClass("is-invalid");
				return true;
			}
			$(campo).removeClass("is-invalid");
			$(campo).addClass("is-valid");
			return false;
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
 </body>  
 </html>