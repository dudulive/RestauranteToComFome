package restaurantetocomfome


class ProdutoController {

	def index() {

		def lista = Produto.list();

		render(view:"/produto/index", model:[produtos:lista]);
	}

	def adicionar(){
		Produto produto = new Produto();
		produto.preco = 0
		produto.estoque = new Estoque();
		produto.estoque.quantidade = 0;
		produto.estoque.quantidadeMinima= 0;

		render(template:"/produto/form", model:[produto: produto])
	}

	def salvar(){
		Produto produto = null; 
		if(params.id){
			produto = Produto.get(params.id);
		}else{
		   produto = new Produto();
		   produto.estoque = new Estoque();
		}
		
		produto.nome= params.nome;
		produto.preco = params.preco ? params.preco.toDouble() : new Double(0);
		produto.estoque.quantidade = params.quantidade ? params.quantidade.toInteger() : 0;
		produto.estoque.quantidadeMinima = params.quantidadeMinima ? params.quantidadeMinima.toInteger() : 0;

		produto.validate();

		if(!produto.hasErrors()){
			produto.save(flush:true);
			render("Salvou com Sucesso");
		}else{
			render("Ops!!!")
		}
	}

	def lista(){
		def lista = Produto.list();
		render(template:"/produto/lista", model:[produtos: lista])
	}

	def alterar(){
		Produto produto = Produto.get(params.id);
		render(template:"/produto/form", model:[produto: produto])
	}
	
	def excluir(){
		Produto produto = Produto.get(params.id);
		produto.delete(flush:true);
		
		def lista = Produto.list();
		render(template:"/produto/lista", model:[produtos: lista])
	}
}
