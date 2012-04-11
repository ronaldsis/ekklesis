<div class="ae-widget-sidebar  minimizable">
	<!--  Start of Widget Box -->
	<h4 class="ae-widget-header">Menu</h4>

	<!--  Widget  header -->
	<div class="ae-widget-content">
		<!--  Start of Widget Content -->

		<ul class="side-menu">
			<li><a href="#">Familias</a>
				<ul>
					<li><g:link controller="iglesia" action="create" onClick="self.location='${request.contextPath}/${controllerName}/create';">Nueva</g:link></li>
					<li><g:link controller="iglesia" action="list" onClick="self.location='${request.contextPath}/${controllerName}/list';">Todas las familias</g:link></li>
				</ul></li>			
		</ul>
	</div>
	<!--  End of Widget Content -->

</div>
<!--  End of Widget Box -->