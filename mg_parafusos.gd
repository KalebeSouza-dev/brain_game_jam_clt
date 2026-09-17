extends CanvasLayer

# Essa variável vai aparecer no Inspector para você arrastar os botões na ordem certa
@export var ordem_parafusos: Array[TextureButton]

# Controla qual é o parafuso que estamos esperando ser clicado agora
var passo_atual: int = 0

func _ready():
	# Passa por todos os botões da lista para conectá-los via código
	for i in range(ordem_parafusos.size()):
		var botao = ordem_parafusos[i]
		
		# Conecta o sinal de clique do botão, passando o "índice" dele na fila
		botao.pressed.connect(_on_parafuso_clicado.bind(i))
		
		botao.button_pressed = true


func _on_parafuso_clicado(indice_clicado: int):
	var botao = ordem_parafusos[indice_clicado]
	
	# Verifica se o botão clicado é o que estávamos esperando
	if indice_clicado == passo_atual:
		# ACERTOU A ORDEM!
		passo_atual += 1
		botao.disabled = true # Desativa o botão para não poder clicar de novo
		botao.button_pressed = false # Mantém ele com a textura de "desparafusado"
		
		# Verifica se foi o último parafuso
		if passo_atual == ordem_parafusos.size():
			print("Sucesso! Todos os parafusos foram removidos.")
			_abrir_painel() # Chama a função que passa de fase ou abre a tela
			
	else:
		# ERROU A ORDEM!
		print("Ordem errada! Você precisa clicar em outro parafuso primeiro.")
		
		# Como o botão está em Toggle Mode, o clique do mouse marca ele como "pressed".
		# Nós precisamos desfazer isso via código para ele voltar à imagem de "parafusado".
		botao.button_pressed = true 
		
		# (Opcional) Aqui você poderia tocar um som de erro!

func _abrir_painel():
	# Coloque aqui o que acontece quando o jogador vence o puzzle
	get_tree().paused = false # Despausa o jogo
	queue_free() # Destrói a tela do minigame

	pass
