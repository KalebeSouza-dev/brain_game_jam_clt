extends Node

var itens: Array = []
signal inventario_atualizado(lista_de_itens)

func adicionar_item(nome_da_peca: String) -> void:
	itens.append(nome_da_peca)
	print("Item adicionado! Seu inventário agora tem: ", itens)
	
	inventario_atualizado.emit(itens)
