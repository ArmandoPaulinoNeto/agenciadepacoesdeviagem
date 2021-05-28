const cartao = document.querySelector('#cartao'),
	  btnAbrirFormulario = document.querySelector('#btn-abrir-formulario'),
	  formulario = document.querySelector('#formulario-cartao'),
	  numeroCartao = document.querySelector('#cartao .numero'),
	  cpfTitutular = document.querySelector('#cartao .inputNumero'),
	  nomeCartao = document.querySelector('#cartao .nombre'),
	  logoMarca = document.querySelector('#logo-marca'),
	  firma = document.querySelector('#cartao .firma p'),
	  mesExpiracion = document.querySelector('#cartao .mes'),
	  yearExpiracion = document.querySelector('#cartao .year');
	  ccv = document.querySelector('#cartao .ccv');

const mostrarFrente = () => {
	if(cartao.classList.contains('active')){
		cartao.classList.remove('active');
	}
}

cartao.addEventListener('click', () => {
	cartao.classList.toggle('active');
});

btnAbrirFormulario.addEventListener('click', () => {
	btnAbrirFormulario.classList.toggle('active');
	formulario.classList.toggle('active');
});

for(let i = 1; i <= 12; i++){
	let opcion = document.createElement('option');
	var mes = i;
	if(i < 10){
		mes = '0'+mes
	}
	opcion.value = mes;
	opcion.innerText = mes;
	formulario.selectMes.appendChild(opcion);
}

const yearActual = new Date().getFullYear();
for(let i = yearActual; i <= yearActual + 8; i++){
	let opcion = document.createElement('option');
	opcion.value = i;
	opcion.innerText = i;
	formulario.selectYear.appendChild(opcion);
}

formulario.inputNumero.addEventListener('keyup', (e) => {
	let valorInput = e.target.value;

	formulario.inputNumero.value = valorInput.replace(/\s/g, '').replace(/\D/g, '').replace(/([0-9]{4})/g, '$1 ').trim();

	numeroCartao.textContent = valorInput;

	if(valorInput == ''){
		
		numeroCartao.textContent = '0000 0000 0000 0000';
		logoMarca.innerHTML = '';
	}
	if(valorInput.length > 18){
		
		var bandeira = (ReturnFlag.getCardFlag(valorInput));
		
		if(bandeira != ''){
			logoMarca.innerHTML = '';
			const imagen = document.createElement('img');
			imagen.src = 'imagens/img-cartao/logos/'+bandeira;
			logoMarca.appendChild(imagen);
		}
			
	}	
	
	mostrarFrente();
});

formulario.inputCPF.addEventListener('keyup', (e) => {
	
	let valorInput = e.target.value;
	
	if(formulario.inputCPF.value.length < 10){
		formulario.inputCPF.value = valorInput.replace(/\s/g, '').replace(/\D/g, '').replace(/([0-9]{3})/g, '$1.').trim();
	}else{
		var cpf = valorInput.replace(/\s/g, '').replace(/\D/g, '').replace(/([0-9]{3})/g, '$1-').trim();		
		var anterior = cpf.substring(0, 10);
		var nova = anterior.replaceAll("-", ".");
		formulario.inputCPF.value = cpf.replace(anterior, nova);
	}	
	mostrarFrente();
});
formulario.inputData.addEventListener('keyup', (e) => {
	
	let valorInput = e.target.value;
	
	if(formulario.inputData.value.length < 8){
		formulario.inputData.value = valorInput.replace(/\s/g, '').replace(/\D/g, '').replace(/([0-9]{2})/g, '$1/').trim();
	}else{
		var dataNasc = valorInput.replace(/\s/g, '').replace(/\D/g, '').replace(/([0-9]{2})/g, '$1/').trim();		
		var anterior = dataNasc.substring(0, 7);
		var nova = dataNasc.replace(anterior, anterior.replaceAll("/", "-"));
		formulario.inputData.value = nova.anterior.replaceAll("/", "").replaceAll("-", "/");
	}	
	mostrarFrente();
});
formulario.inputContato.addEventListener('keyup', (e) => {
	
	let valorInput = e.target.value;
	
	if(formulario.inputContato.value.length < 6){
		formulario.inputContato.value = valorInput.replace(/\s/g, '').replace(/\D/g, '').replace(/([0-9]{2})/g, '($1) ').trim();
	}else{
		var prefixo = valorInput.substring(0, 5);
		var contato = valorInput.replace(prefixo, '').replace(/\s/g, '').replace(/\D/g, '').replace(/([0-9]{4})/g, '$1-').trim();		
		formulario.inputContato.value = prefixo+(contato+"@").replace('-@', '').replace('@', '');
	}	
	mostrarFrente();
});
formulario.inputNome.addEventListener('keyup', (e) => {
	let valorInput = e.target.value;

	formulario.inputNome.value = valorInput.replace(/[0-9]/g, '');
	nomeCartao.textContent = valorInput;
	firma.textContent = valorInput;

	if(valorInput == ''){
		nomeCartao.textContent = 'NOME IMPRESSO NO CARTÃO';
	}
	
	mostrarFrente();
});

formulario.selectMes.addEventListener('change', (e) => {
	mesExpiracion.textContent = e.target.value;
	mostrarFrente();
});

formulario.selectYear.addEventListener('change', (e) => {
	yearExpiracion.textContent = e.target.value.slice(2);
	mostrarFrente();
});

formulario.inputCCV.addEventListener('keyup', () => {
	if(!cartao.classList.contains('active')){
		cartao.classList.toggle('active');
	}

	formulario.inputCCV.value = formulario.inputCCV.value.replace(/\s/g, '').replace(/\D/g, '');

	ccv.textContent = formulario.inputCCV.value;
});

var ReturnFlag = {
	   
	    getCardFlag: function(cardnumber) {
	        var cardnumber = cardnumber.replace(/[^0-9]+/g, '');

	        var cards = {
	            visa      : /^4[0-9]{12}(?:[0-9]{3})/,
	            mastercard : /^5[1-5][0-9]{14}/,
	            diners    : /^3(?:0[0-5]|[68][0-9])[0-9]{11}/,
	            amex      : /^3[47][0-9]{13}/,
	            discover  : /^6(?:011|5[0-9]{2})[0-9]{12}/,
	            hipercard  : /^(606282\d{10}(\d{3})?)|(3841\d{15})/,
	            elo        : /^((((636368)|(438935)|(504175)|(451416)|(636297))\d{0,10})|((5067)|(4576)|(4011))\d{0,12})/,
	            jcb        : /^(?:2131|1800|35\d{3})\d{11}/,       
	            aura      : /^(5078\d{2})(\d{2})(\d{11})$/     
	        };

	        for (var flag in cards) {
	            if(cards[flag].test(cardnumber)) {
	                return flag+'.png';
	            }
	        }
	        return '';
	    }
	}
function enviardados() {
	
	if(formulario.inputNumero.value.length < 19){		
		return false;
	}
	if(formulario.inputNome.value == ''){
		return false;
	}
	if(formulario.mes.value.length > 2){
		return false;
	}
	if(formulario.year.value.length < 4){
		return false;
	}
	if(formulario.inputCCV.value.length < 3){
		return false;
	}
	if(formulario.inputCPF.value.length < 14 || validarCPF(formulario.inputCPF.value)){
		return false;
	}
	if(formulario.inputData.value.length < 10 || validaDat(formulario.inputData, formulario.inputData.value)){
		return false;
	}	
	if(formulario.inputContato.value.length < 14){
		return false;
	}
	return true;
}

function validarCPF(strCPF) {
	
	strCPF = strCPF.replace(/[^0-9]/g, '')
    var  Soma = 0;
    var Resto;
   
	if (strCPF == ""){				
		//$("#inputCPF").addClass("is-invalid");
		return true;
	}			  
  	for (i=1; i<=9; i++){
  		Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);
  	}
  	
 	Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11)){
    	Resto = 0;
    }				
    if (Resto != parseInt(strCPF.substring(9, 10))){
    	//$("#inputCPF").addClass("is-invalid");
    	return true;
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
    	//$("#inputCPF").addClass("is-invalid");
    	return true;
    }
    //$("#inputCPF").removeClass("is-invalid");
    //$("#inputCPF").addClass("is-valid");
    return false;
}	

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
		return true;
	}
	return false;
}
