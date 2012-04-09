<%@ page import="org.ekklesis.TipoGrupo" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="lpages">
  <g:set var="entityName"
         value="${message(code: 'tipoGrupo.label', default: 'TipoGrupo')}" />
  <title><g:message code="default.create.label"
                    args="[entityName]" /></title>
  <g:validationFieldIncludes />
  <g:javascript>

  </g:javascript>
</head>
<body>
  <div id="main-panel">
    <div class="ae-widget-sidebar minimizable">
      <h4 class="ae-widget-header">Registrar Tipo de Grupo</h4>
      <div class="ae-widget-content">
        <div id="create-tipoGrupo"
             class="content scaffold-create" role="main">
          <g:if test="${flash.message}">
            <div class="message success" role="status">${flash.message}</div>
          </g:if>
          <g:hasErrors bean="${tipoGrupoInstance}">
            <div class="error" role="alert">
              <g:eachError bean="${tipoGrupoInstance}" var="error">
                <i><g:message 	error="${error}" /></i>
              </g:eachError>
            </div>
          </g:hasErrors>
          <g:form action="save"
                  >
            <fieldset class="form">
              <g:render template="form" />
            </fieldset>
            <fieldset class="buttons">
              <g:submitButton name="create" class="save button"
                              value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
