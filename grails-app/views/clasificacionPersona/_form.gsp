<%@ page import="org.ekklesis.ClasificacionPersona" %>



<div class="fieldcontain ${hasErrors(bean: clasificacionPersonaInstance, field: 'clasificacion', 'error')} ">
	<label for="clasificacion">
		<g:message code="clasificacionPersona.clasificacion.label" default="Clasificacion" />
		
	</label>
	<g:textField name="clasificacion" value="${clasificacionPersonaInstance?.clasificacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clasificacionPersonaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="clasificacionPersona.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${clasificacionPersonaInstance?.descripcion}"/>
</div>

