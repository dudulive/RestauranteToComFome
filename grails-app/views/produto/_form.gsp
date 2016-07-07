<div id="divMensagem"></div>
<g:formRemote name="formProduto"
	url="[controller: 'produto', action: 'salvar']" update="divMensagem" onSuccess="carregarLista()">
		Nome: <input type="text" name="nome" value="${produto.nome }" /><br />
		Preço: <input type="text" name="preco" value="${produto.preco }"/><br/>
		Quantidade: <input type="text" name="quantidade" value="${produto.estoque?.quantidade }"/><br/>
		Quantidade Minima: <input type="text" name="quantidadeMinima" value="${produto.estoque?.quantidadeMinima }"/><br/>
		<input type="submit" name="btnSalvar" value="Salvar"/>
		<input type="button" name="btnCancelar" value="Cancelar" onclick="cancelar()"/>
		<input type="hidden" name="id" value="${produto.id }"/>
</g:formRemote>