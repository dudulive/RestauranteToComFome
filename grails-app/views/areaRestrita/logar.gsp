<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Área restrita - Restaurante To com Fome</title>
</head>
<body>
  
  <form name="formLogar" id="formLogar"
		  action="${request.contextPath}/j_spring_security_check" method='POST'>
 
		  <table>
			<tr>
				<td>Login:</td>
				<td><input type='text' name='j_username' id="username"></td>
			</tr>
			<tr>
				<td>Senha:</td>
				<td><input type='password' name='j_password' id="password"/></td>
			</tr>
			<tr>
				<td colspan='2'>
				<input type="submit" value="Entrar" /></td>
			</tr>
		  </table> 
		</form>
</body>
</html>