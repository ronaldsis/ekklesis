num = 0;

function crearDireccion(obj) {
	num++;
	fi = document.getElementById('fiel');
	contenedor = document.createElement('div');
	contenedor.id = 'divDir' + num;
	fi.appendChild(contenedor);

	ele = document.createElement('input');
	ele.type = 'file';
	contenedor.appendChild(ele);

	ele = document.createElement('input');
	ele.type = 'button';
	ele.value = 'Borrar';
	ele.name = 'divDir' + num;
	ele.onclick = function() {
		borrarDireccion(this.name)
	}
	contenedor.appendChild(ele);
}

function borrarDireccion(obj) {
	var btn = document.getElementsByName(obj);
	// alert (btns[0].id);
	fi = document.getElementById('fsDirecciones');
	fi.removeChild(document.getElementById(obj));
	fi.removeChild(document.getElementById(btn[0].id));
}

$(document).ready(
		function() {
			numDir = 1;
			$('#btnAgregar')
					.click(
							function() {
								numDir++;
								fi = document.getElementById('fsDirecciones');
								// contenedor = document.createElement('div');
								// contenedor.id = 'input' + num;
								// fi.appendChild(contenedor);

								var num = $('.clonarForm').length;

								var newNum = new Number(num + 1);
								// newNum = numDir;
								// alert('clonarForm '+num+ ' newNum '+newNum+'
								// numDir '+ numDir);
								// selecciono el div[i] de la clase clonarForm
								var ulElem = $('#fsDirecciones').find('.clonarForm')[num - 1];
								//obtengo el id del div actual
								var ule = ulElem.id;
								var newElem = $('#' + ule).clone().attr('id', 'input' + numDir);
								
								ele = document.createElement('input');

								ele.id = 'btnBorrar' + numDir;
								ele.type = 'button';
								ele.value = 'Borrar ↓';
								ele.name = 'input' + numDir;
								ele.onclick = function() {
									borrarDireccion(this.name)
								}
	
								//alert('Ultimo:' + ulElem.id + ' Proximo: input'+ numDir + ' num:' + num);
								$('#' + ule).after(newElem);
								//var idNewElem= newElem.id;
//								$('#input' + numDir).children(':nth-child(8)').children(':nth-child(1)').attr('id', 'estado' + numDir);
								$('#input' + numDir).children(':nth-child(8)').children(':nth-child(2)').attr('id', 'estado' + numDir);
								
//								$('#input' + numDir).children(':nth-child(9)').children(':nth-child(1)').attr('id', 'municipio' + numDir);
								$('#input' + numDir).children(':nth-child(9)').children(':nth-child(2)').attr('id', 'municipio' + numDir);
								//alert('id new elem' + idNewElem);
								ulElem = $('#fsDirecciones').find('.clonarForm')[num];
								//alert('uelem2' + ulElem2)
								
							    ule = ulElem.id;
								$('#' + ule).before(ele);
								// $('#btnElimina').attr('disabled', '');
								//$('#')	
								 if (num+1 == 5)
								 $('#btnAgregar').attr('disabled', 'disabled');
							});

			$('#btnCrearDir').click(
					function() {
						fi = document.getElementById('fsDirecciones');
						contenedor = document.createElement('div');

						var num = $('.clonarForm').length;

						var newNum = new Number(num + 1);

						var newElem = $('#input' + num).clone().attr('id',
								'input' + newNum);

						// newElem.children(':nth-child(0)').attr('id', 'name['
						// +
						// newNum+']').attr('name', 'name[' + newNum+']');

						$('#input' + num).after(newElem);
						$('#btnElimina').attr('disabled', '');

						if (newNum == 5)
							$('#btnAgregar').attr('disabled', 'disabled');
					});
			$('#btnElimina').click(function() {
				var num = $('.clonarForm').length;

				$('#input' + num).remove();
				$('#btnAdd').attr('disabled', '');

				if (num - 1 == 1)
					$('#btnElimina').attr('disabled', 'disabled');
			});

			$('#btnElimina').attr('disabled', 'disabled');
		});

$(function() {

})