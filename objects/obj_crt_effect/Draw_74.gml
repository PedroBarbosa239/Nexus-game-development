// ==========================================
// CRT - CAPTURAR INICIO DA INTERFACE
// ==========================================

// Não capturar a interface fora do computador
if (!crt_enabled || !global.computer_mode) {
    exit;
}
if (global.report_open) exit;
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Criar a superfície se necessário
if (!surface_exists(crt_surface)) {
    crt_surface = surface_create(gw, gh);
}

// Verificar se a superfície foi criada
if (!surface_exists(crt_surface)) {
    exit;
}

// Ajustar a superfície ao tamanho da GUI
if (surface_get_width(crt_surface) != gw
|| surface_get_height(crt_surface) != gh) {

    surface_free(crt_surface);
    crt_surface = surface_create(gw, gh);
}

// Confirmar novamente que a superfície existe
if (!surface_exists(crt_surface)) {
    exit;
}

// Começar a desenhar na superfície
surface_set_target(crt_surface);
crt_surface_active = true;

// Limpar o quadro anterior
draw_clear_alpha(c_black, 0);