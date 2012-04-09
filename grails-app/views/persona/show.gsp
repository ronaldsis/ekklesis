

<%@ page import="org.ekklesis.Persona" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'persona.label', default: 'Persona')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Perfil de Iglesia</h4>
			<div class="ae-widget-content">
				<div id="show-persona"
					class="content scaffold-show" role="main">
					<h1>
						<g:message code="default.show.label" args="[entityName]" />
					</h1>
					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<ol class="property-list persona">
						
				<g:if test="${personaInstance?.nombres}">
				<li class="fieldcontain">
					<span id="nombres-label" class="property-label"><g:message code="persona.nombres.label" default="Nombres" /></span>
					
						<span class="property-value" aria-labelledby="nombres-label"><g:fieldValue bean="${personaInstance}" field="nombres"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.apellidos}">
				<li class="fieldcontain">
					<span id="apellidos-label" class="property-label"><g:message code="persona.apellidos.label" default="Apellidos" /></span>
					
						<span class="property-value" aria-labelledby="apellidos-label"><g:fieldValue bean="${personaInstance}" field="apellidos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.clasificacion}">
				<li class="fieldcontain">
					<span id="clasificacion-label" class="property-label"><g:message code="persona.clasificacion.label" default="Clasificacion" /></span>
					
						<span class="property-value" aria-labelledby="clasificacion-label"><g:link controller="clasificacionPersona" action="show" id="${personaInstance?.clasificacion?.id}">${personaInstance?.clasificacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="persona.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${personaInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.facebook}">
				<li class="fieldcontain">
					<span id="facebook-label" class="property-label"><g:message code="persona.facebook.label" default="Facebook" /></span>
					
						<span class="property-value" aria-labelledby="facebook-label"><g:fieldValue bean="${personaInstance}" field="facebook"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.familia}">
				<li class="fieldcontain">
					<span id="familia-label" class="property-label"><g:message code="persona.familia.label" default="Familia" /></span>
					
						<span class="property-value" aria-labelledby="familia-label"><g:link controller="familia" action="show" id="${personaInstance?.familia?.id}">${personaInstance?.familia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.iglesia}">
				<li class="fieldcontain">
					<span id="iglesia-label" class="property-label"><g:message code="persona.iglesia.label" default="Iglesia" /></span>
					
						<span class="property-value" aria-labelledby="iglesia-label"><g:link controller="iglesia" action="show" id="${personaInstance?.iglesia?.id}">${personaInstance?.iglesia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.imgFoto}">
				<li class="fieldcontain">
					<span id="imgFoto-label" class="property-label"><g:message code="persona.imgFoto.label" default="Img Foto" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.imgTipo}">
				<li class="fieldcontain">
					<span id="imgTipo-label" class="property-label"><g:message code="persona.imgTipo.label" default="Img Tipo" /></span>
					
						<span class="property-value" aria-labelledby="imgTipo-label"><g:fieldValue bean="${personaInstance}" field="imgTipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="persona.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${personaInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.twitter}">
				<li class="fieldcontain">
					<span id="twitter-label" class="property-label"><g:message code="persona.twitter.label" default="Twitter" /></span>
					
						<span class="property-value" aria-labelledby="twitter-label"><g:fieldValue bean="${personaInstance}" field="twitter"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<table>
								<tr>
									<td><g:hiddenField name="id"
											value="${personaInstance?.id}" /> <g:link class="edit"
											action="edit" id="${personaInstance?.id}">
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
