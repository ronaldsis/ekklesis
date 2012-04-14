

<%@ page import="org.ekklesis.Reunion" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'reunion.label', default: 'Reunion')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de Reuniones</h4>
			<div class="ae-widget-content">
				<div id="list-reunion"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="reunion.titulo.label" default="Titulo" /></th>
					
						<th><g:message code="reunion.ubicacion.label" default="Ubicacion" /></th>
					
						<th><g:message code="reunion.descripcion.label" default="Descripcion" /></th>
					
						<th><g:message code="reunion.inicio.label" default="Inicio" /></th>
					
						<th><g:message code="reunion.fin.label" default="Fin" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${reunionInstanceList}" status="i"
								var="reunionInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${reunionInstance.id}">${fieldValue(bean: reunionInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: reunionInstance, field: "ubicacion")}</td>
					
						<td>${fieldValue(bean: reunionInstance, field: "descripcion")}</td>
					
						<td><g:formatDate date="${reunionInstance.inicio}" /></td>
					
						<td><g:formatDate date="${reunionInstance.fin}" /></td>
					
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
