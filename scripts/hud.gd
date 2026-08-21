extends CanvasLayer

# --- VARIÁVEIS DO INVENTÁRIO ---
@onready var slots = $HBoxContainer.get_children()

# --- VARIÁVEIS DAS MOEDAS ---
@onready var texto_moeda = $MoedasContainer/Moedas

func _ready() -> void:
	# 1. Configura o inventário
	Inventario.inventario_atualizado.connect(_on_inventario_atualizado)
	_on_inventario_atualizado(Inventario.itens)
	
	# 2. Configura as moedas (assumindo que tudo está no Autoload 'Inventario')
	Inventario.moedas_atualizadas.connect(_on_moedas_atualizadas)
	_on_moedas_atualizadas(Inventario.moedas)


# --- FUNÇÕES DO INVENTÁRIO ---
func _on_inventario_atualizado(lista_de_itens: Array) -> void:
	for i in range(slots.size()):
		if i < lista_de_itens.size():
			# Pega o nome da peça (ex: "FILTRO OLEO")
			var nome_da_peca = lista_de_itens[i]
			
			# Pede pro Autoload a foto correspondente àquele nome e coloca no slot
			slots[i].texture = Inventario.banco_de_imagens[nome_da_peca]
		else:
			# Se o espaço do inventário estiver vazio, tira a foto
			slots[i].texture = null

# --- FUNÇÕES DAS MOEDAS ---
func _on_moedas_atualizadas(nova_quantidade: int) -> void:
	texto_moeda.text = str(nova_quantidade)
	
	
# Puxa o Label e o Timer que você acabou de criar
@onready var relogio_label = $RelogioLabel
@onready var timer_expediente = $TimerExpediente

func _process(delta: float) -> void:
	# 1. Pega o tempo total restante arredondado
	var tempo_restante = int(timer_expediente.time_left)
	
	# 2. Matemática para separar minutos e segundos
	var minutos = tempo_restante / 60
	var segundos = tempo_restante % 60
	
	# 3. Formata o texto para ficar sempre com 2 dígitos (ex: "02:05")
	# O "%02d" garante que números menores que 10 ganhem um zero na frente.
	relogio_label.text = "%02d:%02d" % [minutos, segundos]

func _on_timer_expediente_timeout() -> void:
	print("O expediente acabou!")
	# Aqui você pode fazer aparecer uma tela de "Fim do Dia"
	# mostrando quantas moedas o jogador ganhou, etc.
