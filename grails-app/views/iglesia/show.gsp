
<%@ page import="org.ekklesis.Iglesia"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'iglesia.label', default: 'Iglesia')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Perfil de Iglesia</h4>
			<div class="ae-widget-content">
				<div id="show-iglesia" class="content scaffold-show" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">
							${flash.message}
						</div>
					</g:if>
					<ol class="property-list iglesia">

						<g:if test="${iglesiaInstance?.direccion}">
							<li class="fieldcontain"><span id="direccion-label"
								class="property-label"><g:message
										code="iglesia.direccion.label" default="Direccion" /></span> <span
								class="property-value" aria-labelledby="direccion-label"><g:fieldValue
										bean="${iglesiaInstance}" field="direccion" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.email}">
							<li class="fieldcontain"><span id="email-label"
								class="property-label"><g:message
										code="iglesia.email.label" default="Email" /></span> <span
								class="property-value" aria-labelledby="email-label"><g:fieldValue
										bean="${iglesiaInstance}" field="email" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.facebook}">
							<li class="fieldcontain"><span id="facebook-label"
								class="property-label"><g:message
										code="iglesia.facebook.label" default="Facebook" /></span> <span
								class="property-value" aria-labelledby="facebook-label"><g:fieldValue
										bean="${iglesiaInstance}" field="facebook" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.fax}">
							<li class="fieldcontain"><span id="fax-label"
								class="property-label"><g:message
										code="iglesia.fax.label" default="Fax" /></span> <span
								class="property-value" aria-labelledby="fax-label"><g:fieldValue
										bean="${iglesiaInstance}" field="fax" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.lema}">
							<li class="fieldcontain"><span id="lema-label"
								class="property-label"><g:message
										code="iglesia.lema.label" default="Lema" /></span> <span
								class="property-value" aria-labelledby="lema-label"><g:fieldValue
										bean="${iglesiaInstance}" field="lema" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.nombre}">
							<li class="fieldcontain"><span id="nombre-label"
								class="property-label"><g:message
										code="iglesia.nombre.label" default="Nombre" /></span> <span
								class="property-value" aria-labelledby="nombre-label"><g:fieldValue
										bean="${iglesiaInstance}" field="nombre" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.organizacion}">
							<li class="fieldcontain"><span id="organizacion-label"
								class="property-label"><g:message
										code="iglesia.organizacion.label" default="Organizacion" /></span> <span
								class="property-value" aria-labelledby="organizacion-label"><g:fieldValue
										bean="${iglesiaInstance}" field="organizacion" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.rif}">
							<li class="fieldcontain"><span id="rif-label"
								class="property-label"><g:message
										code="iglesia.rif.label" default="Rif" /></span> <span
								class="property-value" aria-labelledby="rif-label"><g:fieldValue
										bean="${iglesiaInstance}" field="rif" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.telefono}">
							<li class="fieldcontain"><span id="telefono-label"
								class="property-label"><g:message
										code="iglesia.telefono.label" default="Telefono" /></span> <span
								class="property-value" aria-labelledby="telefono-label"><g:fieldValue
										bean="${iglesiaInstance}" field="telefono" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.twitter}">
							<li class="fieldcontain"><span id="twitter-label"
								class="property-label"><g:message
										code="iglesia.twitter.label" default="Twitter" /></span> <span
								class="property-value" aria-labelledby="twitter-label"><g:fieldValue
										bean="${iglesiaInstance}" field="twitter" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.versiculo}">
							<li class="fieldcontain"><span id="versiculo-label"
								class="property-label"><g:message
										code="iglesia.versiculo.label" default="Versiculo" /></span> <span
								class="property-value" aria-labelledby="versiculo-label"><g:fieldValue
										bean="${iglesiaInstance}" field="versiculo" /></span></li>
						</g:if>

						<g:if test="${iglesiaInstance?.web}">
							<li class="fieldcontain"><span id="web-label"
								class="property-label"><g:message
										code="iglesia.web.label" default="Web" /></span> <span
								class="property-value" aria-labelledby="web-label"><g:fieldValue
										bean="${iglesiaInstance}" field="web" /></span></li>
						</g:if>

					</ol>
					<g:form>
						<table>
							<fieldset class="buttons">
								<tr>
									<td><g:hiddenField name="id"
											value="${iglesiaInstance?.id}" /> <g:link class="edit"
											action="edit" id="${iglesiaInstance?.id}">
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></td>
									<td>
										<g:actionSubmit class="delete" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></td>
								</tr>
							</fieldset>
						</table>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
