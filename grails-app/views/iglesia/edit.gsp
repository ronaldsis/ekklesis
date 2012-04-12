<%@ page import="org.ekklesis.Iglesia"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'iglesia.label', default: 'Iglesia')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
			<h4 class="ae-widget-header">Editar Perfil Iglesia</h4>
			<div class="ae-widget-content">
				<div id="edit-iglesia" class="content scaffold-edit" role="main">
					<g:if test="${flash.message}">
						<div class="message success" role="status">
							${flash.message}
						</div>
					</g:if>
					<g:hasErrors bean="${iglesiaInstance}">
						<div class="error" role="alert">
							<g:eachError bean="${iglesiaInstance}" var="error">
								<i><g:message error="${error}" /></i>
							</g:eachError>
						</div>
					</g:hasErrors>
					<g:form method="post">
						<g:hiddenField name="id" value="${iglesiaInstance?.id}" />
						<g:hiddenField name="version" value="${iglesiaInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<table>
							<fieldset class="buttons">
								<tr>
									<td><g:actionSubmit class="save button" action="update"
											value="${message(code: 'default.button.update.label', default: 'Update')}" />
									</td>	
									<td><g:actionSubmit class="delete button" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											formnovalidate=""
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Esta seguro?')}');" />
									</td>
								</tr>
							</fieldset>
						</table>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
