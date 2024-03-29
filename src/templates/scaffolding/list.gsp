
<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:set var="entityName"
	value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">Lista de <g:message code="default.list.label" args="[entityName]" /></h4>
			<div class="ae-widget-content">
				<div id="list-${domainClass.propertyName}"
					class="content scaffold-list" role="main">

					<g:if test="\${flash.message}">
						<div class="message success" role="status">\${flash.message}</div>
					</g:if>
					<div class="ae-widget">
					<table id="pagetable">
						<thead>
							<tr>
								<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 6) {
							%>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<% }   } %>
							</tr>
						</thead>
						<tbody>
							<g:each in="\${${propertyName}List}" status="i"
								var="${propertyName}">
								<tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
									<%  props.eachWithIndex { p, i ->
							if (i == 0) { %>
						<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
					<%      } else if (i < 6) {
								if (p.type == Boolean || p.type == boolean) { %>
						<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
					<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
					<%          } else { %>
						<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
					<%  }   }   } %>
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
