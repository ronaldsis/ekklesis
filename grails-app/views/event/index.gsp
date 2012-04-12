
<!doctype html>
<html>
<head>
<meta name="layout" content="lpages">
<g:validationFieldIncludes />
<title>Calendar</title>
<r:require module="calendar" />
</head>
<body>
	<div id="main-panel">
		<div class="ae-widget-sidebar minimizable">
			<h4 class="ae-widget-header">
				Calendario
			</h4>
			<div class="ae-widget-content">
				<div class="btn-menu" align="right">
					<ul>
						<li><g:link action="create" class="create button small">Evento Nuevo</g:link></li>
					</ul>
				</div>
					<div id="calendar"></div>
			</div>
		</div>
	</div>
</body>
</html>