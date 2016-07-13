package restaurantetocomfome

import com.sun.beans.decoder.FalseElementHandler;

import grails.converters.JSON;
import comun.Permissao;
import comun.Usuario;

class ControlePermissaoController {

    def index() { 
		def listaPermissoes = Permissao.list()
		render(view:"index", model: [permissoes:listaPermissoes])
	}
	
	def listarUsuarios(){
		def listaUsuarios = Usuario.createCriteria().list{
			order("username")
		}
		render(template:"listaUsuarios", model: [usuarios:listaUsuarios] ) 
	}
	
	def getPermissao(){
		Permissao permissao = Permissao.get(params.id);
		render permissao as JSON
	}
	
	def getUsuario(){
		
	}
	
	def listarPermissao(){
		def listaPermissoes = Permissao.list()
		render(template:"listaPermissao", model: [permissoes:listaPermissoes])
	}
	
	def salvarPermissao(){
		def retorno = [:]
		Permissao permissao ;
		if(params.id){
			permissao = Permissao.get(params.id)	
		}else{
		 permissao = new Permissao();
		}
		permissao.authority = params.permissao
		permissao.validate()
		if(!permissao.hasErrors()){
		 permissao.save(flush:true)
			retorno["mensagem"]="OK"
		}else{
			retorno["mensagem"]="ERROR"
		}
		render retorno as JSON
	}
	
	def excluirUsuario(){
		
	}
	
	def excuirPermissao(){
		
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
