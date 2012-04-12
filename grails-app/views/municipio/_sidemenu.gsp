<div class="ae-widget-sidebar  minimizable">
  <!--  Start of Widget Box -->
  <h4 class="ae-widget-header">Menu</h4>

  <!--  Widget  header -->
  <div class="ae-widget-content">
    <!--  Start of Widget Content -->

    <ul class="side-menu">
      <li><a href="#">Iglesia </a>
        <ul>
          <li><g:link controller="municipio" action="create" onClick="self.location='${request.contextPath}/${controllerName}/create';">Registrar</g:link></li>
      <li><g:link controller="municipio" action="list" onClick="self.location='${request.contextPath}/${controllerName}/list';">Listar</g:link></li>
      <li><g:link controller="municipio" action="show" onClick="self.location='${request.contextPath}/${controllerName}/show/1';">Mostrar</g:link></li>
      <li><g:link controller="municipio" action="edit" onClick="self.location='${request.contextPath}/${controllerName}/edit/1';">Editar</g:link></li>
    </ul>
    </li>


    </ul>


  </div>
  <!--  End of Widget Content -->

</div>
<!--  End of Widget Box -->