<%@ page import="org.ekklesis.TipoGrupo" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="lpages">
  <g:set var="entityName"
         value="${message(code: 'tipoGrupo.label', default: 'TipoGrupo')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
  <g:validationFieldIncludes />
  <g:javascript>
  </g:javascript>
</head>
<body>
  <div id="main-panel">
    <div class="ae-widget-sidebar minimizable">
      <h4 class="ae-widget-header">Configuraci&oacute;n Editar Tipo de Grupo  </h4>
      <div class="ae-widget-content">
        <div id="edit-tipoGrupo"
             class="content scaffold-edit" role="main">
          <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
          </g:if>
          <g:hasErrors bean="${tipoGrupoInstance}">
            <div class="error" role="alert">
              <g:eachError bean="${tipoGrupoInstance}" var="error">
                <i>
                  <g:message error="${error}" /></i>
              </g:eachError>
            </div>
          </g:hasErrors>
          <g:form method="post"
                  >
            <g:hiddenField name="id" value="${tipoGrupoInstance?.id}" />
            <g:hiddenField name="version" value="${tipoGrupoInstance?.version}" />
            <fieldset class="form">
              <g:render template="form_tipoGrupo" />
            </fieldset>
            <fieldset class="buttons">

              <table>
                <tr>
                  <td>
                <g:actionSubmit class="save button" action="update_tipoGrupo"
                                value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </td>
                <td>
                <g:actionSubmit class="delete button" action="delete_tipoGrupo"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                formnovalidate=""
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Esta usted seguro?')}');" />
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
