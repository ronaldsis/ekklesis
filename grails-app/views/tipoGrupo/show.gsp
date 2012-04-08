

<%@ page import="org.ekklesis.TipoGrupo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'tipoGrupo.label', default: 'TipoGrupo')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Perfil de Iglesia</h4>
			<div class="ae-widget-content">
				<div id="show-tipoGrupo"
					class="content scaffold-show" role="main">
					<h1>
						<g:message code="default.show.label" args="[entityName]" />
					</h1>
					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<ol class="property-list tipoGrupo">
						
				<g:if test="${tipoGrupoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="tipoGrupo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tipoGrupoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoGrupoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="tipoGrupo.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tipoGrupoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${tipoGrupoInstance?.id}" />
							<g:link class="edit" action="edit" id="${tipoGrupoInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="delete" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
