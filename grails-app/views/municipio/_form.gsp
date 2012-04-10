<%@ page import="org.ekklesis.Municipio" %>


<div class="container_20">




  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_20">&nbsp;</div>


  <div class="grid_10">
    <div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nombre', 'error')} ">
      <label for="nombre">
        <g:message code="municipio.nombre.label" default="Nombre" />

      </label>
      <g:textField name="nombre" value="${municipioInstance?.nombre}"/>
    </div>  
  </div>

  <div class="grid_10">
    <div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'estado', 'error')} required">
      <label for="estado">
        <g:message code="municipio.estado.label" default="Estado" />
        <span class="required-indicator">*</span>
      </label>
      <g:select id="estado" name="estado.id" from="${org.ekklesis.Estado.list()}" optionKey="id" required="" value="${municipioInstance?.estado?.id}" class="many-to-one"/>
    </div>  
  </div>





</div>