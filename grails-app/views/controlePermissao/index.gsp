<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Controle de Permissão</title>
<style type="text/css">
#divUsuario {
	width: 30%;
	float: left;
	border: 1px solid #000;
	margin: 5px;
}

#divPermissao {
	width: 30%;
	float: right;
	border: 1px solid #fc0;
	margin: 5px;
}

#divDetalhesUsuario {
	width: 35%;
	float: left;
	border: 1px solid #000;
	margin: 5px;
}

#divFormulario, #divFormPermissao {
	padding: 5px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		carregarListaUsuarios();
		carregarListaPermissoes();
	})

	function carregarListaPermissoes() {
		$.ajax({
			method : "POST",
			url : "listarPermissao",
			data : {},
			success : function(data) {
				$("#divListaPermissao").html(data)
			}
		})
	}

	function retornoSalvarUsuario(data) {
		if (data.mensagem == "OK") {
			$("#divMensagem").html("Usuario Salvo com sucesso!!");
			$("input[name=login]").val("");
			carregarListaUsuarios();
		} else {
			$("#divMensagem").html("Não foi possivel salvar usuario.");
		}
	}

	function retornoSalvarPermissao(data) {
		if (data.mensagem == "OK") {
			$("#divMensagemPermissao").html("Permissão Salvo com sucesso!!");
			$("#formPermissao input[name=permissao]").val("");
			$("#formPermissao input[name=id]").val("");
			carregarListaPermissoes();
		} else {
			$("#divMensagemPermissao").html("Não foi possivel salvar permissão.");
		}
	}
	
	function carregarListaUsuarios() {
		$.ajax({
			method : "POST",
			url : "listarUsuarios",
			data : {},
			success : function(data) {
				$("#divListaUsurarios").html(data)
			}
		})
	}

	function alterarPermissao(id){
		$.ajax({
			method : "POST",
			url : "getPermissao",
			data : {"id" : id},
			success : function(data) {
				$("#formPermissao input[name=permissao]").val(data.authority);	
				$("#formPermissao input[name=id]").val(data.id);	
			}
		})
	}
</script>
</head>
<body>
	<div id="divUsuario">
		<div id="divFormulario">
			<div id="divMensagem"></div>
			<g:formRemote name="formUsuario"
				url="[controller: 'controlePermissao', action:'salvarUsuario']"
				onSuccess="retornoSalvarUsuario(data)">
		Login <input type="text" name="login" value="" />
				<input type="submit" name="salvar" value="Salvar" />
			</g:formRemote>
		</div>
		<div id="divListaUsurarios"></div>
	</div>
	<div id="divDetalhesUsuario"></div>
	<div id="divPermissao">
		<div id="divFormPermissao">
			<div id="divMensagemPermissao"></div>
			<g:formRemote id="formPermissao" name="formPermissao"
				url="[controller: 'controlePermissao', action:'salvarPermissao']"
				onSuccess="retornoSalvarPermissao(data)">
				 <input type="hidden" name="id"  />
		Permissao <input type="text" name="permissao" value="" />
				<input type="submit" name="salvar" value="Salvar" />
			</g:formRemote>
		</div>
		<div id="divListaPermissao"></div>
	</div>
</body>
</html>