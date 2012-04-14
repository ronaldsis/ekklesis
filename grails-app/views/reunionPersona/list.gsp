

<%@ page import="org.ekklesis.ReunionPersona" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'reunionPersona.label', default: 'ReunionPersona')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
                  <h4 class="ae-widget-header">Lista de Relaci&oacute;n Persona Reuni&oacute;n </h4>
			<div class="ae-widget-content">
				<div id="list-reunionPersona"
					class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								
						<th><g:message code="reunionPersona.persona.label" default="Persona" /></th>
					
						<th><g:message code="reunionPersona.reunion.label" default="Reunion" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${reunionPersonaInstanceList}" status="i"
								var="reunionPersonaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${reunionPersonaInstance.id}">${fieldValue(bean: reunionPersonaInstance, field: "persona")}</g:link></td>
					
						<td>${fieldValue(bean: reunionPersonaInstance, field: "reunion")}</td>
					
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
