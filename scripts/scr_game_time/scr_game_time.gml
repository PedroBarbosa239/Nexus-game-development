/// @function scr_game_time()
/// @description Atualiza o relógio e controla o fim do dia.

if (global.campaign_finished) {
    exit;
}

if (!global.day_active) {
    exit;
}

// Avançar o tempo em segundos reais
global.day_elapsed += delta_time / 1000000;

// Calcular o progresso do dia
var _progress = clamp(
    global.day_elapsed / global.day_duration,
    0,
    1
);

// Converter o progresso em minutos do jogo
var _start_minutes = global.start_hour * 60;
var _end_minutes = global.end_hour * 60;

global.game_minutes = floor(
    lerp(_start_minutes, _end_minutes, _progress)
);

// Encerrar o dia quando o tempo acabar
if (global.day_elapsed >= global.day_duration) {
    scr_end_day();
}