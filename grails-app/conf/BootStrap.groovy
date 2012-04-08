import com.ekklesis.Rol
import com.ekklesis.Usuario
//import org.apache.catalina.User
import org.ekklesis.ClasificacionPersona
import org.ekklesis.Iglesia
import com.ekklesis.UsuarioRol
import com.ekklesis.Requestmap

class BootStrap {
	def springSecurityService
	//def init(servletContext) {
	def init = { servletContext ->
		def rol1 = new  Rol(authority: 'ROLE_ADMIN', description: 'Rol de Administrador').save()
		def rol2 = new  Rol(authority: 'ROLE_BASIC', description: 'Rol Basico').save()
		//def admin = new Usuario(username: 'luix', password: springSecurityService.encodePassword('admin'), enabled: true).save()
		def admin = new Usuario(username: 'luix', password: 'admin', enabled: true).save()
		def adminRol = new UsuarioRol(rol: rol1, usuario: admin).save()
		def basicRol = new UsuarioRol(rol: rol2, usuario: admin).save()
		
	//	adminRol.save()
		def url1 =  new Requestmap(url: '/iglesia/**', configAttribute: 'ROLE_BASIC').save()
		def clas1 = new ClasificacionPersona(
			clasificacion:'Visita',
			descripcion:'ABC'
			).save()
		def igl1 = new Iglesia(
				nombre:'Iglesia Cristiana Evangelica el Buen Pastor',
				direccion:'asd fkjasdlk sdlkjsd '
			).save()
	}
	def destroy = {
	}
}
