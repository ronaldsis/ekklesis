

<%@ page import="org.ekklesis.Persona" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'persona.label', default: 'Persona')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de Personas</h4>
			<div class="ae-widget-content">
				<div id="list-persona"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="persona.nombres.label" default="Nombres" /></th>
					
						<th><g:message code="persona.apellidos.label" default="Apellidos" /></th>
					
						<th><g:message code="persona.clasificacion.label" default="Clasificacion" /></th>
					
						<th><g:message code="persona.dateCreated.label" default="Date Created" /></th>
					
						<th><g:message code="persona.facebook.label" default="Facebook" /></th>
					
						<th><g:message code="persona.familia.label" default="Familia" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${personaInstanceList}" status="i"
								var="personaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${personaInstance.id}">${fieldValue(bean: personaInstance, field: "nombres")}</g:link></td>
					
						<td>${fieldValue(bean: personaInstance, field: "apellidos")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "clasificacion")}</td>
					
						<td><g:formatDate date="${personaInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: personaInstance, field: "facebook")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "familia")}</td>
					
								</tr>
							</g:each>
						</tbody>
					</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
