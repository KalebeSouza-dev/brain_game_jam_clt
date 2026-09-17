extends Area2D

# Variável para você arrastar o minigame no Inspector
@export var minigame_scene: PackedScene

var jogador_perto: bool = false

func _ready() -> void:
	# Conecta os sinais da própria Area2D
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta: float) -> void:
	# Usa o SEU botão "interact" configurado no Input Map
	if jogador_perto and Input.is_action_just_pressed("interact"):
		abrir_minigame()

func _on_body_entered(body: Node2D) -> void:
	# Verifica se quem entrou é o player, usando a sua regra de grupos
	if body.is_in_group("player"):
		jogador_perto = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		jogador_perto = false

func abrir_minigame() -> void:
	if minigame_scene != null:
		var minigame_instancia = minigame_scene.instantiate()
		
		# Adiciona no root e pausa o jogo, exatamente como a sua estante faz!
		get_tree().root.add_child(minigame_instancia)
		get_tree().paused = true
		
		# Evita cliques duplos acidentais
		jogador_perto = false 
	else:
		print("Erro: Arraste a cena do minigame no Inspector!")
