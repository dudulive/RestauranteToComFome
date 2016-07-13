<table>
	<thead>
		<th colspan="2">Permissao</th>
	</thead>
	<g:each in="${permissoes}" var="permissao">
		<tr>
			<td>
				${permissao.authority}
			</td>
			<td><a href="javascript: alterarPermissao(${permissao.id})">Alterar</a> </td>
		</tr>
	</g:each>
</table>