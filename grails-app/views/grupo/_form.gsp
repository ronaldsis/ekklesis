<%@ page import="org.ekklesis.Grupo"%>


<div class="container_76">

	<!--Salto de Linea-->
	<div class="clear"></div>
	<div class="grid_76">&nbsp;</div>

	<!--Panel izquierdo-->
	<div class="${actionName=='create'?'grid_76':'grid_55'} ">

		<!--Salto de Linea-->
		<div class="clear"></div>
		<div class="grid_55">&nbsp;</div>

		<div class="grid_23">
			<div
				class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'nombre', 'error')} ">
				<label for="nombre"> <g:message code="grupo.nombre.label"
						default="Nombre" />

				</label>
				<g:textField name="nombre" value="${grupoInstance?.nombre}" required=""
					class="long ui-corner-all" />
			</div>
		</div>


		<div class="${actionName=='create'?'grid_50':'grid_22'} ">
			<div
				class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion"> <g:message
						code="grupo.descripcion.label" default="Descripcion" />

				</label>
				<g:textField name="descripcion"
					value="${grupoInstance?.descripcion}" class="long ui-corner-all" />
			</div>
		</div>

		<!--Salto de Linea-->
		<div class="clear"></div>
		<div class="${actionName=='create'?'grid_76':'grid_55'} ">&nbsp;</div>

		<div class="grid_22">
			<div
				class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'tipoGrupo', 'error')} required">
				<label for="tipoGrupo"> <g:message
						code="grupo.tipoGrupo.label" default="Tipo Grupo" /> <span
					class="required-indicator">*</span>
				</label>
				<g:select id="tipoGrupo" name="tipoGrupo.id"
					from="${org.ekklesis.TipoGrupo.list()}" optionKey="id" required=""
					value="${grupoInstance?.tipoGrupo?.id}"
					class="many-to-one ui-widget ui-widget-content ui-corner-left" noSelection="['':'Seleccione...']" />
			</div>
		</div>


		<div class="grid_23">
			<div
				class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'iglesia', 'error')} required">
				<label for="iglesia"> <g:message code="grupo.iglesia.label"
						default="Iglesia" /> <span class="required-indicator">*</span>
				</label>
				<g:select id="iglesia" name="iglesia.id"
					from="${org.ekklesis.Iglesia.list()}" optionKey="id" required=""
					value="${grupoInstance?.iglesia?.id}"
					class="many-to-one ui-widget ui-widget-content ui-corner-left"  />
			</div>
		</div>



		<!--Salto de Linea-->
		<div class="clear"></div>
		<div class="grid_55">&nbsp;</div>


	</div>

	<g:if test="${actionName=='edit'}">
		<!--Panel derecho-->
		<div class="grid_21">

			<div class="grid_21">
				<div class="ae-widget minimizable">
					<p class="ae-widget-header" align="left">Miembros del Grupo</p>

					<div
						class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'miembrosGrupo', 'error')} ">
						<label for="miembrosGrupo"> <g:message
								code="grupo.miembrosGrupo.label" default="Miembros Grupo" />

						</label>

						<ul class="one-to-many">
							<g:each in="${grupoInstance?.miembrosGrupo?}" var="m">
								<li><g:link controller="miembroGrupo" action="show"
										id="${m.id}">
										${m?.encodeAsHTML()}
									</g:link></li>
							</g:each>
							<li class="add"><g:link controller="miembroGrupo"
									action="create" params="['grupo.id': grupoInstance?.id]">
									${message(code: 'default.add.label', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo')])}
								</g:link></li>
						</ul>

					</div>

				</div>
			</div>


			<!--Salto de Linea-->
			<div class="clear"></div>
			<div class="grid_21">&nbsp;</div>


			<div class="grid_21">
				<div class="ae-widget minimizable">
					<p class="ae-widget-header" align="left">Roles del Grupo</p>
					<div
						class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'roles', 'error')} ">
						<label for="roles"> <g:message code="grupo.roles.label"
								default="Roles" />

						</label>

						<ul class="one-to-many">
							<g:each in="${grupoInstance?.roles?}" var="r">
								<li><g:link controller="rolGrupo" action="show"
										id="${r.id}">
										${r?.encodeAsHTML()}
									</g:link></li>
							</g:each>
							<li class="add"><g:link controller="rolGrupo"
									action="create" params="['grupo.id': grupoInstance?.id]">
									${message(code: 'default.add.label', args: [message(code: 'rolGrupo.label', default: 'RolGrupo')])}
								</g:link></li>
						</ul>

					</div>
				</div>

			</div>

		</div>
	</g:if>

</div>