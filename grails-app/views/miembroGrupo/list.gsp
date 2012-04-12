

<%@ page import="org.ekklesis.MiembroGrupo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'miembroGrupo.label', default: 'MiembroGrupo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de <g:message code="default.list.label" args="[entityName]" /></h4>
			<div class="ae-widget-content">
				<div id="list-miembroGrupo"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="miembroGrupo.estatus.label" default="Estatus" /></th>
					
						<th><g:message code="miembroGrupo.fechaIngreso.label" default="Fecha Ingreso" /></th>
					
						<th><g:message code="miembroGrupo.grupo.label" default="Grupo" /></th>
					
						<th><g:message code="miembroGrupo.persona.label" default="Persona" /></th>
					
						<th><g:message code="miembroGrupo.rol.label" default="Rol" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${miembroGrupoInstanceList}" status="i"
								var="miembroGrupoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${miembroGrupoInstance.id}">${fieldValue(bean: miembroGrupoInstance, field: "estatus")}</g:link></td>
					
						<td><g:formatDate date="${miembroGrupoInstance.fechaIngreso}" /></td>
					
						<td>${fieldValue(bean: miembroGrupoInstance, field: "grupo")}</td>
					
						<td>${fieldValue(bean: miembroGrupoInstance, field: "persona")}</td>
					
						<td>${fieldValue(bean: miembroGrupoInstance, field: "rol")}</td>
					
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
