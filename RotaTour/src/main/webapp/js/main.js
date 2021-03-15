const cartao = document.querySelector('#cartao'),
	  btnAbrirFormulario = document.querySelector('#btn-abrir-formulario'),
	  formulario = document.querySelector('#formulario-cartao'),
	  numeroCartao = document.querySelector('#cartao .numero'),
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
	opcion.value = i;
	opcion.innerText = i;
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

	    /**
	    * getCardFlag
	    * Return card flag by number
	    *
	    * @param cardnumber
	    */   
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

