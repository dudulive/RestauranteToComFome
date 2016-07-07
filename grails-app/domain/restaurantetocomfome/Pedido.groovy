package restaurantetocomfome

class Pedido {

	Date dataHora;
	Double valorTotal;
	Cliente cliente;
	
	static hasMany = [itensPedido:ItemPedido]
	
    static constraints = {
		valorTotal min: new Double(0)
		cliente nullable:false
    }
}
