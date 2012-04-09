<%@ page import="org.ekklesis.Persona"%>
<%! import org.ekklesis.DestinoDato %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'persona.label', default: 'Persona')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>

<g:validationFieldIncludes />
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'ekklesis.js')}"></script>
<g:javascript>
function actualizaMunicipio(data, elemen) {
	// The response comes back as a bunch-o-JSON 
	var municipios = eval("(" + data.responseText + ")") 
	// evaluate JSON
	//alert(data.responseText);
	//alert(elemen);
	if (municipios && elemen) {
		
		var municipio = 'municipio'+ elemen.substring( elemen.length -1);
		console.log('municipio:'+municipio);
		var rselect = document.getElementById(municipio);
		console.log(rselect.type);
		// Clear all previous options 
		var l = rselect.length
		while (l > 0) {
			l--
			rselect.remove(l)
		}

		// Rebuild the select
		for ( var i = 0; i < municipios.length; i++) {
			var municipio = municipios[i]
			var opt = document.createElement('option');
			opt.text = municipio.nombre
			opt.value = municipio.id
			try {
				rselect.add(opt, null) // standards compliant; 
										// no funciona en IE
			} catch (ex) {
				rselect.add(opt) // solamente IE  
			}

		}
	}
}

var zselect = document.getElementById('estado1')
var zopt = zselect.options[zselect.selectedIndex]
${remoteFunction(controller:"estado", action:"ajaxGetMunicipios", params:"'id=' + zopt.value", onComplete:"actualizaMunicipio(XMLHttpRequest) ")}

// This is called when the page loads to initialize city 

/*
var zselect = document.getElementById('country.name')
var zopt = zselect.options[zselect.selectedIndex]
${remoteFunction(controller:"estado", action:"ajaxGetMunicipios", params:"'id=' + zopt.value", onComplete:"updateCity(e)")}
*/
</g:javascript>

<g:javascript>

 // ocultamos el top-panel
 $(function() {
		temp = $("#top-panel").height();
		$("#top-panel").animate({
			height : 10
		}, 700, function() {
			$("#dock-control").css("background-position", "0px -32px");
			$("#top-panel>div,#top-panel>ul").hide();
		});})
		
jQuery(function($){
   $.mask.definitions['~']='[JOjo]';
   $("#date").mask("99/99/9999");
   $("#telefono").mask("(999) 999-9999");
   $("#fax").mask("(999) 999-9999");
   $("#rif").mask("~-99999999-9");
   $("#ssn").mask("999-99-9999");
});
</g:javascript>

</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Registrar Persona</h4>
			<div class="ae-widget-content">
				<div id="create-persona" class="content scaffold-create" role="main">
					<g:if test="${flash.message}">
						<div class="message success" role="status">
							${flash.message}
						</div>
					</g:if>
					<g:hasErrors bean="${personaInstance}">

						<g:eachError bean="${personaInstance}" var="error">
							<div class="error closable" role="alert">
								<i><g:message error="${error}" /></i>
							</div>
						</g:eachError>

					</g:hasErrors>
					<g:form action="save" enctype="multipart/form-data">
						<fieldset class="form">
							<g:render template="form" />
							</br> </br>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="save"
								value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>


			</div>
		</div>
	</div>
</body>
</html>
