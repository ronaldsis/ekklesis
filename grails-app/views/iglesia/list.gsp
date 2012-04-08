
<%@ page import="org.ekklesis.Iglesia"%>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="${message(code: 'iglesia.label', default: 'Iglesia')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de Iglesias</h4>
			<div class="ae-widget-content">
				<div id="list-iglesia" class="content scaffold-list" role="main">

					<g:if test="${flash.message}">
						<div class="message success" role="status">
							${flash.message}
						</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								<th>${message(code: 'iglesia.nombre.label', default: 'Nombre')}</th>
								<th>${message(code: 'iglesia.lema.label', default: 'Lema')}</th>
								<th>${message(code: 'iglesia.email.label', default: 'email')}</th>
								<th>${message(code: 'iglesia.facebook.label', default: 'facebook')}</th>
								<th>${message(code: 'iglesia.fax.label', default: 'fax')}</th>
								<th>${message(code: 'iglesia.direccion.label', default: 'Direccion')}</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${iglesiaInstanceList}" status="i"
								var="iglesiaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

									<td><g:link action="show" id="${iglesiaInstance.id}">
											${fieldValue(bean: iglesiaInstance, field: "nombre")}
										</g:link></td>

									<td>
										${fieldValue(bean: iglesiaInstance, field: "lema")}
									</td>

									<td>
										${fieldValue(bean: iglesiaInstance, field: "email")}
									</td>

									<td>
										${fieldValue(bean: iglesiaInstance, field: "facebook")}
									</td>

									<td>
										${fieldValue(bean: iglesiaInstance, field: "fax")}
									</td>

									<td>
										${fieldValue(bean: iglesiaInstance, field: "direccion")}
									</td>

								</tr>
							</g:each>
						</tbody>
					</table>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
