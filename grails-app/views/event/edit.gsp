<%@ page import="org.ekklesis.Event" %>

<!doctype html>
<html>
<head>
    <meta name="layout" content="lpages">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
	<r:require module="utiles" />
    <r:require module="calendar" />

</head>

<body>
<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Editar Evento</h4>
			<div class="ae-widget-content">
				<div class="btn-menu " role="navigation" align="right" >
					<ul>
						<li><g:link action="index" class="calendar button small">Ver Calendario de Eventos</g:link></li>
					</ul>
				</div>


<div id="edit-event" class="content scaffold-edit" role="main">
  
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${eventInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${eventInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post" class="main">
        <g:hiddenField name="id" value="${eventInstance?.id}"/>
        <g:hiddenField name="version" value="${eventInstance?.version}"/>
        <g:hiddenField name="editType" value="" />

        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
<table><tr><td>
            <g:actionSubmit class="save button ${eventInstance.isRecurring ? 'recurring' : ''}" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/></td>
                            <td>
            <g:actionSubmit class="delete button ${eventInstance.isRecurring ? 'recurring' : ''}" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" /></td>
                            </tr>
                            </table>
        </fieldset>
    </g:form>

    <g:if test="${eventInstance.isRecurring}">
        <g:render template="deletePopup" model="model" />
        <g:render template="editPopup" model="model" />
    </g:if>

</div>
</div>
</div>
</div>

</body>
</html>
