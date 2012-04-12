

<%@ page import="org.ekklesis.RolGrupo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'rolGrupo.label', default: 'RolGrupo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de Relaciones Rol Grupo</h4>
			<div class="ae-widget-content">
				<div id="list-rolGrupo"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="rolGrupo.descripcion.label" default="Descripcion" /></th>
					
						<th><g:message code="rolGrupo.grupo.label" default="Grupo" /></th>
					
						<th><g:message code="rolGrupo.rol.label" default="Rol" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${rolGrupoInstanceList}" status="i"
								var="rolGrupoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${rolGrupoInstance.id}">${fieldValue(bean: rolGrupoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: rolGrupoInstance, field: "grupo")}</td>
					
						<td>${fieldValue(bean: rolGrupoInstance, field: "rol")}</td>
					
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
