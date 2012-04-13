<%@ page import="org.ekklesis.MiembroGrupo" %>

<div class="container_20">




  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>

  <!--Conjunto de Campos-->
  <div class="ae-widget minimizable">
    <p class="ae-widget-header" align="left">Persona</p>

    <div class="grid_10">
      <div class="fieldcontain ${hasErrors(bean: miembroGrupoInstance, field: 'persona', 'error')} required">
        <label for="persona">
          <g:message code="miembroGrupo.persona.label" default="Persona" />
          <span class="required-indicator">*</span>
        </label>
        <g:select id="persona" name="persona.id" from="${org.ekklesis.Persona.list()}" optionKey="id" required="" value="${miembroGrupoInstance?.persona?.id}" noSelection="['':'Seleccione una Persona']" class="many-to-one ui-widget ui-widget-content ui-corner-left"/>
      </div>
    </div>

    <div class="grid_6">
      <div class="fieldcontain ${hasErrors(bean: miembroGrupoInstance, field: 'rol', 'error')} required">
        <label for="rol">
          <g:message code="miembroGrupo.rol.label" default="Rol" />
          <span class="required-indicator">*</span>
        </label>
        <g:select id="rol" name="rol.id" from="${org.ekklesis.RolGrupo.list()}" optionKey="id" required="" value="${miembroGrupoInstance?.rol?.id}" noSelection="['':'Seleccione un Rol']" class="many-to-one ui-widget ui-widget-content ui-corner-left" />
      </div>
    </div>

    <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>
    <div class="grid_10">
      <div class="fieldcontain ${hasErrors(bean: miembroGrupoInstance, field: 'grupo', 'error')} required">
        <label for="grupo">
          <g:message code="miembroGrupo.grupo.label" default="Grupo" />
          <span class="required-indicator">*</span>
        </label>
        <g:select id="grupo" name="grupo.id" from="${org.ekklesis.Grupo.list()}" optionKey="id" required="" value="${miembroGrupoInstance?.grupo?.id}" noSelection="['':'Seleccione un Grupo']" class="many-to-one ui-widget ui-widget-content ui-corner-left" />
      </div>
    </div>


    <!--Salto de Linea-->
    <div class="clear"></div>
    <div class="grid_20">&nbsp;</div>
    
    <!--Salto de Linea-->
    <div class="clear"></div>
    <div class="grid_20">&nbsp;</div>

    <!--Salto de Linea-->
    <div class="clear"></div>
    <div class="grid_20">&nbsp;</div>

  </div> 

  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>

  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>

  <!--Conjunto de Campos-->
  <div class="ae-widget minimizable">
    <p class="ae-widget-header" align="left">Ingreso</p>

    <div class="grid_10">
      <div class="fieldcontain ${hasErrors(bean: miembroGrupoInstance, field: 'fechaIngreso', 'error')} required">
        <label for="fechaIngreso">
          <g:message code="miembroGrupo.fechaIngreso.label" default="Fecha Ingreso" />
          <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="fechaIngreso" precision="day"  value="${miembroGrupoInstance?.fechaIngreso}" />
      </div>    
    </div>

    <div class="grid_5">
      <div class="fieldcontain ${hasErrors(bean: miembroGrupoInstance, field: 'estatus', 'error')} ">
        <label for="estatus">
          <g:message code="miembroGrupo.estatus.label" default="Estatus" />

        </label>
        <g:checkBox name="estatus" value="${miembroGrupoInstance?.estatus}" />
      </div>  
    </div>

    <!--Salto de Linea-->
    <div class="clear"></div>
    <div class="grid_20">&nbsp;</div>

    <!--Salto de Linea-->
    <div class="clear"></div>
    <div class="grid_20">&nbsp;</div>

    <!--Salto de Linea-->
    <div class="clear"></div>
    <div class="grid_20">&nbsp;</div>

  </div>



</div>