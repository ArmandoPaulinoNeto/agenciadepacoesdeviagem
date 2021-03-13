<%@page import="br.com.isoftware.rotatour.util.ConverteValores"%>
<%@page import="br.com.isoftware.rotatour.controller.util.DateTrasform"%>
<%@page import="br.com.isoftware.rotatour.model.repository.LugaresRepository"%>
<%@page import="br.com.isoftware.rotatour.domain.Imagens"%>
<%@page import="br.com.isoftware.rotatour.model.repository.PacotesRepository"%>
<%@page import="java.util.List"%>
<%@page import="br.com.isoftware.rotatour.domain.Pacotes"%>
<%@page import="br.com.isoftware.rotatour.model.repository.ImagensRepository"%>
<%@page import="br.com.isoftware.rotatour.domain.Lugares"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
LugaresRepository LR = new LugaresRepository();
PacotesRepository LP = new PacotesRepository();
ImagensRepository LI = new ImagensRepository();
DateTrasform dataString = new DateTrasform();
ConverteValores converteValores = new ConverteValores();
Long codigo = (Long) session.getAttribute("codigo");
int quantidade = 0;
String saida = "";

String pagina = (String) session.getAttribute("pagina");
String mensagem = (String) session.getAttribute("mensagem");
if(pagina.equals("pacotes")){
	
	session.setAttribute("pagina", "compras");	
	quantidade = Integer.parseInt(request.getParameter("pessoas"));
	session.setAttribute("quantidade", quantidade);
	saida = request.getParameter("saida");
	session.setAttribute("saida", saida);
}else{
	quantidade = (int) session.getAttribute("quantidade");
	saida = (String) session.getAttribute("saida");
}
/*
if(mensagem != null){
	if(mensagem.contains("sucesso")){
		response.sendRedirect("cadastros.jsp");
	}else{
			%><script>
				alert(<%=mensagem%>);
			</script>		    
		<%
	}	
}
*/
Lugares lugar = LR.buscar(codigo);
Pacotes pacote = LP.buscar(lugar.getId());
List<Imagens> ResultImagens = LI.buscarImagens(pacote.getId());

String subtotal = converteValores.valorParaReal(pacote.getValor(), quantidade);
session.setAttribute("subtotal", subtotal.replace("R$ ", ""));
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
            <form class="form-inline mx-lg-5 my-lg-0">
              <input class="form-control mr-sm-2" type="search" placeholder="Pesquisar" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Pesquisar</button>
            </form>
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
                                    <h6><b>Pacote <%out.print(lugar.getCidade());%> - 2021</b></h6>
                                	<div><b>Aéreo</b> <img src="imagens/icinspacote/aeria.png">&nbsp;<b>Hotel</b> <img src="imagens/icinspacote/hotel.png">&nbsp;<b>Transporte</b> <img src="imagens/icinspacote/transporte.png"></div>
                                    	<div class="linha"></div>
                                            <div class="card border-primary mb-3" style="max-width: 18rem;">
                                              <div class="card-header bg-light">Opções do Pacote:</div>
                                              <div class="card-body text-primary">
                                              <h5 class="card-title">Configuração:</h5>                                              
                                              <p class="card-text"><b>Pessoas: </b><%=quantidade%></p>
                                              <p class="card-text"><b>Diarias: </b><%=pacote.getDiarias()%></p>
                                              <p class="card-text"><b>Saída: </b><%=saida%></p>
                                              <div class="linha"></div>
                                              <h5 class="card-title">Periodo da Viagem:</h5>
                                              <p class="card-text"><b>A partir da data: </b>01 Abr 2021</p>
                                              <p class="card-text"><b>Até a data: </b>01 Nov 2021</p>
                                              <div class="linha"></div>
                                              <h5 class="card-title">Valor da compra:</h5>
                                              <div class="linha"></div>
                                              <p class="card-text" name="" id="preco"><b>Pacote: </b><%=converteValores.valorParaReal(pacote.getValor())%></p>
                                              <p class="card-text" name="subtotal"  id="subtotal"><b>Subtototal: </b><%=subtotal%></p>
                                          	  </div>
											</div>
                          </div>
                          <!--div class="direita"-->
                        	  <!--div class="esquerda"-->                       	
                           
                              <!--div class="esquerda"-->
                              
                          <!--esquerda-->
                           <div class="esquerda"> 	
                                <section>
                                  <div class="container">
                                    <div class="quadro">
                                        <div id="carouselsite" class="carousel show" data-ride="carousel">
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active"><img src="imagens/lugares/<%=ResultImagens.get(0).getImagem()%>" class="img-fluid d-block"></div>         
                                                    <div class="carousel-item"><img src="imagens/lugares/<%=ResultImagens.get(1).getImagem()%>" class="img-fluid d-block"></div>
                                                    <div class="carousel-item"><img src="imagens/lugares/<%=ResultImagens.get(2).getImagem()%>" class="img-fluid d-block"></div>
                                                    <div class="carousel-item"><img src="imagens/lugares/<%=ResultImagens.get(3).getImagem()%>" class="img-fluid d-block"></div>                
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
                                            <form class="m-2 bg-light" name="cadatroCartao" action="${pageContext.request.contextPath}/cliente" method="post" onSubmit="return enviardados();">
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
                                                        <div class="form-row"><!--form-row dados do pagamento-->
                                                        	<h6 class="display-5 col-sm-12 text-primary">Dados do pagamento.</h6>
                                                            <div class="form-group col-sm-6">
                                                                    <label>Numero do cartão de credito:</label>
                                                                    <input class="cartao form-control" name="txtNumCartao" id="txtNumCartao" placeholder="0000 0000 0000 0000">
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                    <label>Nome do titular:</label>
                                                                    <input class="form-control" name="txtNomeTitular" maxlength="25" id="txtNomeTitular">
                                                            </div>
                                                            <div class="form-group col-sm-2">
                                                                    <label>Validade:</label>
                                                                    <input class="validade form-control" name="txtValidade" id="txtValidade" placeholder="00/00">
                                                            </div>
                                                            <div class="form-group col-sm-3">
                                                                    <label>Cód. de segurança:</label>
                                                                    <input class="codSeguranca form-control" name="txtCodSeguranca" id="txtCodSeguranca" placeholder="000">
                                                            </div>
                                                            <div class="form-group col-sm-3">
                                                                    <label>N. de Parcelas:</label>
                                                                    <select id="sltParcelas" name="sltParcelas" onChange="atualizaPreco()">
                                                                        <option value="1">1x</option>
                                                                        <option value="2">2x</option>
                                                                        <option value="3">3x</option>
                                                                        <option value="4">4x</option>
                                                                        <option value="5">5x</option>
                                                                        <option value="6">6x</option>
                                                                        <option value="7">7x</option>
                                                                        <option value="8">8x</option>
                                                                        <option value="9">9x</option>
                                                                        <option value="10">10x</option>
                                                                        <option value="11">11x</option>
                                                                        <option value="12">12x</option>
                                                                    </select>
                                                            </div>
                                                            <div class="form-row"><!--form-row-->
                                                                    <div class="form-group col-sm-4">
                                                                            <label>CPF do titular:</label>
                                                                            <input class="cpf form-control" name="txtCPFtitular" id="txtCPFtitular" placeholder="000.000.000-00">
                                                                    </div>
                                                                    <div class="form-group col-sm-4">
                                                                            <label>Data de Nascimento</label>
                                                                            <input class="dataNasc form-control" name="txtDataNascimento" id="txtDataNascimento"placeholder="00/00/0000">
                                                                    </div>
                                                                    <div class="form-group col-sm-4">
                                                                            <label>Contato:</label>
                                                                            <input class="contato form-control" name="txtContato" id="txtContato" placeholder="(00) 00000-0000">
                                                                    </div>
                                                            </div><!--form-row-->
                                     					</div><!--form-row dados do pagamento-->                                                        
                                                  </div><!--form-row geral-->
                                                  <!--botão-->
                                                  <div class="row justify-content-end mr-2"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Finalizar compra</button></div>
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
<!--Login Modal-->
<div id="acessoModal" class="modal fade" tabindex="-1" role="dialog">
 		 <div class="modal-dialog modal-dialog-centered" role="document">
		 		<form class="m-2 bg-light" name="formAcesso" action="${pageContext.request.contextPath}/cliente" method="post" onSubmit="return acessoLogin();"> 
		    	 <div class="modal-content">
			         <div class="modal-header">
			            <h5 class="modal-title" id="titulo"></h5>            
			         </div>
			         <div class="modal-body">
			            <div><p>Cadastre seu um login e senha para acessar seu cadastro.</p></div>
			         	<div class="form-group col-sm-10">
			         	   <label class="text-primary">Login:</label>
			               <input class="form-control mr-3 my-2" name="txtEmail" id="txtLogin" maxlength="40">
			               <label class="text-primary">Senha:</label>
			           	   <input class="form-control mr-3 my-2" type="password" name="txtSenha" id="txtSenha" maxlength="15">
			           	 </div> 
			         </div>
			         <div class="modal-footer">
							<button type="submit" id="salvar" class="btn btn-primary btn-sm btn-block">Salvar</button><!-- data-dismiss="modal" -->
			         </div>
		         </div>
		    </form>      
  		</div>
</div>
<!--Login Modal-->
    <script type="text/javascript">
	  function desabilitar(selecionado) {
		  
		    if(selecionado){
		    	
		    	<%session.setAttribute("selecionado", false);%>
		    }else{
		    	<%session.setAttribute("selecionado", true);%>
		    }
		    document.getElementById('txtDataIda').disabled = selecionado;
		    document.getElementById('txtDataIda1').disabled = selecionado;
		    document.getElementById('txtDataIda2').disabled = selecionado;
	  }
	</script>
	<script type="text/javascript">
		function enviardados(){			
			alert("entrou");
			if (!document.cadatroCartao.txtDataIda.disabled){				
				
					if (document.cadatroCartao.txtDataIda.value.length < 10){
						
							document.getElementById('mensagem').innerHTML = "Preencha o campo Data da ida (opção 1) corretamente!";
							$("#myModal").modal({show: true});
							document.cadatroCartao.txtDataIda.focus();
							return false;
					}if(document.cadatroCartao.txtDataIda1.value.length < 10 ){
						
							document.getElementById('mensagem').innerHTML = "Preencha o campo Data da ida (opção 2) corretamente!";
							$("#myModal").modal({
						   		 show: true
						    });
							document.cadatroCartao.txtDataIda1.focus();
							return false;
					}if(document.cadatroCartao.txtDataIda2.value.length < 10){
						
						    document.getElementById('mensagem').innerHTML = "Preencha o campo Data da ida (opção 3) corretamente!";
						    $("#myModal").modal({
						   		 show: true
						    });
							document.cadatroCartao.txtDataIda2.focus();
							return false;
					}	
			}
			if(document.cadatroCartao.txtNomeTitular.value.length < 15){
				
					document.getElementById('mensagem').innerHTML = "Preencha campo Nome do Titular corretamente!";
				 	$("#myModal").modal({
				   		 show: true
				    });
					document.cadatroCartao.txtNomeTitular.focus();
					return false;
			}		  
			if(document.cadatroCartao.txtCPFtitular.value.length < 14){
				
					document.getElementById('mensagem').innerHTML = "Preencha campo CPF do Titular corretamente!";
				 	$("#myModal").modal({
				   		 show: true
				    });
					document.cadatroCartao.txtCPFtitular.focus();
					return false;
			} 
			if (document.cadatroCartao.txtDataNascimento.value.length < 10){
				
					document.getElementById('mensagem').innerHTML = "Preencha o campo Data de Nascimento corretamente!";
					$("#myModal").modal({
				   		 show: true
				    });
					document.cadatroCartao.txtDataNascimento.focus();
					return false;
			}
			if (document.cadatroCartao.txtContato.value.length < 15){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Contato corretamente!";
				$("#myModal").modal({
			   		 show: true
			    });
				document.cadatroCartao.txtContato.focus();
				return false;
			}
			if (document.cadatroCartao.txtValidade.value.length < 5){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Validade do Cartão corretamente!";
				$("#myModal").modal({
			   		 show: true
			    });
				document.cadatroCartao.txtValidade.focus();
				return false;
			}
			if (document.cadatroCartao.txtNumCartao.value.length < 19){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Numero do Cartão corretamente!";
				$("#myModal").modal({
			   		 show: true
			    });
				document.cadatroCartao.txtNumCartao.focus();
				return false;
			}
			if (document.cadatroCartao.txtCodSeguranca.value.length < 3){
				
				document.getElementById('mensagem').innerHTML = "Preencha o campo Código de Segurança corretamente!";
				$("#myModal").modal({
			   		 show: true
			    });
				document.cadatroCartao.txtCodSeguranca.focus();
				return false;
			}	
			
			return true;
		}		  
	</script>
	<script>
    	function acessoLogin(){		
    		 
			if (document.formAcesso.txtLogin.value == "" || document.formAcesso.txtSenha.value == ""){
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
