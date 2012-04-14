<%@ page import="org.ekklesis.Event"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="lpages" />
<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />
<title>Registrar Evento</title>
<r:require module="utiles" />
<r:require module="calendar" />
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Agregar Evento</h4>
			<div class="ae-widget-content">
				<div class="btn-menu " role="navigation" align="right" >
					<ul>
						<li><g:link action="index" class="calendar button small">Ver Calendario de Eventos</g:link></li>
					</ul>
				</div>

				<div id="create-event" class="content scaffold-create" role="main">


					<g:if test="${flash.message}">
						<div class="alert-message block-message info">
							${flash.message}
						</div>
					</g:if>

					<g:hasErrors bean="${eventInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${eventInstance}" var="error">
								<li
									<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
										error="${error}" /></li>
							</g:eachError>
						</ul>
					</g:hasErrors>

					<g:form action="save" class="main" method="post">

						<fieldset class="form">
							<g:render template="form" model="model" />
						</fieldset>

						<fieldset class="buttons">
							<g:submitButton name="Registrar" class="save button">Save</g:submitButton>
						</fieldset>

					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
