extends Node

var rules = {}

func load_rules(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		push_error("Não foi possível carregar DSL: " + file_path)
		return

	while not file.eof_reached():
		var line = file.get_line().strip_edges()

		if line.is_empty() or line.begins_with("#"):
			continue

		if not line.contains("|"):
			push_warning("Linha inválida: " + line)
			continue

		var parts = line.split("|")

		if parts.size() < 2:
			push_warning("Linha mal formatada: " + line)
			continue

		var event_name = parts[0].strip_edges()
		var rest = parts[1].strip_edges().split(" ")

		if rest.size() < 2:
			push_warning("Efeito incompleto em: " + line)
			continue

		var aura_change = rest[0]
		var glow_effect = rest[1] 

		rules[event_name] = {
			"aura": aura_change,
			"glow": glow_effect
		}

	file.close()

func get_rule(event_name: String):
	return rules.get(event_name, {})
