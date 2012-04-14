

<%@ page import="org.ekklesis.Estado" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'estado.label', default: 'Estado')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
                  <h4 class="ae-widget-header">Configuraci&oacute;n Lista de Estados</h4>
			<div class="ae-widget-content">
				<div id="list-estado"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="estado.nombre.label" default="Nombre" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${estadoInstanceList}" status="i"
								var="estadoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${estadoInstance.id}">${fieldValue(bean: estadoInstance, field: "nombre")}</g:link></td>
					
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
