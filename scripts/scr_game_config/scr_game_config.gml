/// @function scr_game_config()
/// @description Configurações gerais da campanha NEXUS.

// ==========================================
// CONFIGURAÇÕES DA CAMPANHA
// ==========================================

global.total_days = 7;
global.day_duration = 300;

global.start_hour = 13;
global.end_hour = 18;

// ==========================================
// ESTADO DA CAMPANHA
// ==========================================

// Usamos campaign_day para não conflitar
// com a variável reservada current_day.
global.campaign_day = 1;
global.campaign_finished = false;

// ==========================================
// ESTADO DO DIA
// ==========================================

global.day_active = true;
global.day_elapsed = 0;
global.game_minutes = global.start_hour * 60;

// ==========================================
// RELATORIO FINAL DA CAMPANHA
// ==========================================

global.decision_history = [];

global.decisions_accepted = 0;
global.decisions_rejected = 0;

global.report_open = false;

scr_load_proposals();
scr_load_documents();