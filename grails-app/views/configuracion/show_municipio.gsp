

<%@ page import="org.ekklesis.Municipio" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="lpages">
  <g:set var="entityName"
         value="${message(code: 'municipio.label', default: 'Municipio')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

  <div id="main-panel">
    <div class="ae-widget-sidebar minimizable">
      <h4 class="ae-widget-header">Configuraci&oacute;n Mostrar Municipio</h4>
      <div class="ae-widget-content">
        <div id="show-municipio"
             class="content scaffold-show" role="main">
          
          <g:if test="${flash.message}">
            <div class="message success" role="status">${flash.message}</div>
          </g:if>
          <ol class="property-list municipio">

            <g:if test="${municipioInstance?.estado}">
              <li class="fieldcontain">
                <span id="estado-label" class="property-label"><g:message code="municipio.estado.label" default="Estado" /></span>

                <span class="property-value" aria-labelledby="estado-label"><g:link controller="configuracion" action="show_municipio" id="${municipioInstance?.estado?.id}">${municipioInstance?.estado?.encodeAsHTML()}</g:link></span>

              </li>
            </g:if>

            <g:if test="${municipioInstance?.nombre}">
              <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="municipio.nombre.label" default="Nombre" /></span>

                <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${municipioInstance}" field="nombre"/></span>

              </li>
            </g:if>

          </ol>
          <g:form>
            <fieldset class="buttons">
              <table>
                <tr>
                  <td>
                <g:hiddenField name="id"
                               value="${municipioInstance?.id}" /> 
                                
                <g:actionSubmit class="edit button" action="edit_municipio" id="${municipioInstance?.id}"
                                    value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                
                </td>
                <td>
                <g:actionSubmit class="delete button" action="delete_municipio"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </td>
                </tr>
              </table>
            </fieldset>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
