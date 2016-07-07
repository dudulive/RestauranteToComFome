package restaurantetocomfome

import javax.persistence.DiscriminatorColumn;

class Produto {

	String nome;
	Double preco;
	Estoque estoque;
	
	static hasMany = [itensPedido:ItemPedido, clientes:Cliente];
	
	static belongsTo = [Cliente];
	
    static constraints = {
		nome nullable:false,blank:false
		preco min: new Double(0)
    }
	
	static mapping = {
		discriminator column: "tipo", value:"GERAL"
		clientes joinTable: [name:"preferencias_cliente", key:"id_produto", column:"id_cliente"]
	}
}
