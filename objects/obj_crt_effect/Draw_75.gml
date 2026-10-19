// ==========================================
// CRT - FINALIZAR CAPTURA E APLICAR SHADER
// ==========================================

// Só redefinir o alvo se ativamos a superfície
if (crt_surface_active) {
    surface_reset_target();
    crt_surface_active = false;
}
if (global.report_open) exit;
// Se o CRT estiver desativado ou fora do computador,
// não aplicar o shader.
if (!crt_enabled || !global.computer_mode) {
    shader_reset();
    draw_set_alpha(1);
    draw_set_color(c_white);
    exit;
}

// Verificar se a superfície existe
if (!surface_exists(crt_surface)) {
    shader_reset();
    draw_set_alpha(1);
    draw_set_color(c_white);
    exit;
}

// Obter dimensões da GUI
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Aplicar o shader CRT
shader_set(sh_crt);

// Desenhar a interface capturada com o efeito
draw_surface_stretched(
    crt_surface,
    0,
    0,
    gw,
    gh
);

// Desativar o shader
shader_reset();

// Restaurar configurações
draw_set_alpha(1);
draw_set_color(c_white);