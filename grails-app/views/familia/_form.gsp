<%@ page import="org.ekklesis.Familia" %>


<div class="container_80">

  <!--Panel Izquierdo-->
  <div class="grid_40">

    <div class="grid_40">
      <div class="fieldcontain ${hasErrors(bean: familiaInstance, field: 'iglesia', 'error')} required">
        <label for="iglesia">
          <g:message code="familia.iglesia.label" default="Iglesia" />
          <span class="required-indicator">*</span>
        </label>
        <g:select id="iglesia" name="iglesia.id" from="${org.ekklesis.Iglesia.list()}" optionKey="id" required="" value="${familiaInstance?.iglesia?.id}" class="many-to-one ui-widget ui-widget-content ui-corner-left"/>
      </div>
    </div>  

    <!--Salto de Linea-->
    <div class="clear"></div>
    <div class="grid_40">&nbsp;</div>

    
    <div class="grid_20">
    <div class="fieldcontain ${hasErrors(bean: familiaInstance, field: 'apellidos', 'error')} ">
      <label for="apellidos">
        <g:message code="familia.apellidos.label" default="Apellidos" />

      </label>
      <g:textField name="apellidos" value="${familiaInstance?.apellidos}" class="ui-corner-all"/>
    </div>  
    </div>
    
    <div class="grid_20">
    <div class="fieldcontain ${hasErrors(bean: familiaInstance, field: 'fechaMatrimonio', 'error')} required">
      <label for="fechaMatrimonio">
        <g:message code="familia.fechaMatrimonio.label" default="Fecha Matrimonio" />
        <span class="required-indicator">*</span>
      </label>
      <g:datePicker name="fechaMatrimonio" precision="day"  value="${familiaInstance?.fechaMatrimonio}"  />
    </div>  
    </div>
    
    
    <!--Salto de Linea-->
    <div class="clear"></div>
    <div class="grid_40">&nbsp;</div>
    
    
    <div class="grid_20">
    <div class="fieldcontain ${hasErrors(bean: familiaInstance, field: 'telefonoPrincipal', 'error')} ">
      <label for="telefonoPrincipal">
        <g:message code="familia.telefonoPrincipal.label" default="Telefono Principal" />

      </label>
      <g:textField name="telefonoPrincipal" value="${familiaInstance?.telefonoPrincipal}" class="ui-corner-all"/>
    </div>  
    </div>
    
    <div class="grid_20">
      <div class="fieldcontain ${hasErrors(bean: familiaInstance, field: 'email', 'error')} ">
      <label for="email">
        <g:message code="familia.email.label" default="Email" />

      </label>
      <!--Antes era de g:field ahora g:textField-->  
      <g:textField type="email" name="email" value="${familiaInstance?.email}" class="ui-corner-all"/>
    </div>
    </div>

    <!--Salto de Linea-->
    <div class="clear"></div>
    <div class="grid_40">&nbsp;</div>
    
    <div class="grid_20">
    <div class="fieldcontain ${hasErrors(bean: familiaInstance, field: 'direccionPrincipal', 'error')} ">
      <label for="direccionPrincipal">
        <g:message code="familia.direccionPrincipal.label" default="Direccion Principal" />

      </label>
      <g:textField name="direccionPrincipal" value="${familiaInstance?.direccionPrincipal}" class="ui-corner-all"/>
    </div>  
    </div>
    
    
    <div class="grid_20">
    <div class="fieldcontain ${hasErrors(bean: familiaInstance, field: 'status', 'error')} ">
      <label for="status">
        <g:message code="familia.status.label" default="Status" />

      </label>
      <g:checkBox name="status" value="${familiaInstance?.status}" />
    </div>  
    </div>
    
  </div>

  
  
  <!--Panel Derecho-->
  <div class="grid_50">
    <div class="ae-widget minimizable">
    <p class="ae-widget-header" align="left">Familiares</p>
    <div class="fieldcontain ${hasErrors(bean: familiaInstance, field: 'miembrosFamilia', 'error')} ">
      <label for="miembrosFamilia">
        <g:message code="familia.miembrosFamilia.label" default="Miembros Familia" />

      </label>

      <ul class="one-to-many">
        <g:each in="${familiaInstance?.miembrosFamilia?}" var="m">
          <li><g:link controller="miembroFamilia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
        <g:link controller="miembroFamilia" action="create" params="['familia.id': familiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'miembroFamilia.label', default: 'MiembroFamilia')])}</g:link>
        </li>
      </ul>

    </div>
  </div>
  </div>
  
</div>  
