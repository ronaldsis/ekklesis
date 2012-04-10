<%@ page import="org.ekklesis.MiembroFamilia" %>

<div class="container_20">

  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>

  <div class="grid_10">
    <div class="fieldcontain ${hasErrors(bean: miembroFamiliaInstance, field: 'persona', 'error')} required">
      <label for="persona">
        <g:message code="miembroFamilia.persona.label" default="Persona" />
        <span class="required-indicator">*</span>
      </label>
      <g:select id="persona" name="persona.id" from="${org.ekklesis.Persona.list()}" optionKey="id" required="" value="${miembroFamiliaInstance?.persona?.id}" noSelection="['':'Seleccione una Persona']" class="many-to-one ui-widget ui-widget-content ui-corner-left"/>
    </div>  
  </div>

  <div class="grid_10">
    <div class="fieldcontain ${hasErrors(bean: miembroFamiliaInstance, field: 'familia', 'error')} required">
      <label for="familia">
        <g:message code="miembroFamilia.familia.label" default="Familia" />
        <span class="required-indicator">*</span>
      </label>
      <g:select id="familia" name="familia.id" from="${org.ekklesis.Familia.list()}" optionKey="id" required="" value="${miembroFamiliaInstance?.familia?.id}" noSelection="['':'Seleccione una Familia']" class="many-to-one ui-widget ui-widget-content ui-corner-left"/>
    </div>  
  </div>

  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>


  <div class="grid_20">
    <div class="fieldcontain ${hasErrors(bean: miembroFamiliaInstance, field: 'rol', 'error')} ">
      <label for="rol">
        <g:message code="miembroFamilia.rol.label" default="Rol" />

      </label>
      <g:select name="rol" from="${miembroFamiliaInstance.constraints.rol.inList}" value="${miembroFamiliaInstance?.rol}" valueMessagePrefix="miembroFamilia.rol" noSelection="['':'Seleccione un Rol']" class="ui-widget ui-widget-content ui-corner-left"/>
    </div>  
  </div>

<!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>
  
</div>