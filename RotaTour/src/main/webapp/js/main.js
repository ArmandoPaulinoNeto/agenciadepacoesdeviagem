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
	/*
	 visa 4
	master 51 a 55
	Dinners Club 301 305 36 38
	Elo 636368 438935 504175 451416 509048 509067 509049 509069 509050 509074 509068 509040 509045 509051 509046 509066 509047 509042 509052 509043 509064 509040 36297 5067 4576 4011 
	Discover 6011,622,64,65
	Aura 50
	Jcb 35
	Hipercard 38,60 
	American Express 34 37
	
	if(valorInput[0] == 4){
		logoMarca.innerHTML = '';
		const imagen = document.createElement('img');
		imagen.src = 'imagens/img-cartao/logos/visa.png';
		logoMarca.appendChild(imagen);
	} else if(valorInput[0] == 5){
		logoMarca.innerHTML = '';
		const imagen = document.createElement('img');
		imagen.src = 'imagens/img-cartao/logos/mastercard.png';
		logoMarca.appendChild(imagen);
	}
	 * */
//.length == 0
	var bandeiras = ['visa.png', 'american.png', 'jcb.png', 'hipercard.png', 'aura.png', 'mastercard.png', 'dinners.png', 'discover.png', 'elo.png']
	var numeros = ['4','34 37','35', '60', '50','51 52 53 54 55', '301 305 36 38', '6011 622 64 65', '636368 438935 504175 451416 509048 509067 509049 509069 509050 509074 509068 509040 509045 509051 509046 509066 509047 509042 509052 509043 509064 509040 36297 5067 4576 4011'];
	for (var i = 0; i < numeros.length; i++) {
		
		if(numeros[i].indexOf(valorInput) != -1){
			logoMarca.innerHTML = '';
			const imagen = document.createElement('img');
			imagen.src = 'imagens/img-cartao/logos/'+bandeiras[i];
			logoMarca.appendChild(imagen);
			break;
		} 
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