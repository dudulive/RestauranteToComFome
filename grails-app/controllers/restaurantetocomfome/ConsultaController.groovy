package restaurantetocomfome

class ConsultaController {

    def index() {
		def lista = []
		
		lista = Bebida.findAllByLiquidoGreaterThanAndUnidade(500,"ml");
		
		/*lista = Cliente.createCriteria().list {
			order("nome", "desc")
		}*/

		//lista = Cliente.executeQuery("select cli from Cliente cli order by nome desc")
				
		render(view:"index", model: [lista: lista.liquido])
	}
}
