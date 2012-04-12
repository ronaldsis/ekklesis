import com.ekklesis.Rol
import com.ekklesis.Usuario
//import org.apache.catalina.User
import org.ekklesis.ClasificacionPersona
import org.ekklesis.Iglesia
import com.ekklesis.UsuarioRol
import com.ekklesis.Requestmap
import org.ekklesis.RolGrupo
import org.ekklesis.TipoGrupo
import org.ekklesis.Grupo
import org.ekklesis.Persona
import org.ekklesis.MiembroGrupo

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
		/*def igl1 = new Iglesia(
				nombre:'Iglesia Cristiana Evangelica el Buen Pastor',
				direccion:'asd fkjasdlk sdlkjsd '
			).save()*/
                
                /**
                 *
                 */
                def iglesia1 = new Iglesia(rif: "J1111111111", nombre: "Iglesia Cristiana El Buen Pastor", 
                    lema: "Amar a Dios por Sobre Todas Las Cosas", versiculo: "Romanos 3:23", 
                    direccion: "La Concordia", telefono: "2763470749", fax: "2763470749",
                    web: "http://www.google.com", email: "elbuenpastor@gmail.com",
                    twitter: "@elbuenpastor", facebook: "elbuenpastro@facebook.com", 
                    organizacion: "organizacion").save()
        
                 /**
                 *
                 */
                 def rolGrupo1 = new RolGrupo(rol: "Maestro", descripcion: "Ministerios de la Iglesia Maestro").save()
                 def rolGrupo2 = new RolGrupo(rol: "Adorador", descripcion: "Ministerios de la Iglesia Adorador").save()
                 def rolGrupo3 = new RolGrupo(rol: "Predicador", descripcion: "Ministerios de la Iglesia Predicador").save()
                 
        
                 /**
                 *
                 */
                def tipoGrupo1 = new TipoGrupo(nombre: "Grupo Juvenil", descripcion: "Grupo Juvenil").save()
                def tipoGrupo2 = new TipoGrupo(nombre: "Grupo Adulto", descripcion: "Grupo Adulto").save()
                def tipoGrupo3 = new TipoGrupo(nombre: "Grupo Infantil", descripcion: "Grupo Infantil").save()
                def tipoGrupo4 = new TipoGrupo(nombre: "Grupo Adoracion", descripcion: "Grupo Adoracion").save() 
                
        
                /**
                *
                */
               
        
                /**
                *
                */
               def grupo1 = new Grupo(nombre: "Grupo Jovenes", descripcion: "Grupo de Jovenes", tipoGrupo: tipoGrupo1, iglesia: iglesia1)
               //grupo.addToMiembrosdeGrupo()
               grupo1.addToRoles(rol: "Maestro", descripcion: "Maestro de Jovenes")
               grupo1.addToRoles(rol: "Adorador", descripcion: "Adorador de Jovenes")
               grupo1.save()
        
               /**
                *
                */
               def persona1 = new Persona(nombres: "Jhorland Gerardo", apllidos: "Colmenares Jaimes", sexo: "Masculino", 
                   facebook: "colmejhor@facebook.com", twitter: "@jhorlandcolmenares").save() 
        
               /**
                *
                */
               def miembro1Grupo = new MiembroGrupo(persona: persona1, rol: rolGrupo1, grupo: grupo1).save()
               
        
	}
	def destroy = {
	}
}
