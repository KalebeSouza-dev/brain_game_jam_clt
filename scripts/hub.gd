extends CanvasLayer

# Pega todos os Labels (slots) que estão dentro do HBoxContainer
@onready var slots = $HBoxContainer.get_children()

func _ready() -> void:
	# Liga o ouvido do HUD no sinal do nosso Autoload
	Inventario.inventario_atualizado.connect(_on_inventario_atualizado)
	
	# Atualiza a interface logo no início para garantir que está certa
	_on_inventario_atualizado(Inventario.itens)

func _on_inventario_atualizado(lista_de_itens: Array) -> void:
	# Passa por todos os espaços (slots) da hotbar
	for i in range(slots.size()):
		# Se tivermos um item para esse espaço...
		if i < lista_de_itens.size():
			slots[i].text = lista_de_itens[i] # Coloca o nome do item
		else:
			slots[i].text = "Vazio" # Se não, deixa vazio
