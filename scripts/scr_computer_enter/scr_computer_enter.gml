/// @function scr_computer_enter()
/// @description Entra no computador.

// Garantir que as variáveis globais existam
if (!variable_global_exists("computer_mode")) {
    global.computer_mode = false;
}

if (global.computer_mode) {
    exit;
}

global.computer_mode = true;

global.pc_screen = "desktop";
global.pc_app_open = false;
global.pc_app_minimized = false;

show_debug_message("Entrou no computador.");

if (instance_exists(obj_crt_effect)) {
    with (obj_crt_effect) {
        crt_enabled = true;
    }
}