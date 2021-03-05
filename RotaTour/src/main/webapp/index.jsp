<%@page import="br.com.isoftware.rotatour.model.repository.PacotesRepository"%>
<%@page import="java.util.List"%>
<%@page import="br.com.isoftware.rotatour.domain.Pacotes"%>
<%@page import="br.com.isoftware.rotatour.model.repository.LugaresRepository"%>
<%@page import="br.com.isoftware.rotatour.domain.Lugares"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String pagina = (String) request.getSession().getAttribute("pagina");
session.setAttribute("pagina", "index");
Lugares lugares = new Lugares();
Pacotes pacote = new Pacotes();
LugaresRepository LR = new LugaresRepository();
PacotesRepository LP = new PacotesRepository();
List<Lugares> resultLugares = LR.listar();
List<Pacotes> resultPacotes = LP.listar();
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
	            <ul class="navbar-nav justify-content-center">
	              <li class="nav-item active">
	                <a class="nav-link" href="#">Principal<span class="sr-only">(current)</span></a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="#">Quem Somos</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" data-tab="acesso" href="#acesso">Acesso</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="#">Fale conosco</a>
	              </li>                      
	            </ul>
	          </div>
          </nav><!--Fim da teg NavBar-->
          </section>
<!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
	    <!-- Slides -->
	    <%for(int i = 0; i < resultLugares.size(); i++){%>
	      <div class="swiper-slide">
	         <div class="imgBx">
	            <img src="imagens/lugares/<%=resultLugares.get(i).getImagem()%>">
	         </div>
	         <div class="details">
	            <h6><%out.print(resultLugares.get(i).getPais());%><br><span><%out.print(resultLugares.get(i).getCidade());%></span></h6>
	            <h8>R$: <%out.print(resultPacotes.get(i).getValor());%><br><span>por pessoas</span></h8></br>
	             <a href="pacotes.jsp?id=<%=resultLugares.get(i).getId()%>">Mais detalhes</a><!-- <button type="button" class="btn btn-link">Link</button> -->
	         </div>
	      </div>
		<%}%>
	    <!-- Slides -->
    </div>    
    <!-- Add Pagination -->
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
  </div>
  <section class="segunda_secao">
              <div class="container">
					<div class="my-5">
              			<div class="col-xs-12">                        	
                        </div>
              		</div>                        	
              </div>
          </section>
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
 <!-- Alerta com Modal -->	
 <!--Login Modal-->
<div id="loginModal" class="modal fade" tabindex="-1" role="dialog">
 		 <div class="modal-dialog modal-dialog-centered" role="document">
		 		<form class="m-2 bg-light" name=formAcesso action="${pageContext.request.contextPath}/cliente" method="post" onSubmit="return acessoLogin();"> 
		    	 <div class="modal-content">
			         <div class="modal-header">
			            <h5 class="modal-title" id="titulo">Administrador</h5>            
			         </div>
			         <div class="modal-body">
			         
			         	<div class="form-group col-sm-10">
			         	   <label class="text-primary">Login:</label>
			               <input class="form-control mr-3 my-2" name="txtLogin" id="txtLogin" maxlength="25">
			               <label class="text-primary">Senha:</label>
			           	   <input class="form-control mr-3 my-2" type="password" name="txtSenha" id="txtSenha" maxlength="25">
			           	 </div> 
			         </div>
			         <div class="modal-footer">
							<button type="submit" id="entrar" class="btn btn-primary btn-sm btn-block">Entrar</button><!-- data-dismiss="modal" -->
			         </div>
		         </div>
		    </form>      
  		</div>
</div>
<!--Login Modal-->       
<!--fim Swiper-->          
  	<script src="js/jquery.js"></script>
    <script src="js/js/jquery.mask.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.js"></script>    
    <script src="js/swiper.min.js"></script>
    <!--função Swiper-->
    <script type="text/javascript">
    $("#administrador").click(function(){
    	
    	//document.getElementById('titulo').innerHTML = "Administrador";
    	<%request.getSession().setAttribute("tipoAcesso", "1");%>
    	$('#loginModal').modal('show');
	});
    </script>
	<script>
    	$(document).on('click','.navbar-nav li a', function(){
	    	var tab = $(this).data('tab');
	    	if(tab == "acesso"){
				<%session.setAttribute("pagina", "index");%>
	    	
				$('#loginModal').modal('show');
	    	}
  		});
	</script>
	<script>
    	function acessoLogin(){		
    		
			if (document.formAcesso.txtLogin.value == "" || document.formAcesso.txtSenha.value == ""){
				return false;
			}
			<%session.setAttribute("pagina", "acessar");%>
			return true;
		}
	</script>
    <script>
		var swiper = new Swiper('.swiper-container', {
		  effect: 'coverflow',
		  grabCursor: true,
		  centeredSlides: true,
		  slidesPerView: 'auto',
		  coverflowEffect: {
			rotate: 50,
			stretch: 0,
			depth: 100,
			modifier: 1,
			slideShadows : true,
		  },
		  pagination: {
			el: '.swiper-pagination',
		  },
		});
  	</script><!--fim da função Swiper-->
    <script><!--máscaras para Inputs-->
        $('.cpf').mask('000-000.000-00');
        $('.cnpj').mask('00.000.000/0000-00');
        $('.rg').mask('00.000.000-0');
        $('.cep').mask('00000-000');
        $('.dataNascimento').mask('00/00/0000');
        $('.placaCarro').mask('AAA-0000');
        $('.horasMinutos').mask('00:00');
        $('.cartaoCredito').mask('0000 0000 0000 0000');
	</script>
</body>
</html>