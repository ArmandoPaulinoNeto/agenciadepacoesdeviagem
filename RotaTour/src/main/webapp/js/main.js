const cartao = document.querySelector('#cartao'),
	  btnAbrirFormulario = document.querySelector('#btn-abrir-formulario'),
	  formulario = document.querySelector('#formulario-cartao'),
	  numerocartao = document.querySelector('#cartao .numero'),
	  nombrecartao = document.querySelector('#cartao .nombre'),
	  logoMarca = document.querySelector('#logo-marca'),
	  firma = document.querySelector('#cartao .firma p'),
	  mesExpiracion = document.querySelector('#cartao .mes'),
	  yearExpiracion = document.querySelector('#cartao .year');
	  ccv = document.querySelector('#cartao .ccv');

// * Volteamos la cartao para mostrar el frente.
const mostrarFrente = () => {
	if(cartao.classList.contains('active')){
		cartao.classList.remove('active');
	}
}

// * Rotacion de la cartao
cartao.addEventListener('click', () => {
	cartao.classList.toggle('active');
});

// * Boton de abrir formulario
btnAbrirFormulario.addEventListener('click', () => {
	btnAbrirFormulario.classList.toggle('active');
	formulario.classList.toggle('active');
});

// * Select del mes generado dinamicamente.
for(let i = 1; i <= 12; i++){
	let opcion = document.createElement('option');
	opcion.value = i;
	opcion.innerText = i;
	formulario.selectMes.appendChild(opcion);
}

// * Select del año generado dinamicamente.
const yearActual = new Date().getFullYear();
for(let i = yearActual; i <= yearActual + 8; i++){
	let opcion = document.createElement('option');
	opcion.value = i;
	opcion.innerText = i;
	formulario.selectYear.appendChild(opcion);
}

// * Input numero de cartao
formulario.inputNumero.addEventListener('keyup', (e) => {
	let valorInput = e.target.value;

	formulario.inputNumero.value = valorInput.replace(/\s/g, '').replace(/\D/g, '').replace(/([0-9]{4})/g, '$1 ').trim();

	numerocartao.textContent = valorInput;

	if(valorInput == ''){
		
		numerocartao.textContent = '0000 0000 0000 0000';
		logoMarca.innerHTML = '';
	}
	
	if(valorInput.length > 18){
		
		var bandeira = (tgdeveloper.getCardFlag(valorInput)+'.png');
		logoMarca.innerHTML = '';
		const imagen = document.createElement('img');
		imagen.src = 'imagens/img-cartao/logos/'+bandeira;
		logoMarca.appendChild(imagen);
	}	
	// Volteamos la cartao para que el usuario vea el frente.
	mostrarFrente();
});

// * Input nombre de cartao
formulario.inputNombre.addEventListener('keyup', (e) => {
	let valorInput = e.target.value;

	formulario.inputNombre.value = valorInput.replace(/[0-9]/g, '');
	nombrecartao.textContent = valorInput;
	firma.textContent = valorInput;

	if(valorInput == ''){
		nombrecartao.textContent = 'Luís Phelipe Orlens';
	}
	
	mostrarFrente();
});

// * Select mes
formulario.selectMes.addEventListener('change', (e) => {
	mesExpiracion.textContent = e.target.value;
	mostrarFrente();
});

// * Select Año
formulario.selectYear.addEventListener('change', (e) => {
	yearExpiracion.textContent = e.target.value.slice(2);
	mostrarFrente();
});

// * CCV
formulario.inputCCV.addEventListener('keyup', () => {
	if(!cartao.classList.contains('active')){
		cartao.classList.toggle('active');
	}

	formulario.inputCCV.value = formulario.inputCCV.value
	// Eliminar los espacios
	.replace(/\s/g, '')
	// Eliminar las letras
	.replace(/\D/g, '');

	ccv.textContent = formulario.inputCCV.value;
});

var tgdeveloper = {

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
	                return flag;
	            }
	        }       

	        return false;
	    }

	}

