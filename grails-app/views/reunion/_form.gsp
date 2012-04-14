<%@ page import="org.ekklesis.Reunion" %>



<div class="fieldcontain ${hasErrors(bean: reunionInstance, field: 'titulo', 'error')} required">
  <label for="titulo">
    <g:message code="reunion.titulo.label" default="Titulo" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField name="titulo" required="" value="${reunionInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reunionInstance, field: 'ubicacion', 'error')} ">
  <label for="ubicacion">
    <g:message code="reunion.ubicacion.label" default="Ubicacion" />

  </label>
  <g:textField name="ubicacion" value="${reunionInstance?.ubicacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reunionInstance, field: 'descripcion', 'error')} ">
  <label for="descripcion">
    <g:message code="reunion.descripcion.label" default="Descripcion" />

  </label>
  <g:textField name="descripcion" value="${reunionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reunionInstance, field: 'inicio', 'error')} required">
  <label for="inicio">
    <g:message code="reunion.inicio.label" default="Inicio" />
    <span class="required-indicator">*</span>
  </label>
  <g:datePicker name="inicio" precision="day"  value="${reunionInstance?.inicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reunionInstance, field: 'fin', 'error')} ">
  <label for="fin">
    <g:message code="reunion.fin.label" default="Fin" />

  </label>
  <g:datePicker name="fin" precision="day"  value="${reunionInstance?.fin}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: reunionInstance, field: 'asistencias', 'error')} ">
  <label for="asistencias">
    <g:message code="reunion.asistencias.label" default="Asistencias" />

  </label>

  <ul class="one-to-many">
    <g:each in="${reunionInstance?.asistencias?}" var="a">
      <li><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
    <g:link controller="asistencia" action="create" params="['reunion.id': reunionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asistencia.label', default: 'Asistencia')])}</g:link>
    </li>
  </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: reunionInstance, field: 'personas', 'error')} ">
  <label for="personas">
    <g:message code="reunion.personas.label" default="Personas" />

  </label>

  <ul class="one-to-many">
    <g:each in="${reunionInstance?.personas?}" var="p">
      <li><g:link controller="reunionPersona" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
    <g:link controller="reunionPersona" action="create" params="['reunion.id': reunionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reunionPersona.label', default: 'ReunionPersona')])}</g:link>
    </li>
  </ul>

</div>

