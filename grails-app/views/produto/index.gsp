<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Gerenciamento de Produtos</title>
<g:javascript library="jquery" />
<script type="text/javascript">
	function carregarLista() {
		<g:remoteFunction controller="produto" action="lista" update="divListar"/>
	}

	function excluir(id) {
		if (confirm("Deseja realmente excluir?")) {
			<g:remoteFunction controller="produto" action="excluir" update="divListar" id="'+id+'"/>
		}
	}

	function cancelar() {
      jQuery('#divForm').html("");
	}
</script>
</head>
<body>
	<g:remoteLink controller="produto" action="adicionar" update="divForm">Adicionar</g:remoteLink>
	<br />

	<div id="divListar">
		<g:render template="lista" model="[produtos : produtos]"></g:render>
	</div>

	<div id="divForm"></div>
</body>
</html>