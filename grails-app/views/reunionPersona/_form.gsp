<%@ page import="org.ekklesis.ReunionPersona" %>



<div class="fieldcontain ${hasErrors(bean: reunionPersonaInstance, field: 'persona', 'error')} required">
  <label for="persona">
    <g:message code="reunionPersona.persona.label" default="Persona" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="persona" name="persona.id" from="${org.ekklesis.Persona.list()}" optionKey="id" required="" value="${reunionPersonaInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reunionPersonaInstance, field: 'reunion', 'error')} required">
  <label for="reunion">
    <g:message code="reunionPersona.reunion.label" default="Reunion" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="reunion" name="reunion.id" from="${org.ekklesis.Reunion.list()}" optionKey="id" required="" value="${reunionPersonaInstance?.reunion?.id}" class="many-to-one"/>
</div>

