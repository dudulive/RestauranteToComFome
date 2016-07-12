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