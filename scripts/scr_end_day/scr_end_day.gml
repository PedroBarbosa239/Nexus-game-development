/// @function scr_end_day()
/// @description Encerra o dia atual e inicia o próximo.

// Verificar se as variáveis foram inicializadas
if (!variable_global_exists("day_active")) {
    exit;
}

if (!variable_global_exists("campaign_finished")) {
    exit;
}

// Impedir encerramento duplicado
if (!global.day_active || global.campaign_finished) {
    exit;
}

// Encerrar o dia atual
global.day_active = false;

// ==========================================
// VERIFICAR SE A CAMPANHA TERMINOU
// ==========================================

if (global.campaign_day >= global.total_days) {

    global.campaign_finished = true;

    // Abrir o relatório final
    global.report_open = true;

    show_debug_message("Campanha NEXUS concluída!");
    show_debug_message("Relatório final disponível.");

    exit;
}

// ==========================================
// AVANCAR PARA O PROXIMO DIA
// ==========================================

global.campaign_day += 1;

// Reiniciar o relógio
global.day_elapsed = 0;
global.game_minutes = global.start_hour * 60;

// Ativar o próximo dia
global.day_active = true;

show_debug_message(
    "Iniciando o dia " + string(global.campaign_day)
);