
<%@ page import="org.ekklesis.Estado"%>



<div class="container_8">
	<div class="grid_2">
		<div class="LightShadedBox">
			<div class="TinyShadedBox">
				<font size="3"></font>
			</div>
			<br> <img border="0" src="../images/icons/NoPhoto.gif"> <br>
			<br> <br>
		</div>
	</div>
	<div class="grid_5">
		<div
			class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombres', 'error')} required">
			<label for="nombres"> <g:message code="persona.nombres.label"
					default="Nombres" /> <span class="required-indicator">*</span>
			</label>
			<g:textField name="nombres" required=""
				value="${personaInstance?.nombres}" class="long ui-corner-all" />
		</div>
	</div>
	<div class="grid_5">
		<div
			class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellidos', 'error')} required">
			<label for="apellidos"> <g:message
					code="persona.apellidos.label" default="Apellidos" /> <span
				class="required-indicator">*</span>
			</label>
			<g:textField name="apellidos" 
				value="${personaInstance?.apellidos}" class="long ui-corner-all" />
		</div>
	</div>
	<div class="grid_3">
		<div
			class="fieldcontain ${hasErrors(bean: personaInstance, field: 'clasificacion', 'error')} required">
			<label for="clasificacion"> <g:message
					code="persona.clasificacion.label" default="Clasificacion" /> <span
				class="required-indicator">*</span>
			</label>
			<g:select id="clasificacion" name="clasificacion.id"
				from="${org.ekklesis.ClasificacionPersona.list()}" optionKey="id"
				required="" value="${personaInstance?.clasificacion?.id}"
				class="many-to-one ui-widget ui-widget-content ui-corner-left" />
		</div>
	</div>
	<div class="grid_3">
		<div
			class="fieldcontain ${hasErrors(bean: personaInstance, field: 'sexo', 'error')} required">
			<label for="sexo"> <g:message code="persona.sexo.label"
					default="Sexo" /> <span class="required-indicator">*</span>
			</label>
			<g:radioGroup values="['M','F']"  labels="['Masculino','Femenino']" value="${personaInstance?.sexo}" name="sexo" required="">
			<g:message code="${it.label}" />: ${it.radio}
			</g:radioGroup>
		<!--  	<g:radio name="sexo" id="radio1" value="M" required="" />
			Masculino &nbsp;&nbsp;
			<g:radio name="sexo" id="radio2" value="F" required="" />-->
			
		</div>

	</div>
	<div class="grid_4">

		<div
			class="fieldcontain ${hasErrors(bean: personaInstance, field: 'familia', 'error')} ">
			<label for="familia"> <g:message code="persona.familia.label"
					default="Familia" />
			</label>
			<g:select id="familia" name="familia.id"
				from="${org.ekklesis.Familia.list()}" optionKey="id"
				value="${personaInstance?.familia?.id}" class="many-to-one" 
				noSelection="['':'Seleccione Familia']"
				 class="ui-widget ui-widget-content ui-corner-left"
				/>
		</div>
	</div>
	<div class="clear"></div>
	<div class="grid_4">&nbsp;&nbsp;</div>
	<div class="grid_5">
		<div
			class="fieldcontain ${hasErrors(bean: personaInstance, field: 'twitter', 'error')} ">
			<label for="twitter"> <g:message code="persona.twitter.label"
					default="Twitter" />

			</label>
			<g:textField name="twitter" value="${personaInstance?.twitter}" />
		</div>
	</div>

	<div class="grid_5">
		<div
			class="fieldcontain ${hasErrors(bean: personaInstance, field: 'facebook', 'error')} ">
			<label for="facebook"> <g:message
					code="persona.facebook.label" default="Facebook" />

			</label>
			<g:textField name="facebook" value="${personaInstance?.facebook}" />
		</div>
	</div>
	<div class="clear"></div>
	<g:hiddenField name="iglesia.id" value="1" />

	<%--<div class="grid_2">
		<div
			class="fieldcontain ${hasErrors(bean: personaInstance, field: 'imgFoto', 'error')} required">
			<label for="imgFoto"> <g:message code="persona.imgFoto.label"
					default="Img Foto" /> <span class="required-indicator">*</span>
			</label> <input type="file" id="imgFoto" name="imgFoto" />
		</div>
	</div>
	--%>
	<div class="grid_2">&nbsp;</div>

	</br>
	<div class="clear"></div>
	<!-- TODO: MEJORAR ESTE FIELDSET PARA DIRECCIONES -->
	<div class="ae-widget minimizable">

		<p class="ae-widget-header" align="left">Direcciones</p>
		<div class="ae-widget-content">
			<fieldset id="fsDirecciones" class="fsDirecciones">
				<div id="input1" style="margin-bottom: 4px;" class="clonarForm ">

					<div class="clear"></div>
					<div class="grid_2">&nbsp;</div>
					<div class="grid_4">
						<label for='direccion.tipo'>Lugar</label>
						<g:select
							name="direccion.tipo" id="tipo" from="${org.ekklesis.DestinoDato?.values()}"
							 class="ui-widget ui-widget-content ui-corner-left" required="" />
					</div>
					<div class="grid_5">
						Direcci&oacute;n: <input type="text" name="direccion.dir" id="dir" />
					</div>
					<div class="grid_4">
						Sector:<input type="text" name="direccion.sector" id="sector"  required=""/>
					</div>
					<div class="clear"></div>
					<div class="grid_2">&nbsp;</div>
					<div class="grid_4">
						<label for='estado.nombre'>Estado:</label>
						<g:select optionKey="id" optionValue="nombre" name="estado.nombre"
							id="estado1" from="${Estado.list()}"
							onchange="${remoteFunction( controller:'estado', 
            action:'ajaxGetMunicipios', 
            params:'\'id=\' + this.value',
            onComplete:'actualizaMunicipio(XMLHttpRequest, id)')}"
							class="ui-widget ui-widget-content ui-corner-left"
							noSelection="['0':'Seleccione Estado']" required=""
							></g:select>
					</div>
					<div class="grid_4">
						<label for='municipio.nombre'>Municipio</label> <g:select
							name="direccion.ciudad" id="municipio1" from="['']"  noSelection="['':'Seleccione Municipio']"
							class="ui-widget ui-widget-content ui-corner-left" required=""></g:select>
							<g:hiddenField name="direccion.status" value="Activa"/>
					</div>

					<div class="clear"></div>
					</br> </br>
				</div>
			</fieldset>

			<div class="clear"></div>
			<div class="grid_12">&nbsp;</div>
			<div class="grid_2">&nbsp;</div>
			<div class="grid_10">
				<input type="button" id="btnAgregar"
					value="A&ntilde;adir Direcci&oacute;n" />
				<%--<input type="button" id="btnElimina" value="eliminar &uacute;ltima" />
			--%>
			</div>
		</div>

	</div>


	<div class="clear"></div>
</div>
<!-- Fin container de 12 columnas -->






