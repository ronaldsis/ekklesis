<div class="ae-widget-sidebar  minimizable">
  <!--  Start of Widget Box -->
  <h4 class="ae-widget-header">Menu</h4>

  <!--  Widget  header -->
  <div class="ae-widget-content">
    <!--  Start of Widget Content -->

    <ul class="side-menu">
      <li>
        <a href="#">Configuraci&oacute;n </a>
        <ul>
          <!--Configuracion de Estado-->
          <li><g:link controller="configuracion" action="create_estado" onClick="self.location='${request.contextPath}/${controllerName}/create_estado';">Registrar Estado</g:link></li>
          <li><g:link controller="configuracion" action="list_estado" onClick="self.location='${request.contextPath}/${controllerName}/list_estado';">Listar Estados</g:link></li>

          <!--Configuracion de Municipio-->
          <li><g:link controller="configuracion" action="create_municipio" onClick="self.location='${request.contextPath}/${controllerName}/create_municipio';">Registrar Municipio</g:link></li>
          <li><g:link controller="configuracion" action="list_municipio" onClick="self.location='${request.contextPath}/${controllerName}/list_municipio';">Listar Municipio</g:link></li>
        
          <!--Configuracion de Tipo de Grupo-->
          <li><g:link controller="configuracion" action="create_tipoGrupo" onClick="self.location='${request.contextPath}/${controllerName}/create_tipoGrupo';">Registrar Tipo de Grupo</g:link></li>
          <li><g:link controller="configuracion" action="list_tipoGrupo" onClick="self.location='${request.contextPath}/${controllerName}/list_tipoGrupo';">Listar Tipo de Grupo</g:link></li>
        

    </ul>
    </li>

    </ul>


  </div>
  <!--  End of Widget Content -->

</div>
<!--  End of Widget Box -->