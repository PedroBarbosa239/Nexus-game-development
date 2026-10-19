/// @function scr_computer_exit()
/// @description Sai do computador e retorna ao mundo.

if (!variable_global_exists("computer_mode")) {
    global.computer_mode = false;
}

if (!global.computer_mode) {
    exit;
}

global.computer_mode = false;

// Encerrar a interface do aplicativo
global.pc_screen = "desktop";
global.pc_app_open = false;
global.pc_app_minimized = false;

// Desativar o efeito CRT
if (instance_exists(obj_crt_effect)) {
    with (obj_crt_effect) {
        crt_enabled = false;
    }
}

show_debug_message("Computador encerrado. Retorno ao mundo.");