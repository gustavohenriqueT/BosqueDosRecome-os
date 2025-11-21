shader_type canvas_item;

uniform vec4 glow_color : source_color = vec4(1.0);

void fragment() {
	COLOR = texture(TEXTURE, UV) * vec4(1.0);
	COLOR.rgb += glow_color.rgb * 0.5;
}
