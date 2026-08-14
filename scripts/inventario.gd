extends Node

var itens: Array = []

func adicionar_item(nome_da_peca: String) -> void:
	itens.append(nome_da_peca)
	print("Item adicionado! Seu inventário agora tem: ", itens)
