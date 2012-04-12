

<%@ page import="org.ekklesis.MiembroFamilia" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'miembroFamilia.label', default: 'MiembroFamilia')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
                  <h4 class="ae-widget-header">Lista de Relaci&oacute;n Miembro-Familia</h4>
			<div class="ae-widget-content">
				<div id="list-miembroFamilia"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="miembroFamilia.rol.label" default="Rol" /></th>
					
						<th><g:message code="miembroFamilia.familia.label" default="Familia" /></th>
					
						<th><g:message code="miembroFamilia.persona.label" default="Persona" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${miembroFamiliaInstanceList}" status="i"
								var="miembroFamiliaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${miembroFamiliaInstance.id}">${fieldValue(bean: miembroFamiliaInstance, field: "rol")}</g:link></td>
					
						<td>${fieldValue(bean: miembroFamiliaInstance, field: "familia")}</td>
					
						<td>${fieldValue(bean: miembroFamiliaInstance, field: "persona")}</td>
					
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
