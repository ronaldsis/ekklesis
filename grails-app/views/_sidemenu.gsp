<div class="ae-widget-sidebar  minimizable">
	<!--  Start of Widget Box -->
	<h4 class="ae-widget-header">Menu</h4>

	<!--  Widget  header -->
	<div class="ae-widget-content">
		<!--  Start of Widget Content -->

		<ul class="side-menu">
			<li><a href="#">Iglesia </a>
				<ul>
                                  <li><g:link controller="familia" action="ed5t" onClick="self.location='${request.contextPath}/iglesia/edit/1';">Editar Informaci&oacute;n</g:link></li>
                                <li><g:link controller="familia" action="create" onClick="self.location='${request.contextPath}/iglesia/show/1';">Ver Informaci&oacute;n</g:link></li>
					
				</ul>
			</li>
			<li><a href="#">Miembros</a>
				<ul>
					<li><g:link controller="familia" action="create" onClick="self.location='${request.contextPath}/persona/list';">Listado</g:link></li>
				</ul>
			</li>
			
		</ul>


	</div>
	<!--  End of Widget Content -->

</div>
<!--  End of Widget Box -->