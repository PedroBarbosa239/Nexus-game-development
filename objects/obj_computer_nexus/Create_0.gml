// obj_nexus_computer - Create

// Estado do computador
global.pc_screen = "desktop";
global.pc_active = true;

// Estado do aplicativo
global.pc_app_open = false;
global.pc_app_minimized = false;

// Estado do caso
global.nexus_decision = "";
global.nexus_show_documents = false;

// Dados de exemplo
global.nexus_day = 1;
global.nexus_case_id = "001";

depth = 100;

window_enable_borderless_fullscreen(true);
window_set_fullscreen(true);

window_set_cursor(cr_none);

if (!variable_global_exists("computer_mode")) {
    global.computer_mode = false;
}
