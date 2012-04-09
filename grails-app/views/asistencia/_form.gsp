<%@ page import="org.ekklesis.Asistencia" %>



<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'fecha', 'error')} required">
  <label for="fecha">
    <g:message code="asistencia.fecha.label" default="Fecha" />
    <span class="required-indicator">*</span>
  </label>
  <g:datePicker name="fecha" precision="day"  value="${asistenciaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'nota', 'error')} ">
  <label for="nota">
    <g:message code="asistencia.nota.label" default="Nota" />

  </label>
  <g:textField name="nota" value="${asistenciaInstance?.nota}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'persona', 'error')} required">
  <label for="persona">
    <g:message code="asistencia.persona.label" default="Persona" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="persona" name="persona.id" from="${org.ekklesis.Persona.list()}" optionKey="id" required="" value="${asistenciaInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'reunion', 'error')} required">
  <label for="reunion">
    <g:message code="asistencia.reunion.label" default="Reunion" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="reunion" name="reunion.id" from="${org.ekklesis.Reunion.list()}" optionKey="id" required="" value="${asistenciaInstance?.reunion?.id}" class="many-to-one"/>
</div>

