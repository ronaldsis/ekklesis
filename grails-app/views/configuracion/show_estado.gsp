

<%@ page import="org.ekklesis.Estado" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="lpages">
  <g:set var="entityName"
         value="${message(code: 'estado.label', default: 'Estado')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

  <div id="main-panel">
    <div class="ae-widget-sidebar minimizable">
      <h4 class="ae-widget-header">Configuraci&oacute;n Mostrar Estado</h4>
      <div class="ae-widget-content">
        <div id="show-estado"
             class="content scaffold-show" role="main">
          <h1>
            <g:message code="default.show.label" args="[entityName]" />
          </h1>
          <g:if test="${flash.message}">
            <div class="message success" role="status">${flash.message}</div>
          </g:if>
          <ol class="property-list estado">

            <g:if test="${estadoInstance?.municipios}">
              <li class="fieldcontain">
                <span id="municipios-label" class="property-label"><g:message code="estado.municipios.label" default="Municipios" /></span>

              <g:each in="${estadoInstance.municipios}" var="m">
                <span class="property-value" aria-labelledby="municipios-label"><g:link controller="municipio" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
              </g:each>

              </li>
            </g:if>

            <g:if test="${estadoInstance?.nombre}">
              <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="estado.nombre.label" default="Nombre" /></span>

                <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${estadoInstance}" field="nombre"/></span>

              </li>
            </g:if>

          </ol>
          <g:form>
            <fieldset class="buttons">
              <table>
                <tr>
                  <td>
                <g:hiddenField name="id"
                               value="${estadoInstance?.id}" /> 
                
                <g:actionSubmit class="edit button" action="edit" id="${estadoInstance?.id}"
                                value="${message(code: 'default.button.edit.label', default: 'Edit')}" />

                </td>
                <td>
                <g:actionSubmit class="delete button" action="delete"
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
