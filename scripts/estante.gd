extends Node2D 

# Esta variável vai aparecer no Inspector para você arrastar a cena da Tela da Estante
@export var cena_tela_estante: PackedScene 

var jogador_perto: bool = false

func _ready() -> void:
	# Conecta o "radar" da estante via código. 
	# Certifique-se de que a sua Area2D se chama exatamente "AreaInteracao" e é filha direta deste Node2D
	$AreaInteracao.body_entered.connect(_on_area_interacao_body_entered)
	$AreaInteracao.body_exited.connect(_on_area_interacao_body_exited)

func _process(_delta: float) -> void:
	# Checa se o jogador está perto e se ele apertou a tecla de interação
	if jogador_perto and Input.is_action_just_pressed("interact"):
		abrir_interface()

func _on_area_interacao_body_entered(body: Node2D) -> void:
	# Verifica se quem entrou na zona de colisão é o jogador (grupo "player")
	if body.is_in_group("player"):
		jogador_perto = true

func _on_area_interacao_body_exited(body: Node2D) -> void:
	# Desativa a interação quando o jogador vai embora
	if body.is_in_group("player"):
		jogador_perto = false

func abrir_interface() -> void:
	# Verifica se você lembrou de colocar a cena no Inspector
	if cena_tela_estante != null:
		# Instancia a tela
		var tela = cena_tela_estante.instantiate()
		
		# Coloca a tela visível por cima do jogo
		get_tree().root.add_child(tela)
		
		# Pausa o jogo para o jogador poder mexer na estante tranquilo
		get_tree().paused = true
	else:
		print("Erro: Arraste a cena da interface para a variável 'Cena Tela Estante' no Inspector!")
