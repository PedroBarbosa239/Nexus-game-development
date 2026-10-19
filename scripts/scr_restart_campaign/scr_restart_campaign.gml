/// @function scr_restart_campaign()
/// @description Reinicializa os dados para uma nova campanha NEXUS.

// Configuração geral da campanha
scr_game_config();

// Relógio e expediente
global.day_elapsed = 0;
global.game_minutes = global.start_hour * 60;
global.day_active = true;

// Progresso da campanha
global.campaign_day = 1;
global.campaign_finished = false;
global.report_open = false;

// Histórico de decisões
global.decision_history = [];
global.decisions_accepted = 0;
global.decisions_rejected = 0;

// Decisão atual
global.nexus_decision = "";

// Estado do computador
global.computer_mode = false;
global.pc_screen = false;
global.pc_app_open = false;
global.pc_app_minimized = false;
global.pc_active = false;

show_debug_message("Nova campanha NEXUS iniciada.");