<%@ page import="org.ekklesis.Iglesia"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'iglesia.label', default: 'Iglesia')}" />
<title>Registrar Iglesia</title>
<g:validationFieldIncludes />
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
			<h4 class="ae-widget-header">Registrar Iglesia</h4>
			<div class="ae-widget-content">
				<div id="create-iglesia" class="content scaffold-create" role="main">
					<g:if test="${flash.message}">
						<div class="message success" role="status">
							${flash.message}
						</div>
					</g:if>
					<g:hasErrors bean="${iglesiaInstance}">
						<g:eachError bean="${iglesiaInstance}" var="error">
							<div class="error">
								<i><g:message error="${error}" /></i>
							</div>
						</g:eachError>
					</g:hasErrors>
					<g:form action="save">
						<fieldset class="form">
							<g:render template="form" />
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
