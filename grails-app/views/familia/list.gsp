

<%@ page import="org.ekklesis.Familia" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'familia.label', default: 'Familia')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de Familias </h4>
			<div class="ae-widget-content">
				<div id="list-familia"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="familia.apellidos.label" default="Apellidos" /></th>
					
						<th><g:message code="familia.telefonoPrincipal.label" default="Telefono Principal" /></th>
					
						<th><g:message code="familia.direccionPrincipal.label" default="Direccion Principal" /></th>
					
						<th><g:message code="familia.fechaMatrimonio.label" default="Fecha Matrimonio" /></th>
					
						<th><g:message code="familia.email.label" default="Email" /></th>
					
						<th><g:message code="familia.dateCreated.label" default="Date Created" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${familiaInstanceList}" status="i"
								var="familiaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${familiaInstance.id}">${fieldValue(bean: familiaInstance, field: "apellidos")}</g:link></td>
					
						<td>${fieldValue(bean: familiaInstance, field: "telefonoPrincipal")}</td>
					
						<td>${fieldValue(bean: familiaInstance, field: "direccionPrincipal")}</td>
					
						<td><g:formatDate date="${familiaInstance.fechaMatrimonio}" /></td>
					
						<td>${fieldValue(bean: familiaInstance, field: "email")}</td>
					
						<td><g:formatDate date="${familiaInstance.dateCreated}" /></td>
					
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
