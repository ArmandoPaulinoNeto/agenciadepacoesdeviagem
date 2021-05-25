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
<!--section contúdo do Pacote-->                  
          <section>
          			<div class="container">
					<div class="row">
                        <div class="col-xs-12">                        	
                            <div class="esquerda"> 	
                                <section>
                                      <div class="container">
                                      	<div class="quadro">
                                            <div id="carouselsite" class="carousel show" data-ride="carousel">
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active"><img src="imagens/lugares/${primera}" class="img-fluid d-block"></div>         
                                                    <div class="carousel-item"><img src="imagens/lugares/${segunda}" class="img-fluid d-block"></div>
                                                    <div class="carousel-item"><img src="imagens/lugares/${terceira}" class="img-fluid d-block"></div>
                                                    <div class="carousel-item"><img src="imagens/lugares/${terceira}" class="img-fluid d-block"></div>                
                                                </div>
                                                    <a class="carousel-control-prev" href="#carouselsite" role="button" data-slide="prev">
                                                        <span class="carousel-control-prev-icon"></span>
                                                        <span class="sr-only">anterior</span>
                                                    </a>
                                                    <a class="carousel-control-next" href="#carouselsite" role="button" data-slide="next">
                                                        <span class="carousel-control-next-icon"></span>
                                                        <span class="sr-only">posterior</span>
                                                    </a>
                                                </div>
                                                	<div class="dt">
                                                <b>${cidade}</b>
                               <p></br>${detalhe}</br>
</br><b>Pais: </b>${pais}
</br><b>Capital: </b>${capital}
</br><b>Moeda: </b>${moeda}
</p>
													</div>
                                            </div>    
                                       </div>
                                  </section>
                              </div>
                              <div class="direita">
                              		<!-- Conteudo dos detalhes-->
                                    <h3>Pacote ${cidade} - 2021</h3>
                                	<div><b>Aéreo</b> <img src="imagens/icinspacote/aeria.png">&nbsp;<b>Hotel</b> <img src="imagens/icinspacote/hotel.png">&nbsp;<b>Transporte</b> <img src="imagens/icinspacote/transporte.png"></div>
                                    	<div class="linha"></div>
                                            <div class="card border-primary mb-3 ml-1" style="max-width: 18rem;">
												  <div class="card-header"><b>Opções do Pacote:</b></div>
												  <div class="card-body text-primary">
												    <h5 class="card-title">Garanta seu pacote já!</h5>
												    <div class="row ml-3"><b>De:</b><p class="card-text">&nbsp;01/abr/2021</p></div>
												    <div class="row justify-content-end mr-5"><b>Ate:</b><p class="card-text">&nbsp;01/nov/2021</p></div>
                                                    <form action="${pageContext.request.contextPath}/ConteudoCompra?id=${codigo}" method="post">
                                                    	<div class="row my-3">
		                                                    	<div class="ml-3 my-1"><p class="vlr"><b>Pessoas: </b></p></div>
		                                                    	<div class="ml-2 my-1">
		                                                    		<select id="quantidade" name="quantidade" onChange="atualizaPreco()">
						                                                <option value="1">1</option>
						                                                <option value="2">2</option>
						                                                <option value="3">3</option>
						                                                <option value="4">4</option>
						                                                <option value="5">5</option>
						                                                <option value="6">6</option>
						                                                <option value="7">7</option>
						                                                <option value="8">8</option>
						                                                <option value="9">9</option>
						                                                <option value="10">10</option>
						                                             </select>
						                                        </div>
						                                </div>        
				                                        <div class="row">
						                                        <div class="ml-3"><b>Saida de: </b></div>
						                                        <div class="ml-2">
						                                        	<select id="saida" name="saida">
						                                                <option value="Belo Horizonte">Belo Horizonte</option>
						                                                <option value="Brasília">Brasília</option>
						                                                <option value="Manaus">Manaus</option>
						                                                <option value="Porto Alegre">Porto Alegre</option>
						                                                <option value="Recife">Recife</option>
						                                                <option value="Rio de Janeiro">Rio de Janeiro</option>
						                                                <option value="São Paulo">São Paulo</option>
						                                            </select>
						                                        </div>
						                                </div>
						                                <div class="row my-4">       
				                                        		<div class="ml-3 my-1"><p><b>Diarias: </b>${diarias}</p></div>
				                                        </div>
													<div>
		                                                  <div class="row">
		                                                  		<div class="my-5 ml-3 mr-3"><b>R$:</b></div><div class="row my-2"><p class="display-4 btn-outline-warning" id="valor">${preco}</p></div>
		                                                  </div>
		                                             </div>
		                                             
		                                             <div class="row justify-content-end mr-2"><button class="btn btn-outline-success" type="submit">Comprar</button></div>
                                                           </form>
												  </div>
											</div>
                          </div>                            
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
  </body>  	    
    <script type="text/javascript">
   		function atualizaPreco(){
   			
   			var select = document.getElementById('quantidade');
			var option = select.options[select.selectedIndex];			
			var valor = (${precoPacote}*parseInt(option.value));			
			var preco = valor.toLocaleString('pt-br', {minimumFractionDigits: 2});
			document.getElementById('valor').innerHTML = preco;  									
		}
    </script>
 </html>