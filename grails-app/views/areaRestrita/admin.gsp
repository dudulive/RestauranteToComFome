<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Área restrita - Restaurante To com Fome</title>
</head>
<body>
	<sec:ifLoggedIn>
		Ola, ${usuario }!
	<a href="/RestauranteToComFome/j_spring_security_logout">Sair</a>
	</sec:ifLoggedIn>
</body>
</html>