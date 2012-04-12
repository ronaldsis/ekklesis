<%@ page import="org.ekklesis.TipoGrupo" %>



<div class="fieldcontain ${hasErrors(bean: tipoGrupoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoGrupo.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="1000" value="${tipoGrupoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoGrupoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="tipoGrupo.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tipoGrupoInstance?.nombre}"/>
</div>

