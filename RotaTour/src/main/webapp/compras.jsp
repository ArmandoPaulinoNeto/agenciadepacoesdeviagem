<%@page import="br.com.isoftware.rotatour.util.ConverteValores"%>
<%@page import="br.com.isoftware.rotatour.controller.util.DateTrasform"%>
<%@page import="br.com.isoftware.rotatour.model.repository.LugaresRepository"%>
<%@page import="br.com.isoftware.rotatour.domain.Imagens"%>
<%@page import="br.com.isoftware.rotatour.model.repository.PacotesRepository"%>
<%@page import="java.util.List"%>
<%@page import="br.com.isoftware.rotatour.domain.Pacotes"%>
<%@page import="br.com.isoftware.rotatour.model.repository.ImagensRepository"%>
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
<!--section contúdo do Pacote-->                  
          <section>
          			<div class="container">
					<div class="row">
                        <div class="col-xs-12"> 
                        <!--div class="direita"-->
                              <div class="direita">
                              		<!-- Conteudo dos detalhes-->
                                    <h6><b>Pacote ${cidade} - 2021</b></h6>
                                	<div><b>Aéreo</b> <img src="imagens/icinspacote/aeria.png">&nbsp;<b>Hotel</b> <img src="imagens/icinspacote/hotel.png">&nbsp;<b>Transporte</b> <img src="imagens/icinspacote/transporte.png"></div>
                                    	<div class="linha"></div>
                                            <div class="card border-primary mb-3" style="max-width: 18rem;">
                                              <div class="card-header bg-light">Opções do Pacote:</div>
                                              <div class="card-body text-primary">
                                              <h5 class="card-title">Configuração:</h5>                                              
                                              <p class="card-text"><b>Pessoas: </b>${quantidade}</p>
                                              <p class="card-text"><b>Diarias: </b>${diarias}</p>
                                              <p class="card-text"><b>Saída: </b>${saida}</p>
                                              <div class="linha"></div>
                                              <h5 class="card-title">Periodo da Viagem:</h5>
                                              <p class="card-text"><b>A partir da data: </b>01 Abr 2021</p>
                                              <p class="card-text"><b>Até a data: </b>01 Nov 2021</p>
                                              <div class="linha"></div>
                                              <h5 class="card-title">Valor da compra:</h5>
                                              <div class="linha"></div>
                                              <p class="card-text" name="" id="preco"><b>Pacote: </b>${preco}</p>
                                              <p class="card-text" name="subtotal"  id="subtotal"><b>Subtototal: </b>${subtotal}</p>
                                          	  </div>
											</div>
                          </div><!--div class="direita"-->                        	 
                           <div class="esquerda"> <!--div class="esquerda"-->
                                <section>
                                  <div class="container">
                                    <div class="quadro">
                                        <div id="carouselsite" class="carousel show" data-ride="carousel">
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active"><img src="imagens/lugares/${primera}" class="img-fluid d-block"></div>         
                                                    <div class="carousel-item"><img src="imagens/lugares/${segunda}" class="img-fluid d-block"></div>
                                                    <div class="carousel-item"><img src="imagens/lugares/${terceira}" class="img-fluid d-block"></div>
                                                    <div class="carousel-item"><img src="imagens/lugares/${terceira}" class="img-fluid d-block"></div>                
                                                </div><!--carousel-inner-->
                                            <a class="carousel-control-prev" href="#carouselsite" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon"></span>
                                                <span class="sr-only">anterior</span>
                                            </a>
                                            <a class="carousel-control-next" href="#carouselsite" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon"></span>
                                                <span class="sr-only">posterior</span>
                                            </a>
                                         </div><!--carousel-show-->
                                         <div class="dt"><!--Detalhes do produto--> 
                                            <form class="m-2 bg-light" name="cadatroCartao" action="${pageContext.request.contextPath}/Compra" method="post" onSubmit="return enviardados();">
                                                  <div class="form-row">
                                                        <div class="form-row">
                                                        	<h6 class="display-5 col-sm-12 text-primary">Escolha a data da sua viagem.</h6>
                                                            <div class="form-group col-sm-4">
                                                                    <label>Data da ida (opção 1)</label>
                                                                    <input class="dataNasc form-control" name="txtDataIda" id="txtDataIda" placeholder="00/00/0000">
                                                            </div>
                                                            <div class="form-group col-sm-4">
                                                                    <label>Data da ida (opção 2)</label>
                                                                    <input class="dataNasc form-control" name="txtDataIda1" id="txtDataIda1" placeholder="00/00/0000">
                                                            </div>
                                                            <div class="form-group col-sm-4">
                                                                    <label>Data da ida (opção 3)</label>
                                                                    <input class="dataNasc form-control" name="txtDataIda2" id="txtDataIda2" placeholder="00/00/0000">
                                                            </div>
															<div class="form-group ml-3">
															  <label for="NomeEscola" style="font-weight: normal">
																	<input name="opcoesData" id="opcoesData" type="checkbox" onclick="desabilitar(this.checked)"/>Não quero imformar as datas agora. Garanta apenas o pacote.</label>
															  <div class="input-group">
															    <div class="input-group-addon" style="background-color: #FAFAFA">
															      <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
															    </div>
															  </div>
															</div>
                                     					</div><!--form-row Data-->
                                     					<div class="linha"></div>
                                     					<div class="form-row"><!--form-row Acesso-->
                                     						<h6 class="display-5 col-sm-12 text-primary">Cadastre login e senha para futuramente acessar seu cadastro.</h6>
												             <div class="form-group col-sm-6">
                                                                    <label>Login:</label>
                                                                    <input class="form-control" name="txtLogin" id="txtLogin">
                                                            </div>
                                                            <div class="form-group col-sm-4">
                                                                    <label>Senha:</label>
                                                                    <input class="form-control" type="password" name="txtSenha" id="txtSenha">
                                                            </div>
                                                         </div>                                                        
                                     					<div class="linha"></div>                                                        
                                                  </div><!--form-row geral-->
                                                  <!--botão-->
                                                  <div class="row justify-content-end mr-2"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Confirmar</button></div>
											</form>
                                         </div><!--Detalhes do produto-->
                                    </div><!--div quadro-->   
                                   </div><!--container-->
                                  </section>
                              </div>
                          <!--esquerda-->                          
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
        $('.contato').mask('(00) 00000-0000');
		$('.cartao').mask('0000 0000 0000 0000');
		$('.validade').mask('00/00');
		$('.codSeguranca').mask('000');
        $('.dataNasc').mask('00/00/0000');
	</script>
	<script type="text/javascript">
		function validarCPF(strCPF) {
			
			strCPF = strCPF.replace(/[^0-9]/g, '')
		    var  Soma = 0;
		    var Resto;
		   
			if (strCPF == ""){				
				$("#txtCPFtitular").addClass("is-invalid");
				return false;
			}			  
		  	for (i=1; i<=9; i++){
		  		Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);
		  	}
		  	
		 	Resto = (Soma * 10) % 11;
		
		    if ((Resto == 10) || (Resto == 11)){
		    	Resto = 0;
		    }				
		    if (Resto != parseInt(strCPF.substring(9, 10))){
		    	$("#txtCPFtitular").addClass("is-invalid");
		    	return false;
		    }
		    
		  	Soma = 0;
		  	
		    for (i = 1; i <= 10; i++){
		    	Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i);
		    }
				
		    Resto = (Soma * 10) % 11;		
		    if ((Resto == 10) || (Resto == 11)){
		    	Resto = 0;
		    }				
		    if (Resto != parseInt(strCPF.substring(10, 11) )){
		    	$("#txtCPFtitular").addClass("is-invalid");
		    	return false;
		    }
		    $("#txtCPFtitular").removeClass("is-invalid");
		    $("#txtCPFtitular").addClass("is-valid");
		    return true;
		}	
	</script>	
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
    <script type="text/javascript">
	  function desabilitar(selecionado) {
		  
		    if(selecionado){		    	
		    	
		    	<%session.setAttribute("selecionado", true);%>
		    }else{
		    	
		    	<%session.setAttribute("selecionado", false);%>
		    }
		    document.getElementById('txtDataIda').disabled = selecionado;
		    document.getElementById('txtDataIda1').disabled = selecionado;
		    document.getElementById('txtDataIda2').disabled = selecionado;
	  }
	</script>
	<script type="text/javascript">
		function enviardados(){			
			
			if (!document.cadatroCartao.txtDataIda.disabled){				
				
					if (document.cadatroCartao.txtDataIda.value.length < 10 || validaDat(document.cadatroCartao.txtDataIda, document.cadatroCartao.txtDataIda.value)){
						
							document.getElementById('mensagem').innerHTML = "Preencha o campo Data da ida (opção 1) corretamente!";
							$("#myModal").modal({show: true});
							document.cadatroCartao.txtDataIda.focus();
							return false;
					}if(document.cadatroCartao.txtDataIda1.value.length < 10 || validaDat(document.cadatroCartao.txtDataIda1, document.cadatroCartao.txtDataIda1.value)){
						
							document.getElementById('mensagem').innerHTML = "Preencha o campo Data da ida (opção 2) corretamente!";
							$("#myModal").modal({
						   		 show: true
						    });
							document.cadatroCartao.txtDataIda1.focus();
							return false;
					}if(document.cadatroCartao.txtDataIda2.value.length < 10 || validaDat(document.cadatroCartao.txtDataIda2, document.cadatroCartao.txtDataIda2.value)){
						
						    document.getElementById('mensagem').innerHTML = "Preencha o campo Data da ida (opção 3) corretamente!";
						    $("#myModal").modal({
						   		 show: true
						    });
							document.cadatroCartao.txtDataIda2.focus();
							return false;
					}	
			}
			if (document.cadatroCartao.txtLogin.value == "" || document.cadatroCartao.txtLogin.value.length < 5 || document.cadatroCartao.txtLogin.value.indexOf("@") == -1 || document.cadatroCartao.txtLogin.value.indexOf(".") == -1){
				document.getElementById('mensagem').innerHTML = "Preencha o campo Login corretamente!";
				$("#myModal").modal({
			   		 show: true
			    });
				document.cadatroCartao.txtLogin.focus();
				return false;
			}	
			if (document.cadatroCartao.txtSenha.value == ""){
				document.getElementById('mensagem').innerHTML = "Preencha o campo Senha corretamente!";
				$("#myModal").modal({
			   		 show: true
			    });
				document.cadatroCartao.txtSenha.focus();
				return false;
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
 </html>
