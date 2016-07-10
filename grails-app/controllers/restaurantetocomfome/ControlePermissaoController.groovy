package restaurantetocomfome

import com.sun.beans.decoder.FalseElementHandler;

import grails.converters.JSON;
import comun.Permissao;
import comun.Usuario;

class ControlePermissaoController {

    def index() { 
		def listaUsuarios = Usuario.list()
		def listaPermissoes = Permissao.list()
		render(view:"index", model: [usuarios:listaUsuarios, permissoes:listaPermissoes])
	}
	
	def salvarUsuario(){
		def retorno = [:]
		Usuario usuario = new Usuario();
		usuario.username = params.login
		usuario.enabled = true
		usuario.passwordExpired = false
		usuario.accountExpired = false
		usuario.accountLocked = false
		usuario.password = "1234"
		usuario.validate()
		if(!usuario.hasErrors()){
		 usuario.save(flush:true)
			retorno["mensagem"]="OK"
		}else{
			retorno["mensagem"]="ERROR"
		}
		render retorno as JSON
	}
}
