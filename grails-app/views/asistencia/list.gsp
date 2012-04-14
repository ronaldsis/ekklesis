

<%@ page import="org.ekklesis.Asistencia" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de Asistencia</h4>
			<div class="ae-widget-content">
				<div id="list-asistencia"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="asistencia.fecha.label" default="Fecha" /></th>
					
						<th><g:message code="asistencia.nota.label" default="Nota" /></th>
					
						<th><g:message code="asistencia.persona.label" default="Persona" /></th>
					
						<th><g:message code="asistencia.reunion.label" default="Reunion" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${asistenciaInstanceList}" status="i"
								var="asistenciaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${asistenciaInstance.id}">${fieldValue(bean: asistenciaInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: asistenciaInstance, field: "nota")}</td>
					
						<td>${fieldValue(bean: asistenciaInstance, field: "persona")}</td>
					
						<td>${fieldValue(bean: asistenciaInstance, field: "reunion")}</td>
					
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
