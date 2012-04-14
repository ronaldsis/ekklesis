

<%@ page import="org.ekklesis.ReunionPersona" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="lpages">
  <g:set var="entityName"
         value="${message(code: 'reunionPersona.label', default: 'ReunionPersona')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

  <div id="main-panel">
    <div class="ae-widget-sidebar minimizable">
      <h4 class="ae-widget-header">Mostrar Relaci&oacute;n Persona Reuni&oacute;n</h4>
      <div class="ae-widget-content">
        <div id="show-reunionPersona"
             class="content scaffold-show" role="main">
          <h1>
            <g:message code="default.show.label" args="[entityName]" />
          </h1>
          <g:if test="${flash.message}">
            <div class="message success" role="status">${flash.message}</div>
          </g:if>
          <ol class="property-list reunionPersona">

            <g:if test="${reunionPersonaInstance?.persona}">
              <li class="fieldcontain">
                <span id="persona-label" class="property-label"><g:message code="reunionPersona.persona.label" default="Persona" /></span>

                <span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${reunionPersonaInstance?.persona?.id}">${reunionPersonaInstance?.persona?.encodeAsHTML()}</g:link></span>

              </li>
            </g:if>

            <g:if test="${reunionPersonaInstance?.reunion}">
              <li class="fieldcontain">
                <span id="reunion-label" class="property-label"><g:message code="reunionPersona.reunion.label" default="Reunion" /></span>

                <span class="property-value" aria-labelledby="reunion-label"><g:link controller="reunion" action="show" id="${reunionPersonaInstance?.reunion?.id}">${reunionPersonaInstance?.reunion?.encodeAsHTML()}</g:link></span>

              </li>
            </g:if>

          </ol>
          <g:form>
            <fieldset class="buttons">
              <table>
                <tr>
                  <td>
                <g:hiddenField name="id"
                               value="${reunionPersonaInstance?.id}" /> 

                                
                <g:actionSubmit class="edit button" action="edit" id="${reunionPersonaInstance?.id}"
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
