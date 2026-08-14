extends CanvasLayer

# Lembre-se de mudar o "Process Mode" desta cena inteira para "Always" no Inspector!
# Se não fizer isso, o botão não vai funcionar quando o jogo estiver pausado.

func _on_button_pressed() -> void:
	# 1. Despausa o jogo para o personagem voltar a andar
	get_tree().paused = false
	
	# 2. Destrói esta tela, fechando a interface
	queue_free()
