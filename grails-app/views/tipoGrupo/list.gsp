

<%@ page import="org.ekklesis.TipoGrupo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'tipoGrupo.label', default: 'TipoGrupo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de Tipos de Grupos</h4>
			<div class="ae-widget-content">
				<div id="list-tipoGrupo"
					class="content scaffold-list" role="main">
					
					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<g:sortableColumn property="descripcion" title="${message(code: 'tipoGrupo.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'tipoGrupo.nombre.label', default: 'Nombre')}" />
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${tipoGrupoInstanceList}" status="i"
								var="tipoGrupoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${tipoGrupoInstance.id}">${fieldValue(bean: tipoGrupoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: tipoGrupoInstance, field: "nombre")}</td>
					
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
