

<%@ page import="org.ekklesis.ClasificacionPersona" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de <g:message code="default.list.label" args="[entityName]" /></h4>
			<div class="ae-widget-content">
				<div id="list-clasificacionPersona"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="clasificacionPersona.clasificacion.label" default="Clasificacion" /></th>
					
						<th><g:message code="clasificacionPersona.descripcion.label" default="Descripcion" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${clasificacionPersonaInstanceList}" status="i"
								var="clasificacionPersonaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${clasificacionPersonaInstance.id}">${fieldValue(bean: clasificacionPersonaInstance, field: "clasificacion")}</g:link></td>
					
						<td>${fieldValue(bean: clasificacionPersonaInstance, field: "descripcion")}</td>
					
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
