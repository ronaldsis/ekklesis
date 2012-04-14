

<%@ page import="org.ekklesis.Asistencia" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="lpages">
  <g:set var="entityName"
         value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

  <div id="main-panel">
    <div class="ae-widget-sidebar minimizable">
      <h4 class="ae-widget-header">Mostrar Asistencia</h4>
      <div class="ae-widget-content">
        <div id="show-asistencia"
             class="content scaffold-show" role="main">
          <h1>
            <g:message code="default.show.label" args="[entityName]" />
          </h1>
          <g:if test="${flash.message}">
            <div class="message success" role="status">${flash.message}</div>
          </g:if>
          <ol class="property-list asistencia">

            <g:if test="${asistenciaInstance?.fecha}">
              <li class="fieldcontain">
                <span id="fecha-label" class="property-label"><g:message code="asistencia.fecha.label" default="Fecha" /></span>

                <span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${asistenciaInstance?.fecha}" /></span>

              </li>
            </g:if>

            <g:if test="${asistenciaInstance?.nota}">
              <li class="fieldcontain">
                <span id="nota-label" class="property-label"><g:message code="asistencia.nota.label" default="Nota" /></span>

                <span class="property-value" aria-labelledby="nota-label"><g:fieldValue bean="${asistenciaInstance}" field="nota"/></span>

              </li>
            </g:if>

            <g:if test="${asistenciaInstance?.persona}">
              <li class="fieldcontain">
                <span id="persona-label" class="property-label"><g:message code="asistencia.persona.label" default="Persona" /></span>

                <span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${asistenciaInstance?.persona?.id}">${asistenciaInstance?.persona?.encodeAsHTML()}</g:link></span>

              </li>
            </g:if>

            <g:if test="${asistenciaInstance?.reunion}">
              <li class="fieldcontain">
                <span id="reunion-label" class="property-label"><g:message code="asistencia.reunion.label" default="Reunion" /></span>

                <span class="property-value" aria-labelledby="reunion-label"><g:link controller="reunion" action="show" id="${asistenciaInstance?.reunion?.id}">${asistenciaInstance?.reunion?.encodeAsHTML()}</g:link></span>

              </li>
            </g:if>

          </ol>
          <g:form>
            <fieldset class="buttons">
              <table>
                <tr>
                  <td>
                <g:hiddenField name="id"
                               value="${asistenciaInstance?.id}" /> 

                <g:link class="edit"
                        action="edit" id="${asistenciaInstance?.id}">
                  <g:message code="default.button.edit.label" default="Edit" />
                </g:link>

                <g:actionSubmit class="edit button" action="edit"
                                value="${message(code: 'default.button.edit.label', default: 'Edit')}"/>

                </td>
                <td><g:actionSubmit class="delete button" action="delete"
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
