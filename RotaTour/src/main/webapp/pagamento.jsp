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
				<p class="leyenda">Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus exercitationem, voluptates illo.</p>
				<a href="#" class="link-banco">www.tubanco.com</a>
			</div>
		</section>

		<!-- Contenedor Boton Abrir Formulario -->
		<div class="contenedor-btn">
			<button class="btn-abrir-formulario" id="btn-abrir-formulario">
				<i class="fas fa-plus"></i>
			</button>
		</div>

		<!-- Formulario -->
		<form action="" id="formulario-cartao" class="formulario-cartao">
			<div class="grupo">
				<label for="inputNumero">Número do cartão</label>
				<input type="text" id="inputNumero" maxlength="19" autocomplete="off">
			</div>
			<div class="grupo">
				<label for="inputNome">Nome do titular</label>
				<input type="text" id="inputNome" maxlength="19" autocomplete="off">
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
					<input type="text" id="inputCCV" maxlength="3">
				</div>
			</div>
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
<!--Link para as pasta com os Scripts-->
 </html>
