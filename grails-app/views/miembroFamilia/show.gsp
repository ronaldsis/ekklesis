

<%@ page import="org.ekklesis.MiembroFamilia" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'miembroFamilia.label', default: 'MiembroFamilia')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
                  <h4 class="ae-widget-header">Mostrar Relaci&oacute;n Miembro Familia</h4>
			<div class="ae-widget-content">
				<div id="show-miembroFamilia"
					class="content scaffold-show" role="main">
					<h1>
						<g:message code="default.show.label" args="[entityName]" />
					</h1>
					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<ol class="property-list miembroFamilia">
						
				<g:if test="${miembroFamiliaInstance?.rol}">
				<li class="fieldcontain">
					<span id="rol-label" class="property-label"><g:message code="miembroFamilia.rol.label" default="Rol" /></span>
					
						<span class="property-value" aria-labelledby="rol-label"><g:fieldValue bean="${miembroFamiliaInstance}" field="rol"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${miembroFamiliaInstance?.familia}">
				<li class="fieldcontain">
					<span id="familia-label" class="property-label"><g:message code="miembroFamilia.familia.label" default="Familia" /></span>
					
						<span class="property-value" aria-labelledby="familia-label"><g:link controller="familia" action="show" id="${miembroFamiliaInstance?.familia?.id}">${miembroFamiliaInstance?.familia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${miembroFamiliaInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="miembroFamilia.persona.label" default="Persona" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${miembroFamiliaInstance?.persona?.id}">${miembroFamiliaInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<table>
								<tr>
									<td><g:hiddenField name="id"
											value="${miembroFamiliaInstance?.id}" /> <g:link class="edit"
											action="edit" id="${miembroFamiliaInstance?.id}">
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
