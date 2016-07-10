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
#divFormulario {
	padding: 5px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		alert('Olá, Mundo!')
	})
	
	function retornoSalvarUsuario(data){
		if(data.mensagem == "OK"){
			$("#divMensagem").html("Usuario Salvo com sucesso!!");
			$("input[name=login]").val("");
		}else{		
			$("#divMensagem").html("Não foi possivel salvar usuario.");
		}
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
		<table>
			<thead>
				<th>Nome do Usuario</th>
			</thead>
			<g:each in="${usuarios}" var="usuario">
				<tr>
					<td>
						${usuario.username}
					</td>
				</tr>
			</g:each>
		</table>
	</div>
	<div id="divDetalhesUsuario"></div>
	<div id="divPermissao">
		<table>
			<thead>
				<th>Permissao</th>
			</thead>
			<g:each in="${permissoes}" var="permissao">
				<tr>
					<td>
						${permissao.authority}
					</td>
				</tr>
			</g:each>
		</table>
	</div>
</body>
</html>