

<%@ page import="org.ekklesis.Familia" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'familia.label', default: 'Familia')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Perfil de Iglesia</h4>
			<div class="ae-widget-content">
				<div id="show-familia"
					class="content scaffold-show" role="main">
					<h1>
						<g:message code="default.show.label" args="[entityName]" />
					</h1>
					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<ol class="property-list familia">
						
				<g:if test="${familiaInstance?.apellidos}">
				<li class="fieldcontain">
					<span id="apellidos-label" class="property-label"><g:message code="familia.apellidos.label" default="Apellidos" /></span>
					
						<span class="property-value" aria-labelledby="apellidos-label"><g:fieldValue bean="${familiaInstance}" field="apellidos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familiaInstance?.telefonoPrincipal}">
				<li class="fieldcontain">
					<span id="telefonoPrincipal-label" class="property-label"><g:message code="familia.telefonoPrincipal.label" default="Telefono Principal" /></span>
					
						<span class="property-value" aria-labelledby="telefonoPrincipal-label"><g:fieldValue bean="${familiaInstance}" field="telefonoPrincipal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familiaInstance?.direccionPrincipal}">
				<li class="fieldcontain">
					<span id="direccionPrincipal-label" class="property-label"><g:message code="familia.direccionPrincipal.label" default="Direccion Principal" /></span>
					
						<span class="property-value" aria-labelledby="direccionPrincipal-label"><g:fieldValue bean="${familiaInstance}" field="direccionPrincipal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familiaInstance?.fechaMatrimonio}">
				<li class="fieldcontain">
					<span id="fechaMatrimonio-label" class="property-label"><g:message code="familia.fechaMatrimonio.label" default="Fecha Matrimonio" /></span>
					
						<span class="property-value" aria-labelledby="fechaMatrimonio-label"><g:formatDate date="${familiaInstance?.fechaMatrimonio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${familiaInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="familia.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${familiaInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familiaInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="familia.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${familiaInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${familiaInstance?.iglesia}">
				<li class="fieldcontain">
					<span id="iglesia-label" class="property-label"><g:message code="familia.iglesia.label" default="Iglesia" /></span>
					
						<span class="property-value" aria-labelledby="iglesia-label"><g:link controller="iglesia" action="show" id="${familiaInstance?.iglesia?.id}">${familiaInstance?.iglesia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${familiaInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="familia.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${familiaInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${familiaInstance?.miembrosFamilia}">
				<li class="fieldcontain">
					<span id="miembrosFamilia-label" class="property-label"><g:message code="familia.miembrosFamilia.label" default="Miembros Familia" /></span>
					
						<g:each in="${familiaInstance.miembrosFamilia}" var="m">
						<span class="property-value" aria-labelledby="miembrosFamilia-label"><g:link controller="miembroFamilia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${familiaInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="familia.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${familiaInstance?.status}" /></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<table>
								<tr>
									<td><g:hiddenField name="id"
											value="${familiaInstance?.id}" /> <g:link class="edit"
											action="edit" id="${familiaInstance?.id}">
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
