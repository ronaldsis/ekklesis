<%@ page import="org.ekklesis.Persona" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'persona.label', default: 'Persona')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
<g:validationFieldIncludes />
<g:javascript>
</g:javascript>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">
				Editar
				Persona
			</h4>
			<div class="ae-widget-content">
				<div id="edit-persona"
					class="content scaffold-edit" role="main">
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${personaInstance}">
						<div class="error" role="alert">
							<g:eachError bean="${personaInstance}" var="error">
								<i> <g:message error="${error}" /></i>
							</g:eachError>
						</div>
					</g:hasErrors>
					<g:form method="post"
						 enctype="multipart/form-data">
						<g:hiddenField name="id" value="${personaInstance?.id}" />
						<g:hiddenField name="version" value="${personaInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<table>
								<tr>
									<td><g:actionSubmit class="save" action="update"
											value="${message(code: 'default.button.update.label', default: 'Update')}" />
									</td>
									<td><g:actionSubmit class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											formnovalidate=""
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Esta usted seguro?')}');" />
									</td>
								</tr>
							</table>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
