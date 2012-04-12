<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="org.ekklesis.Grupo" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'grupo.label', default: 'Grupo')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
<g:validationFieldIncludes />
<g:javascript>

</g:javascript>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Registrar <g:message code="default.create.label" args="[entityName]" /></h4>
			<div class="ae-widget-content">
				<div id="create-grupo"
					class="content scaffold-create" role="main">
					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${grupoInstance}">
						<div class="error" role="alert">
							<g:eachError bean="${grupoInstance}" var="error">
								<i><g:message 	error="${error}" /></i>
							</g:eachError>
						</div>
					</g:hasErrors>
					<g:form action="save"
						>
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="save button"
								value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
