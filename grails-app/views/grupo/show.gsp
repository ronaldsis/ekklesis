

<%@ page import="org.ekklesis.Grupo"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'grupo.label', default: 'Grupo')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<r:require module="utiles" />

</head>
<body>

	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Mostrar Grupo</h4>
			<div class="ae-widget-content">
				<div id="show-grupo" class="content scaffold-show" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">
							${flash.message}
						</div>
					</g:if>
					<div id="main">
						<div class="ym-wrapper">
							<div class="ym-wbox">
								<section class="box2 info2">
									<div class="ym-grid linearize-level-1">
										<div class="ym-g66 ym-gr">

											<div class="ym-grid linearize-level-2">
												<article class="ym-g100 ">
													<div class="box2">

														<g:if test="${grupoInstance?.roles}">
															<div class="ae-widget-sidebar  minimizable">
																<!--  Start of Widget Box -->
																<h4 class="ae-widget-header">Roles del Grupo</h4>

																<!--  Widget  header -->
																<div class="ae-widget-content">
																	<li class="fieldcontain"><g:each
																			in="${grupoInstance.roles}" var="r">
																			<span class="property-value"
																				aria-labelledby="roles-label"><g:link
																					controller="rolGrupo" action="show" id="${r.id}">
																					${r?.encodeAsHTML()}
																				</g:link></span>
																		</g:each></li>
																</div>
															</div>

														</g:if>
														<div class="ae-widget-sidebar  minimizable">
															<!--  Start of Widget Box -->
															<h4 class="ae-widget-header">Personas</h4>

															<!--  Widget  header -->
															<div class="ae-widget-content"></div>
														</div>
												</article>


											</div>
										</div>
										<article class="ym-g33 ym-gl">
											<div class="box2">
												<ol class="property-list grupo">

													<g:if test="${grupoInstance?.nombre}">
														<li class="fieldcontain"><span id="nombre-label"
															class="property-label"><g:message
																	code="grupo.nombre.label" default="Nombre" /></span> <span
															class="property-value" aria-labelledby="nombre-label"><g:fieldValue
																	bean="${grupoInstance}" field="nombre" /></span></li>
													</g:if>

													<g:if test="${grupoInstance?.descripcion}">
														<li class="fieldcontain"><span id="descripcion-label"
															class="property-label"><g:message
																	code="grupo.descripcion.label" default="Descripcion" /></span>
															<span class="property-value"
															aria-labelledby="descripcion-label"><g:fieldValue
																	bean="${grupoInstance}" field="descripcion" /></span></li>
													</g:if>

													<g:if test="${grupoInstance?.dateCreated}">
														<li class="fieldcontain"><span id="dateCreated-label"
															class="property-label"><g:message
																	code="grupo.dateCreated.label" default="Fecha Creado" /></span>
															<span class="property-value"
															aria-labelledby="dateCreated-label"><g:formatDate
																	date="${grupoInstance?.dateCreated}" /></span></li>
													</g:if>

													<g:if test="${grupoInstance?.iglesia}">
														<li class="fieldcontain"><span id="iglesia-label"
															class="property-label"><g:message
																	code="grupo.iglesia.label" default="Iglesia" /></span> <span
															class="property-value" aria-labelledby="iglesia-label"><g:link
																	controller="iglesia" action="show"
																	id="${grupoInstance?.iglesia?.id}">
																	${grupoInstance?.iglesia?.encodeAsHTML()}
																</g:link></span></li>
													</g:if>

													<g:if test="${grupoInstance?.lastUpdated}">
														<li class="fieldcontain"><span id="lastUpdated-label"
															class="property-label"><g:message
																	code="grupo.lastUpdated.label" default="Last Updated" /></span>
															<span class="property-value"
															aria-labelledby="lastUpdated-label"><g:formatDate
																	date="${grupoInstance?.lastUpdated}" /></span></li>
													</g:if>

													<g:if test="${grupoInstance?.miembrosGrupo}">
														<li class="fieldcontain"><span
															id="miembrosGrupo-label" class="property-label"><g:message
																	code="grupo.miembrosGrupo.label"
																	default="Miembros Grupo" /></span> <g:each
																in="${grupoInstance.miembrosGrupo}" var="m">
																<span class="property-value"
																	aria-labelledby="miembrosGrupo-label"><g:link
																		controller="miembroGrupo" action="show" id="${m.id}">
																		${m?.encodeAsHTML()}
																	</g:link></span>
															</g:each></li>
													</g:if>



													<g:if test="${grupoInstance?.tipoGrupo}">
														<li class="fieldcontain"><span id="tipoGrupo-label"
															class="property-label"><g:message
																	code="grupo.tipoGrupo.label" default="Tipo Grupo" /></span> <span
															class="property-value" aria-labelledby="tipoGrupo-label"><g:link
																	controller="tipoGrupo" action="show"
																	id="${grupoInstance?.tipoGrupo?.id}">
																	${grupoInstance?.tipoGrupo?.encodeAsHTML()}
																</g:link></span></li>
													</g:if>

												</ol>
											</div>
										</article>
									</div>

								</section>
							</div>
						</div>
					</div>


					<g:form>
						<fieldset class="buttons">
							<table>
								<tr>
									<td><g:hiddenField name="id" value="${grupoInstance?.id}" />


										<g:actionSubmit class="edit button" action="edit"
											id="${grupoInstance?.id}"
											value="${message(code: 'default.button.edit.label', default: 'Edit')}" />

									</td>
									<td><g:actionSubmit class="delete button" action="delete"
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
