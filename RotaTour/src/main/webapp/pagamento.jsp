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
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Rota Tour</title>   
    <link href="bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="bootstrap/swiper.min.css" rel="stylesheet" type="text/css">    
    <link href="css/stile.css" rel="stylesheet" type="text/css">
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
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
  
 	 <div class="contenedor">

		<!-- cartao -->
		<section class="cartao" id="cartao">
			<div class="frente">
				<div class="logo-marca" id="logo-marca">
					<!-- <img src="imagens/img-cartao/logos/visa.png" alt=""> -->
				</div>
				<img src="imagens/img-cartao/chip-cartao.png" class="chip" alt="">
				<div class="datos">
					<div class="grupo" id="numero">
						<p class="label">Número do cartão</p>
						<p class="numero">0000 0000 0000 0000</p>
					</div>
					<div class="flexbox">
						<div class="grupo" id="nombre">
							<p class="label">Nome do titular</p>
							<p class="nombre">NOME IMPRESSO NO CARTÃO</p>
						</div>
						<div class="grupo" id="expiracion">
							<p class="label">Validade</p>
							<p class="expiracion"><span class="mes">MM</span> / <span class="year">AA</span></p>
						</div>
					</div>
				</div>
			</div>

			<div class="trasera">
				<div class="barra-magnetica"></div>
				<div class="datos">
					<div class="grupo" id="firma">
						<p class="label">Assinatura</p>
						<div class="firma"><p></p></div>
					</div>
					<div class="grupo" id="ccv">
						<p class="label">CVC</p>
						<p class="ccv"></p>
					</div>
				</div>
				<p class="legenda">Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus exercitationem, voluptates illo.</p>
				<a href="#" class="link-banco">www.isoftware.com.br</a>
			</div>
		</section>

		<!-- Contenedor Boton Abrir Formulario -->
		<div class="contenedor-btn">
			<button class="btn-abrir-formulario" id="btn-abrir-formulario">
				<i class="fas fa-plus"></i>
			</button>
		</div>

		<!-- Formulario -->		
		<form action="${pageContext.request.contextPath}/FinalizarCompra" method="post" id="formulario-cartao" class="formulario-cartao">
			<div class="grupo">
				<label for="inputNumero">Número do cartão</label>
				<input type="text" name="inputNumero" id="inputNumero" maxlength="19" autocomplete="off">
			</div>
			<div class="grupo">
				<label for="inputNome">Nome do titular</label>
				<input type="text" name="inputNome" id="inputNome" maxlength="19" autocomplete="off">
			</div>
			<div class="flexbox">
				<div class="grupo expira">
					<label for="selectMes">Validade</label>
					<div class="flexbox">
						<div class="grupo-select">
							<select name="mes" id="selectMes">
								<option disabled selected>Mês</option>
							</select>
							<i class="fas fa-angle-down"></i>
						</div>
						<div class="grupo-select">
							<select name="year" id="selectYear">
								<option disabled selected>Ano</option>
							</select>
							<i class="fas fa-angle-down"></i>
						</div>
					</div>
				</div>

				<div class="grupo ccv">
					<label for="inputCCV">CVC</label>
					<input type="text" name="inputCCV" id="inputCCV" placeholder="000" maxlength="3">
				</div>
			</div>
			<div class="form-row"><!--form-row dados do pagamento-->                
                 <div class="form-row"><!--form-row-->
                         <div class="form-group col-sm-4">
                                 <label>CPF do titular:</label>
                                 <input class="cpf form-control" name="inputCPF" id="inputCPF" placeholder="000.000.000-00" maxlength="14">
                         </div>
                         <div class="form-group col-sm-4">
                                 <label>Data de Nascimento</label>
                                 <input class="dataNasc form-control" name="inputData" id="inputData" placeholder="00/00/0000" maxlength="10">
                         </div>
                         <div class="form-group col-sm-4">
                                 <label>Contato:</label>
                                 <input class="contato form-control" name="inputContato" id="inputContato" placeholder="(00) 00000-0000" maxlength="14">
                         </div>
                         <div class="form-group col-sm-4">                                                                            
                         </div>
                         <div class="form-group col-sm-4">
                         </div>                                                                    
                         <div class="float-right form-group col-sm-4">
                            <label>N. de Parcelas:</label>
                            <select id="sltParcelas" name="sltParcelas">
                                <option value="1">1 x ${subtotal}</option>
                                <option value="2">2 x ${parcelas[0]}</option>
                                <option value="3">3 x ${parcelas[1]}</option>
                                <option value="4">4 x ${parcelas[2]}</option>
                                <option value="5">5 x ${parcelas[3]}</option>
                                <option value="6">6 x ${parcelas[4]}</option>
                                <option value="7">7 x ${parcelas[5]}</option>
                                <option value="8">8 x ${parcelas[6]}</option>
                                <option value="9">9 x ${parcelas[7]}</option>
                                <option value="10">10 x ${parcelas[8]}</option>
                                <option value="11">11 x ${parcelas[9]}</option>
                                <option value="12">12 x ${parcelas[10]}</option>
                            </select>
                 			</div>
                 </div><!--form-row-->
        	</div><!--form-row dados do pagamento-->
			<button type="submit" class="btn-enviar">Enviar</button>
		</form>
	</div>
<script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
<script src="js/main.js"></script>
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
</body>
 </html>
