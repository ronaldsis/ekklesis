

<%@ page import="org.ekklesis.Reunion" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="lpages">
  <g:set var="entityName"
         value="${message(code: 'reunion.label', default: 'Reunion')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

  <div id="main-panel">
    <div class="ae-widget-sidebar minimizable">
      <h4 class="ae-widget-header">Mostrar Reuni&oacute;n</h4>
      <div class="ae-widget-content">
        <div id="show-reunion"
             class="content scaffold-show" role="main">
          <h1>
            <g:message code="default.show.label" args="[entityName]" />
          </h1>
          <g:if test="${flash.message}">
            <div class="message success" role="status">${flash.message}</div>
          </g:if>
          <ol class="property-list reunion">

            <g:if test="${reunionInstance?.titulo}">
              <li class="fieldcontain">
                <span id="titulo-label" class="property-label"><g:message code="reunion.titulo.label" default="Titulo" /></span>

                <span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${reunionInstance}" field="titulo"/></span>

              </li>
            </g:if>

            <g:if test="${reunionInstance?.ubicacion}">
              <li class="fieldcontain">
                <span id="ubicacion-label" class="property-label"><g:message code="reunion.ubicacion.label" default="Ubicacion" /></span>

                <span class="property-value" aria-labelledby="ubicacion-label"><g:fieldValue bean="${reunionInstance}" field="ubicacion"/></span>

              </li>
            </g:if>

            <g:if test="${reunionInstance?.descripcion}">
              <li class="fieldcontain">
                <span id="descripcion-label" class="property-label"><g:message code="reunion.descripcion.label" default="Descripcion" /></span>

                <span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${reunionInstance}" field="descripcion"/></span>

              </li>
            </g:if>

            <g:if test="${reunionInstance?.inicio}">
              <li class="fieldcontain">
                <span id="inicio-label" class="property-label"><g:message code="reunion.inicio.label" default="Inicio" /></span>

                <span class="property-value" aria-labelledby="inicio-label"><g:formatDate date="${reunionInstance?.inicio}" /></span>

              </li>
            </g:if>

            <g:if test="${reunionInstance?.fin}">
              <li class="fieldcontain">
                <span id="fin-label" class="property-label"><g:message code="reunion.fin.label" default="Fin" /></span>

                <span class="property-value" aria-labelledby="fin-label"><g:formatDate date="${reunionInstance?.fin}" /></span>

              </li>
            </g:if>

            <g:if test="${reunionInstance?.asistencias}">
              <li class="fieldcontain">
                <span id="asistencias-label" class="property-label"><g:message code="reunion.asistencias.label" default="Asistencias" /></span>

              <g:each in="${reunionInstance.asistencias}" var="a">
                <span class="property-value" aria-labelledby="asistencias-label"><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
              </g:each>

              </li>
            </g:if>

            <g:if test="${reunionInstance?.personas}">
              <li class="fieldcontain">
                <span id="personas-label" class="property-label"><g:message code="reunion.personas.label" default="Personas" /></span>

              <g:each in="${reunionInstance.personas}" var="p">
                <span class="property-value" aria-labelledby="personas-label"><g:link controller="reunionPersona" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
              </g:each>

              </li>
            </g:if>

          </ol>
          <g:form>
            <fieldset class="buttons">
              <table>
                <tr>
                  <td>
                <g:hiddenField name="id"
                               value="${reunionInstance?.id}" /> 


                <g:actionSubmit class="edit button" action="edit" id="${reunionInstance?.id}"
                                value="${message(code: 'default.button.edit.label', default: 'Edit')}" />

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
