extends CanvasLayer

# Lembre-se de mudar o "Process Mode" desta cena inteira para "Always" no Inspector!
# Se não fizer isso, o botão não vai funcionar quando o jogo estiver pausado.

func _on_button_pressed() -> void:
	# 1. Despausa o jogo para o personagem voltar a andar
	get_tree().paused = false
	
	# 2. Destrói esta tela, fechando a interface
	queue_free()


func _on_peca_1_pressed() -> void:
	Inventario.adicionar_item("FILTRO OLEO")
	
	$ColorRect/Peca1.queue_free()
	#pass # Replace with function body.


func _on_peca_2_pressed() -> void:
	Inventario.adicionar_item("FILTRO AR")
	
	$ColorRect/Peca2.queue_free()

func _on_peca_3_pressed() -> void:
	Inventario.adicionar_item("VELA IGNIÇAO")
	
	$ColorRect/Peca3.queue_free()


func _on_peca_4_pressed() -> void:
	Inventario.adicionar_item("OLEO")
	
	$ColorRect/Peca4.queue_free()
