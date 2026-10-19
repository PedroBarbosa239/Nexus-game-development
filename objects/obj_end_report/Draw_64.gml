/// RELATÓRIO FINAL — TELA DO JOGO

if (!global.report_open) exit;

// Dimensões da tela
var gw = display_get_gui_width();
var gh = display_get_gui_height();


// Margens e cores
var wx = 0;
var wy = 0;
var ww = gw;
var wh = gh;

var color_panel = make_color_rgb(12, 15, 20);
var color_accent = make_color_rgb(90, 230, 190);
var color_text = make_color_rgb(220, 225, 230);
var color_muted = make_color_rgb(105, 120, 135);
	
// Fundo do relatório ocupando a tela inteira
draw_set_alpha(1);
draw_set_color(color_panel);
draw_rectangle(0, 0, gw, gh, false);
// Painel central
draw_set_color(color_panel);
draw_rectangle(wx, wy, wx + ww, wy + wh, false);

// Cabeçalho
draw_set_color(color_accent);
draw_text(wx + 24, wy + 20, "NEXUS // RELATORIO FINAL");

draw_set_color(color_muted);
draw_text(wx + 24, wy + 48, "ARQUIVO DE ENCERRAMENTO DA CAMPANHA");

// Linha divisória
draw_set_color(make_color_rgb(45, 65, 75));
draw_line(wx + 24, wy + 78, wx + ww - 24, wy + 78);

// Resumo
// RESUMO DA CAMPANHA
var accepted = global.decisions_accepted;
var rejected = global.decisions_rejected;
var total = array_length(global.decision_history);

var agreements = 0;
var disagreements = 0;

for (var i = 0; i < total; i++) {
    var item = global.decision_history[i];

    if (item.decision == item.ai_recommendation) {
        agreements += 1;
    } else {
        disagreements += 1;
    }
}

var sy = wy + 100;

draw_set_color(color_accent);
draw_text(wx + 24, sy, "STATUS: CAMPANHA ENCERRADA");

draw_set_color(color_text);
draw_text(wx + 24, sy + 36,
    "Dias concluidos: " +
    string(global.total_days) + "/" +
    string(global.total_days));

draw_text(wx + 24, sy + 62,
    "Decisoes registradas: " + string(total));

draw_text(wx + 24, sy + 88,
    "Aprovadas: " + string(accepted));

draw_text(wx + 24, sy + 114,
    "Negadas: " + string(rejected));

draw_text(wx + 360, sy + 36,
    "Concordancias com a IA: " + string(agreements));

draw_text(wx + 360, sy + 62,
    "Divergencias com a IA: " + string(disagreements));
// Separador do histórico
var line_y = sy + 152;

draw_set_color(make_color_rgb(45, 65, 75));
draw_line(wx + 24, line_y, wx + ww - 24, line_y);

draw_set_color(color_accent);
draw_text(wx + 24, line_y + 18, "HISTORICO DE DECISOES");

// Histórico
var history_y = line_y + 52;
var history_count = array_length(global.decision_history);

draw_set_color(color_text);

if (history_count == 0) {
    draw_text(wx + 24, history_y, "Nenhuma decisao registrada.");
} else {
    for (var i = 0; i < history_count; i++) {
        var item = global.decision_history[i];

        var minutes = item.time;
        var hour = floor(minutes / 60);
        var minute = minutes mod 60;

        var hour_text = string(hour);
        var minute_text = string(minute);

        if (hour < 10) hour_text = "0" + hour_text;
        if (minute < 10) minute_text = "0" + minute_text;

      var entry =
    "DIA " + string(item.day) +
    " | " + hour_text + ":" + minute_text +
    " | " + item.proposal_id +
    " | " + item.decision +
    " | IA: " + item.ai_recommendation;

draw_text(
    wx + 24,
    history_y + i * 26 - report_scroll,
    entry
);
    }
}

// Rodapé
draw_set_color(color_muted);
draw_text(
    wx + 24,
    wy + wh - 38,
    "NEXUS SYSTEM // FIM DA CAMPANHA"
);
// BOTÃO VOLTAR AO INÍCIO
var btn_w = 240;
var btn_h = 48;

var btn_x = (gw - btn_w) / 2;
var btn_y = gh - 100;

var hovering =
    mouse_x >= btn_x &&
    mouse_x <= btn_x + btn_w &&
    mouse_y >= btn_y &&
    mouse_y <= btn_y + btn_h;

// Fundo do botão
if (hovering) {
    draw_set_color(make_color_rgb(35, 100, 90));
} else {
    draw_set_color(make_color_rgb(25, 65, 65));
}

draw_rectangle(
    btn_x,
    btn_y,
    btn_x + btn_w,
    btn_y + btn_h,
    false
);

// Borda
draw_set_color(make_color_rgb(100, 220, 180));

draw_rectangle(
    btn_x,
    btn_y,
    btn_x + btn_w,
    btn_y + btn_h,
    true
);

// Texto
draw_set_color(c_white);

draw_text(
    btn_x + (btn_w - string_width("VOLTAR AO INICIO")) / 2,
    btn_y + (btn_h - string_height("VOLTAR AO INICIO")) / 2,
    "VOLTAR AO INICIO"
);
draw_set_color(c_white);