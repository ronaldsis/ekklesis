

<%@ page import="org.ekklesis.Grupo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'grupo.label', default: 'Grupo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>


</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Listar Grupos</h4>
			<div class="ae-widget-content">
				<div id="list-grupo"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="grupo.nombre.label" default="Nombre" /></th>
					
						<th><g:message code="grupo.descripcion.label" default="Descripcion" /></th>
					
						<th><g:message code="grupo.dateCreated.label" default="Fecha Creado" /></th>
					
						<th><g:message code="grupo.tipoGrupo.label" default="Tipo Grupo" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${grupoInstanceList}" status="i"
								var="grupoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${grupoInstance.id}">${fieldValue(bean: grupoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: grupoInstance, field: "descripcion")}</td>
					
						<td><g:formatDate date="${grupoInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: grupoInstance, field: "tipoGrupo")}</td>
					
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
