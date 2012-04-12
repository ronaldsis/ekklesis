<%@ page import="org.ekklesis.Iglesia"%>

<div class="container_80">


  <!--Salto de Linea-->
  <div class="clear"></div>
  <div class="grid_80">&nbsp;</div>


  <!--Panel Izquierdo-->
  <div class="grid_50">

    <div class="ae-widget minimizable">
      <p class="ae-widget-header" align="left">Iglesia</p>

      <div class="grid_20">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'rif', 'error')} ">
          <label for="rif"> <g:message code="iglesia.rif.label"
                                       default="Rif" />

          </label>
          <g:textField name="rif" value="${iglesiaInstance?.rif}" />
        </div>    
      </div>

      <div class="grid_20">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'nombre', 'error')} ">
          <left> <label for="nombre"> <g:message
                code="iglesia.nombre.label" default="Nombre" />
            </label></left>
          <g:textField name="nombre" value="${iglesiaInstance?.nombre}"
                       class="medium ui-corner-all" />
        </div>    
      </div>

      <!--Salto de Linea-->
      <div class="clear"></div>
      <div class="grid_80">&nbsp;</div>

      <!--Direccion-->
      <div class="grid_40">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'direccion', 'error')} ">
          <label for="direccion"> <g:message
              code="iglesia.direccion.label" default="Direccion" />

          </label>
          <g:textArea name="direccion" value="${iglesiaInstance?.direccion}"
                      class='medium ui-corner-all' />
        </div>
      </div>

      <!--Salto de Linea-->
      <div class="clear"></div>
      <div class="grid_80">&nbsp;</div>

      <!--Organizacion-->
      <div class="grid_40">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'organizacion', 'error')} ">
          <label for="organizacion"> <g:message
              code="iglesia.organizacion.label" default="Organizacion" />

          </label>
          <g:textField name="organizacion"
                       value="${iglesiaInstance?.organizacion}" class='medium ui-corner-all'  />
        </div>
      </div>

      <!--Salto de Linea-->
      <div class="clear"></div>
      <div class="grid_80">&nbsp;</div>

      <!--Versiculo-->
      <div class="grid_40">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'versiculo', 'error')} ">
          <label for="versiculo"> <g:message
              code="iglesia.versiculo.label" default="Versiculo" />

          </label>
          <g:textArea name="versiculo" value="${iglesiaInstance?.versiculo}" class='long ui-corner-all'  />
        </div>
      </div>

      <!--Salto de Linea-->
      <div class="clear"></div>
      <div class="grid_80">&nbsp;</div>

      <!--Lema-->
      <div class="grid_40">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'lema', 'error')} ">
          <label for="lema"> <g:message code="iglesia.lema.label"
                                        default="Lema" />

          </label>
          <g:textField name="lema" value="${iglesiaInstance?.lema}"
                       class="medium ui-corner-all" />
        </div>    
      </div>

      <!--Salto de Linea-->
      <div class="clear"></div>
      <div class="grid_80">&nbsp;</div>

      <!--Telefono-->
      <div class="grid_20">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'telefono', 'error')} ">
          <label for="telefono"> <g:message code="iglesia.telefono.label"
                                            default="Telefono" />

          </label>
          <g:textField name="telefono" value="${iglesiaInstance?.telefono}" />
        </div>
      </div>

      <!--Fax-->
      <div class="grid_20">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'fax', 'error')} ">
          <label for="fax"> <g:message code="iglesia.fax.label"
                                       default="Fax" />

          </label>
          <g:textField name="fax" value="${iglesiaInstance?.fax}" />
        </div>    
      </div>

      <!--Salto de Linea-->
      <div class="clear"></div>
      <div class="grid_80">&nbsp;</div>

    </div>


  </div>




  <!--Panel Derecho-->
  <div class="grid_20">

    <div class="ae-widget minimizable">
      <p class="ae-widget-header" align="left">Redes Sociales</p>

      <!--Salto de Linea-->
      <div class="clear"></div>
      <div class="grid_80">&nbsp;</div>

      <!--Email-->
      <div class="grid_20">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'email', 'error')} ">
          <label for="email"> <g:message code="iglesia.email.label"
                                         default="Email" />

          </label>
          <g:textField name="email" value="${iglesiaInstance?.email}" />
        </div>    
      </div>


      <!--Facebook-->
      <div class="grid_20">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'facebook', 'error')} ">
          <label for="facebook"> <g:message code="iglesia.facebook.label"
                                            default="Facebook" />

          </label>
          <g:textField name="facebook" value="${iglesiaInstance?.facebook}" />
        </div>    
      </div>

      <!--Salto de Linea-->
      <div class="clear"></div>
      <div class="grid_80">&nbsp;</div>

      <!--Twiter-->
      <div class="grid_20">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'twitter', 'error')} ">
          <label for="twitter"> <g:message code="iglesia.twitter.label"
                                           default="Twitter" />

          </label>
          <g:textField name="twitter" value="${iglesiaInstance?.twitter}" />
        </div>
      </div>


      <!--Web-->
      <div class="grid_20">
        <div
          class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'web', 'error')} ">
          <label for="web"> <g:message code="iglesia.web.label"
                                       default="Web" />

          </label>
          <g:textField name="web" value="${iglesiaInstance?.web}" class='medium ui-corner-all'  />
        </div>
      </div>

      <!--Salto de Linea-->
      <div class="clear"></div>
      <div class="grid_80">&nbsp;</div>


    </div>


  </div>




































</div>  




<!-- 
<div
        class="fieldcontain ${hasErrors(bean: iglesiaInstance, field: 'imgLogo', 'error')} ">
        <label for="imagen"> <g:message code="iglesia.imgLogo.label"
                        default="img" />

        </label>
        <g:textField name="webLogo" value="${iglesiaInstance?.imgLogo}" />
</div>
-->

