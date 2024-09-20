shader_type canvas_item;

uniform float scanline_count : hint_range(0, 1800) = 50.0;
uniform sampler2D screen_texture: hint_screen_texture, filter_linear_mipmap;

void fragment()
{
	float r = texture(screen_texture, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE.x*-1.5), 0.0).r;
	float g = texture(screen_texture, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE.x*1.5), 0.0).g;
	float b = texture(screen_texture, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE.x*-3.0), 0.0).b;

	float s = sin(SCREEN_UV.y * scanline_count * PI * 2.0);
	s = (s * 0.5 + 0.5) * 0.9 + 0.1;
	vec4 scan_line = vec4(vec3(pow(s, 0.1)), 1.0);

	COLOR = vec4(r, g, b, 1.0) * scan_line;
}