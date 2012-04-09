<%@ page import="org.ekklesis.RolGrupo" %>


<div class="container_20">

  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>
    
  <div class="grid_10">
    <div class="fieldcontain ${hasErrors(bean: rolGrupoInstance, field: 'rol', 'error')} ">
      <label for="rol">
        <g:message code="rolGrupo.rol.label" default="Rol" />

      </label>
      <g:textField name="rol" value="${rolGrupoInstance?.rol}" class="long ui-corner-all"/>
    </div>
  </div>
  
  
  <div class="grid_10">
    <div class="fieldcontain ${hasErrors(bean: rolGrupoInstance, field: 'descripcion', 'error')} ">
      <label for="descripcion">
        <g:message code="rolGrupo.descripcion.label" default="Descripcion" />

      </label>
      <g:textField name="descripcion" value="${rolGrupoInstance?.descripcion}" class="long ui-corner-all"/>
    </div>
  </div>
  
  
  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>
  
  
  <div class="grid_10">
    <div class="fieldcontain ${hasErrors(bean: rolGrupoInstance, field: 'grupo', 'error')} required">
      <label for="grupo">
        <g:message code="rolGrupo.grupo.label" default="Grupo" />
        <span class="required-indicator">*</span>
      </label>
      <g:select id="grupo" name="grupo.id" from="${org.ekklesis.Grupo.list()}" optionKey="id" required="" value="${rolGrupoInstance?.grupo?.id}" class="many-to-one ui-widget ui-widget-content ui-corner-left"/>
    </div> 
  </div>

  <div class="grid_10">
    <div class="fieldcontain ${hasErrors(bean: rolGrupoInstance, field: 'miembrosRol', 'error')} ">
      <label for="miembrosRol">
        <g:message code="rolGrupo.miembrosRol.label" default="Miembros Rol" />

      </label>

      <ul class="one-to-many">
        <g:each in="${rolGrupoInstance?.miembrosRol?}" var="m">
          <li><g:link controller="miembroGrupo" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
        <g:link controller="miembroGrupo" action="create" params="['rolGrupo.id': rolGrupoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo')])}</g:link>
        </li>
      </ul>

    </div>  
  </div>

  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>

  

</div>