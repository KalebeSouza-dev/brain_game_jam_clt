extends Node

# ==========================================
# INVENTÁRIO DE PEÇAS
# ==========================================
var itens: Array = []
signal inventario_atualizado(lista_de_itens)

var banco_de_imagens = {
	"FILTRO OLEO": preload("res://assets/entites/peca1.png"),
	"FILTRO AR": preload("res://assets/entites/peca2.png"),
	"VELA IGNIÇAO": preload("res://assets/entites/peca3.png"),
	"OLEO": preload("res://assets/entites/peca4.png"),
	
	"ALICATE": preload("res://assets/entites/alicate.png"),
	"FENDA": preload("res://assets/entites/fenda.png")
}
func adicionar_item(nome_da_peca: String) -> void:
	# O "has" verifica se a string já existe dentro do array
	if not itens.has(nome_da_peca):
		itens.append(nome_da_peca)
		print("Item adicionado! Seu inventário agora tem: ", itens)
		inventario_atualizado.emit(itens)
		adicionar_moeda(50)
	else:
		# Se quiser, pode colocar um aviso aqui
		print("Você já pegou esse item! Ele não será adicionado novamente.")

# ==========================================
# SISTEMA DE MOEDAS
# ==========================================
var moedas: int = 0
signal moedas_atualizadas(nova_quantidade)

func adicionar_moeda(valor: int = 1) -> void:
	moedas += valor
	print("Você pegou uma moeda! Total: ", moedas)
	moedas_atualizadas.emit(moedas)
