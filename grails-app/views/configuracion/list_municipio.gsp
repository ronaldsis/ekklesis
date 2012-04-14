

<%@ page import="org.ekklesis.Municipio" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'municipio.label', default: 'Municipio')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
                  <h4 class="ae-widget-header">Configuraci&oacute;n Lista de Municipios</h4>
			<div class="ae-widget-content">
				<div id="list-municipio"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="municipio.estado.label" default="Estado" /></th>
					
						<th><g:message code="municipio.nombre.label" default="Nombre" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${municipioInstanceList}" status="i"
								var="municipioInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${municipioInstance.id}">${fieldValue(bean: municipioInstance, field: "estado")}</g:link></td>
					
						<td>${fieldValue(bean: municipioInstance, field: "nombre")}</td>
					
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
