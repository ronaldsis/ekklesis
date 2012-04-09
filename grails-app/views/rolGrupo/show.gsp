

<%@ page import="org.ekklesis.RolGrupo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'rolGrupo.label', default: 'RolGrupo')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Perfil de Iglesia</h4>
			<div class="ae-widget-content">
				<div id="show-rolGrupo"
					class="content scaffold-show" role="main">
					<h1>
						<g:message code="default.show.label" args="[entityName]" />
					</h1>
					<g:if test="${flash.message}">
						<div class="message success" role="status">${flash.message}</div>
					</g:if>
					<ol class="property-list rolGrupo">
						
				<g:if test="${rolGrupoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="rolGrupo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${rolGrupoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${rolGrupoInstance?.grupo}">
				<li class="fieldcontain">
					<span id="grupo-label" class="property-label"><g:message code="rolGrupo.grupo.label" default="Grupo" /></span>
					
						<span class="property-value" aria-labelledby="grupo-label"><g:link controller="grupo" action="show" id="${rolGrupoInstance?.grupo?.id}">${rolGrupoInstance?.grupo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${rolGrupoInstance?.miembrosRol}">
				<li class="fieldcontain">
					<span id="miembrosRol-label" class="property-label"><g:message code="rolGrupo.miembrosRol.label" default="Miembros Rol" /></span>
					
						<g:each in="${rolGrupoInstance.miembrosRol}" var="m">
						<span class="property-value" aria-labelledby="miembrosRol-label"><g:link controller="miembroGrupo" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${rolGrupoInstance?.rol}">
				<li class="fieldcontain">
					<span id="rol-label" class="property-label"><g:message code="rolGrupo.rol.label" default="Rol" /></span>
					
						<span class="property-value" aria-labelledby="rol-label"><g:fieldValue bean="${rolGrupoInstance}" field="rol"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<table>
								<tr>
									<td><g:hiddenField name="id"
											value="${rolGrupoInstance?.id}" /> <g:link class="edit"
											action="edit" id="${rolGrupoInstance?.id}">
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></td>
									<td><g:actionSubmit class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
