

<%@ page import="org.ekklesis.ClasificacionPersona" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Perfil de Iglesia</h4>
			<div class="ae-widget-content">
				<div id="show-clasificacionPersona"
					class="content scaffold-show" role="main">
					<h1>
						<g:message code="default.show.label" args="[entityName]" />
					</h1>
					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<ol class="property-list clasificacionPersona">
						
				<g:if test="${clasificacionPersonaInstance?.clasificacion}">
				<li class="fieldcontain">
					<span id="clasificacion-label" class="property-label"><g:message code="clasificacionPersona.clasificacion.label" default="Clasificacion" /></span>
					
						<span class="property-value" aria-labelledby="clasificacion-label"><g:fieldValue bean="${clasificacionPersonaInstance}" field="clasificacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clasificacionPersonaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="clasificacionPersona.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${clasificacionPersonaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<table>
								<tr>
									<td><g:hiddenField name="id"
											value="${clasificacionPersonaInstance?.id}" /> <g:link class="edit"
											action="edit" id="${clasificacionPersonaInstance?.id}">
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></td>
									<td><g:actionSubmit class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
									</td>
								</tr>
							</table>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
