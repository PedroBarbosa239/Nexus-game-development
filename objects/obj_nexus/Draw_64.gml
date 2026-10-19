// obj_nexus - Draw GUI
if (!global.computer_mode) {
    exit;
}
// O aplicativo so aparece quando esta aberto
if (global.pc_screen != "nexus") {
    exit;
}

var gw = display_get_gui_width();
var gh = display_get_gui_height();

draw_set_alpha(window_alpha);	


// =====================================
// TELA DE INICIALIZACAO DO NEXUS
// DENTRO DA JANELA DO APLICATIVO
// =====================================

if (nexus_boot_active) {

    // Sombra da janela
    draw_set_alpha(window_alpha);
    draw_set_color(make_color_rgb(0, 0, 0));

    draw_rectangle(
        win_x + 7,
        win_y + 7,
        win_x + win_w + 7,
        win_y + win_h + 7,
        false
    );

    // Corpo da janela
    draw_set_color(make_color_rgb(192, 192, 192));

    draw_rectangle(
        win_x,
        win_y,
        win_x + win_w,
        win_y + win_h,
        false
    );

    // Borda externa
    draw_set_color(c_white);

    draw_rectangle(
        win_x,
        win_y,
        win_x + win_w,
        win_y + win_h,
        true
    );

    // Barra de titulo
    draw_set_color(make_color_rgb(20, 65, 150));

    draw_rectangle(
        win_x + 4,
        win_y + 4,
        win_x + win_w - 4,
        win_y + 32,
        false
    );

    // Brilho da barra
    draw_set_color(make_color_rgb(70, 130, 220));

    draw_rectangle(
        win_x + 4,
        win_y + 4,
        win_x + win_w - 4,
        win_y + 8,
        false
    );

    // Titulo
    draw_set_color(c_white);

    draw_text(
        win_x + 12,
        win_y + 11,
        "NEXUS - Inicializando sistema..."
    );

    // Botao fechar
    var close_x1 = win_x + win_w - 36;
    var close_y1 = win_y + 7;
    var close_x2 = win_x + win_w - 9;
    var close_y2 = win_y + 26;

    draw_set_color(make_color_rgb(195, 45, 45));

    draw_rectangle(
        close_x1,
        close_y1,
        close_x2,
        close_y2,
        false
    );

    draw_set_color(c_white);

    draw_rectangle(
        close_x1,
        close_y1,
        close_x2,
        close_y2,
        true
    );

    draw_line(
        close_x1 + 7,
        close_y1 + 5,
        close_x2 - 7,
        close_y2 - 5
    );

    draw_line(
        close_x2 - 7,
        close_y1 + 5,
        close_x1 + 7,
        close_y2 - 5
    );

    // Fundo do aplicativo
    var bx1 = win_x + 10;
    var by1 = win_y + 42;
    var bx2 = win_x + win_w - 10;
    var by2 = win_y + win_h - 12;

    draw_set_color(make_color_rgb(5, 10, 15));

    draw_rectangle(
        bx1,
        by1,
        bx2,
        by2,
        false
    );

    // Logotipo
    draw_set_halign(fa_center);
    draw_set_color(make_color_rgb(80, 235, 230));

    draw_text(
        win_x + win_w * 0.5,
        win_y + 115,
        "N E X U S"
    );

    // Subtitulo
    draw_set_color(make_color_rgb(130, 155, 165));

    draw_text(
        win_x + win_w * 0.5,
        win_y + 150,
        "NEURAL EXPLORATION SYSTEM"
    );

    // Mensagens de inicializacao
    draw_set_halign(fa_left);
    draw_set_color(make_color_rgb(80, 235, 230));

    var msg_x = win_x + 150;
    var msg_y = win_y + 225;

    draw_text(
        msg_x,
        msg_y,
        "> INITIALIZING NEXUS SYSTEM..."
    );

    if (nexus_boot_message >= 1) {
        draw_text(
            msg_x,
            msg_y + 25,
            "> LOADING CASE DATABASE..."
        );
    }

    if (nexus_boot_message >= 2) {
        draw_text(
            msg_x,
            msg_y + 50,
            "> VERIFYING SYSTEM INTEGRITY..."
        );
    }

    if (nexus_boot_message >= 3) {
        draw_text(
            msg_x,
            msg_y + 75,
            "> SYSTEM READY"
        );
    }

    // Barra de progresso
    var bar_x = win_x + 150;
    var bar_y = win_y + 365;
    var bar_w = win_w - 300;
    var bar_h = 12;

    draw_set_color(make_color_rgb(25, 45, 50));

    draw_rectangle(
        bar_x,
        bar_y,
        bar_x + bar_w,
        bar_y + bar_h,
        false
    );

    draw_set_color(make_color_rgb(80, 235, 230));

    draw_rectangle(
        bar_x + 2,
        bar_y + 2,
        bar_x + 2 + (bar_w - 4) * nexus_boot_progress,
        bar_y + bar_h - 2,
        false
    );

    // Porcentagem
    draw_set_color(c_white);

    draw_text(
        bar_x,
        bar_y + 22,
        string(floor(nexus_boot_progress * 100)) + "%"
    );

    // Restaurar configuracoes de desenho
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_set_alpha(1);

    // Nao desenhar a interface normal durante o carregamento
    exit;
}
// =====================================
// SOMBRA DA JANELA
// =====================================

draw_set_color(make_color_rgb(0, 0, 0));
draw_rectangle(
    win_x + 7,
    win_y + 7,
    win_x + win_w + 7,
    win_y + win_h + 7,
    false
);

// =====================================
// CORPO DA JANELA
// =====================================

draw_set_color(make_color_rgb(192, 192, 192));
draw_rectangle(
    win_x,
    win_y,
    win_x + win_w,
    win_y + win_h,
    false
);

// Borda externa clara
draw_set_color(c_white);
draw_rectangle(
    win_x,
    win_y,
    win_x + win_w,
    win_y + win_h,
    true
);

// Borda interna escura
draw_set_color(make_color_rgb(80, 80, 80));
draw_rectangle(
    win_x + 3,
    win_y + 3,
    win_x + win_w - 3,
    win_y + win_h - 3,
    true
);

// =====================================
// BARRA DE TITULO WINDOWS XP
// =====================================

// Fundo azul
draw_set_color(make_color_rgb(20, 65, 150));
draw_rectangle(
    win_x + 4,
    win_y + 4,
    win_x + win_w - 4,
    win_y + 32,
    false
);

// Faixa de brilho
draw_set_color(make_color_rgb(70, 130, 220));
draw_rectangle(
    win_x + 4,
    win_y + 4,
    win_x + win_w - 4,
    win_y + 8,
    false
);
// Linha inferior da barra de titulo
draw_set_color(make_color_rgb(10, 40, 105));

draw_line(
    win_x + 4,
    win_y + 32,
    win_x + win_w - 4,
    win_y + 32
);
// Titulo
draw_set_color(c_white);
draw_text(
    win_x + 12,
    win_y + 11,
    "NEXUS - Sistema de Analise de Casos"
);

// =====================================
// BOTAO MINIMIZAR
// =====================================

var min_x1 = win_x + win_w - 66;
var min_y1 = win_y + 7;
var min_x2 = win_x + win_w - 43;
var min_y2 = win_y + 26;

draw_set_color(make_color_rgb(55, 105, 195));
draw_rectangle(min_x1, min_y1, min_x2, min_y2, false);

draw_set_color(c_white);
draw_rectangle(min_x1, min_y1, min_x2, min_y2, true);
draw_line(min_x1 + 5, min_y1 + 13, min_x2 - 5, min_y1 + 13);

// =====================================
// BOTAO FECHAR
// =====================================

var close_x1 = win_x + win_w - 36;
var close_y1 = win_y + 7;
var close_x2 = win_x + win_w - 9;
var close_y2 = win_y + 26;

draw_set_color(make_color_rgb(195, 45, 45));
draw_rectangle(close_x1, close_y1, close_x2, close_y2, false);

draw_set_color(c_white);
draw_rectangle(close_x1, close_y1, close_x2, close_y2, true);

// X
draw_line(close_x1 + 7, close_y1 + 5, close_x2 - 7, close_y2 - 5);
draw_line(close_x2 - 7, close_y1 + 5, close_x1 + 7, close_y2 - 5);

// =====================================
// CONTEUDO DO APLICATIVO
// =====================================

var content_x = win_x + 10;
var content_y = win_y + 42;
var content_w = win_w - 20;
var content_h = win_h - 54;

// Fundo do conteudo
draw_set_color(make_color_rgb(20, 32, 38));
draw_rectangle(
    content_x,
    content_y,
    content_x + content_w,
    content_y + content_h,
    false
);

// Cabecalho do caso
draw_set_color(make_color_rgb(30, 55, 65));
draw_rectangle(
    content_x + 8,
    content_y + 8,
    content_x + content_w - 8,
    content_y + 43,
    false
);

draw_set_color(make_color_rgb(80, 235, 230));
draw_text(
    content_x + 18,
    content_y + 19,
    "NEXUS // CASO " + global.nexus_case_id
);

// ==========================================
// CONTADOR DE DIAS DA CAMPANHA
// ==========================================

draw_set_color(c_white);

draw_text(
    content_x + content_w - 120,
    content_y + 19,
    "DIA "
    + string(global.campaign_day)
    + " / "
    + string(global.total_days)
);

// =====================================
// CARTAO DA PROPOSTA
// =====================================

// Buscar proposta do dia
var proposal = scr_get_current_proposal();

// Cartao
var card_x = content_x + 12;
var card_y = content_y + 55;
var card_w = content_w * 0.56;
var card_h = content_h - 115;

draw_set_color(make_color_rgb(34, 48, 55));
draw_rectangle(
    card_x,
    card_y,
    card_x + card_w,
    card_y + card_h,
    false
);

if (is_undefined(proposal)) {

    draw_set_color(c_white);
    draw_text(
        card_x + 15,
        card_y + 20,
        "Nenhuma proposta encontrada para este dia."
    );

} else {

    // Area da proposta
    draw_set_color(make_color_rgb(80, 235, 230));
    draw_text(
        card_x + 15,
        card_y + 15,
        proposal.area
    );

    // Titulo
    draw_set_color(c_white);
    draw_text(
        card_x + 15,
        card_y + 45,
        proposal.title
    );

    // Problema
    draw_set_color(make_color_rgb(80, 235, 230));
    draw_text(
        card_x + 15,
        card_y + 85,
        "PROBLEMA"
    );

    draw_set_color(make_color_rgb(210, 220, 220));
    draw_text_ext(
    card_x + 15,
    card_y + 108,
    proposal.problem,
    18,
    card_w - 30
);

    // Intervencao
    draw_set_color(make_color_rgb(80, 235, 230));
    draw_text(
        card_x + 15,
        card_y + 175,
        "INTERVENCAO"
    );

    draw_set_color(make_color_rgb(210, 220, 220));
    draw_text_ext(
    card_x + 15,
    card_y + 198,
    proposal.intervention,
    18,
    card_w - 30
);
}
// =====================================
// PAINEL DA RECOMENDACAO DA IA
// =====================================

var rec_x = card_x + card_w + 12;
var rec_y = card_y;
var rec_w = content_x + content_w - 12 - rec_x;
var rec_h = card_h;

draw_set_color(make_color_rgb(34, 48, 55));
draw_rectangle(
    rec_x,
    rec_y,
    rec_x + rec_w,
    rec_y + rec_h,
    false
);

draw_set_color(make_color_rgb(80, 235, 230));
draw_text(
    rec_x + 12,
    rec_y + 15,
    "RECOMENDACAO IA"
);

if (!is_undefined(proposal)) {

    // Cor da recomendacao
    if (proposal.ai_recommendation == "APROVAR") {
        draw_set_color(make_color_rgb(25, 120, 85));
    } else {
        draw_set_color(make_color_rgb(145, 38, 48));
    }

    draw_rectangle(
        rec_x + 12,
        rec_y + 45,
        rec_x + rec_w - 12,
        rec_y + 83,
        false
    );

    draw_set_color(c_white);
    draw_text(
        rec_x + 24,
        rec_y + 57,
        proposal.ai_recommendation
    );

    // Justificativa
    draw_set_color(make_color_rgb(80, 235, 230));
    draw_text(
        rec_x + 12,
        rec_y + 100,
        "JUSTIFICATIVA:"
    );

    draw_set_color(make_color_rgb(180, 195, 200));
    draw_text_ext(
    rec_x + 12,
    rec_y + 125,
    proposal.ai_reason,
    18,
    rec_w - 24
);
}
// =====================================
// BOTOES DE DECISAO COM HOVER
// =====================================

var buttons_y = content_y + content_h - 48;
var button_h = 34;
var button_w = 125;
var gap = 10;

var reject_x = content_x + 12;
var accept_x = reject_x + button_w + gap;
var docs_x = accept_x + button_w + gap;

// -------------------------------------
// NEGAR
// -------------------------------------

var reject_color = make_color_rgb(145, 38, 48);

if (hover_button == "reject") {
    reject_color = make_color_rgb(205, 55, 65);
}

if (button_feedback == "reject") {
    reject_color = make_color_rgb(235, 95, 95);
}

draw_set_color(reject_color);

draw_rectangle(
    reject_x,
    buttons_y,
    reject_x + button_w,
    buttons_y + button_h,
    false
);

draw_set_color(c_white);

draw_rectangle(
    reject_x,
    buttons_y,
    reject_x + button_w,
    buttons_y + button_h,
    true
);

draw_text(
    reject_x + 32,
    buttons_y + 10,
    "NEGAR"
);

// -------------------------------------
// APROVAR
// -------------------------------------

var accept_color = make_color_rgb(25, 120, 85);

if (hover_button == "accept") {
    accept_color = make_color_rgb(35, 165, 110);
}

if (button_feedback == "accept") {
    accept_color = make_color_rgb(75, 210, 145);
}

draw_set_color(accept_color);

draw_rectangle(
    accept_x,
    buttons_y,
    accept_x + button_w,
    buttons_y + button_h,
    false
);

draw_set_color(c_white);

draw_rectangle(
    accept_x,
    buttons_y,
    accept_x + button_w,
    buttons_y + button_h,
    true
);

draw_text(
    accept_x + 30,
    buttons_y + 10,
    "APROVAR"
);

// -------------------------------------
// DOCUMENTOS
// -------------------------------------

var docs_color = make_color_rgb(45, 80, 115);

if (hover_button == "docs") {
    docs_color = make_color_rgb(65, 120, 170);
}

if (button_feedback == "docs") {
    docs_color = make_color_rgb(90, 155, 205);
}

draw_set_color(docs_color);

draw_rectangle(
    docs_x,
    buttons_y,
    docs_x + button_w,
    buttons_y + button_h,
    false
);

draw_set_color(c_white);

draw_rectangle(
    docs_x,
    buttons_y,
    docs_x + button_w,
    buttons_y + button_h,
    true
);

draw_text(
    docs_x + 25,
    buttons_y + 10,
    "DOCUMENTOS"
);

// =====================================
// ESTADO DA DECISAO
// =====================================

if (global.nexus_decision != "") {

    draw_set_color(c_white);

    draw_text(
        content_x + 12,
        content_y + content_h - 72,
        "Decisao registrada: " + string_upper(global.nexus_decision)
    );
}

// =====================================
// TELA DE DOCUMENTOS
// =====================================

if (documents_open) {

    var dx1 = win_x + 65;
    var dy1 = win_y + 75;
    var dx2 = win_x + win_w - 65;
    var dy2 = win_y + win_h - 65;

    var dw = dx2 - dx1;
    var dh = dy2 - dy1;

    // Fundo
    draw_set_color(make_color_rgb(12, 24, 30));
    draw_rectangle(dx1, dy1, dx2, dy2, false);

    // Barra superior
    draw_set_color(make_color_rgb(35, 85, 150));
    draw_rectangle(dx1, dy1, dx2, dy1 + 32, false);

    draw_set_color(c_white);
    draw_text(dx1 + 12, dy1 + 9, "ARQUIVO DE DOCUMENTOS");

    // Proposta atual
    var proposal = scr_get_current_proposal();

    if (is_undefined(proposal)) {

        draw_set_color(c_white);
        draw_text(dx1 + 18, dy1 + 55,
            "Nenhuma proposta encontrada.");

    } else {

        draw_set_color(make_color_rgb(80, 235, 230));
        draw_text(dx1 + 18, dy1 + 45,
            "CASO: " + proposal.title);

        // Divisao entre lista e conteudo
        var list_x = dx1 + 18;
        var list_y = dy1 + 78;
        var list_w = dw * 0.34;
        var content_x = list_x + list_w + 18;
        var content_y = list_y;
        var content_w = dx2 - content_x - 18;

        draw_set_color(make_color_rgb(35, 55, 65));
        draw_rectangle(
            list_x,
            list_y,
            list_x + list_w,
            dy2 - 55,
            false
        );

        draw_set_color(make_color_rgb(80, 235, 230));
        draw_text(list_x + 10, list_y + 10, "DOCUMENTOS");

        // Lista de documentos vinculados a proposta
        for (var i = 0; i < array_length(proposal.documents); i++) {

            var doc_id = proposal.documents[i];
            var doc_index = -1;

            for (var j = 0; j < array_length(global.documents); j++) {
                if (global.documents[j].id == doc_id) {
                    doc_index = j;
                    break;
                }
            }

            if (doc_index >= 0) {

                var doc = global.documents[doc_index];

                var item_y = list_y + 40 + i * 48;

                if (selected_document_id == doc.id) {
                    draw_set_color(make_color_rgb(35, 100, 90));
                } else {
                    draw_set_color(make_color_rgb(25, 40, 48));
                }

                draw_rectangle(
                    list_x + 8,
                    item_y,
                    list_x + list_w - 8,
                    item_y + 40,
                    false
                );

                draw_set_color(c_white);
                draw_text(
                    list_x + 15,
                    item_y + 6,
                    doc.id
                );

                draw_set_color(make_color_rgb(180, 195, 200));
                draw_text(
                    list_x + 15,
                    item_y + 22,
                    string_copy(doc.title, 1, 24)
                );
            }
        }

        // Painel de leitura
        draw_set_color(make_color_rgb(20, 35, 42));
        draw_rectangle(
            content_x,
            content_y,
            content_x + content_w,
            dy2 - 55,
            false
        );

        var selected_doc_found = false;

        for (var k = 0; k < array_length(global.documents); k++) {

            var current_doc = global.documents[k];

            if (current_doc.id == selected_document_id) {

                // Confirma que o documento pertence a proposta atual
                for (var m = 0; m < array_length(proposal.documents); m++) {

                    if (proposal.documents[m] == current_doc.id) {

                        selected_doc_found = true;

                        draw_set_color(make_color_rgb(80, 235, 230));
                        draw_text(
                            content_x + 15,
                            content_y + 12,
                            current_doc.type
                        );

                        draw_set_color(c_white);
                        draw_text(
                            content_x + 15,
                            content_y + 38,
                            current_doc.title
                        );

                       // =====================================
// CONTEUDO DO DOCUMENTO
// =====================================

draw_set_color(make_color_rgb(210, 220, 220));

var text_x = content_x + 15;
var text_y = content_y + 72;
var text_w = content_w - 30;
var text_bottom = dy2 - 58;
var line_height = 22;

var wrapped_text = string_split(
    string_replace_all(current_doc.content, "\r\n", "\n"),
    "\n"
);

var draw_y = text_y - document_scroll;

for (var line = 0; line < array_length(wrapped_text); line++) {

    var paragraph = wrapped_text[line];

    if (paragraph == "") {
        draw_y += line_height;
        continue;
    }

    var words = string_split(paragraph, " ");
    var current_line = "";

    for (var word_index = 0; word_index < array_length(words); word_index++) {

        var test_line = current_line;

        if (test_line != "") {
            test_line += " ";
        }

        test_line += words[word_index];

        if (string_width(test_line) > text_w && current_line != "") {

            if (
    draw_y >= text_y &&
    draw_y + line_height <= text_bottom
) {
    draw_text(text_x, draw_y, current_line);
}

            draw_y += line_height;
            current_line = words[word_index];

        } else {
            current_line = test_line;
        }
    }

    if (current_line != "") {

        if (
    draw_y >= text_y &&
    draw_y + line_height <= text_bottom
) {
    draw_text(text_x, draw_y, current_line);
}

        draw_y += line_height;
    }
}

                        break;
                    }
                }

                break;
            }
        }

        if (!selected_doc_found) {

            draw_set_color(make_color_rgb(180, 195, 200));
            draw_text(
                content_x + 15,
                content_y + 15,
                "Selecione um documento na lista para ler."
            );
        }
    }

    // Botao voltar
    draw_set_color(make_color_rgb(60, 100, 145));
    draw_rectangle(dx2 - 115, dy2 - 42, dx2 - 15, dy2 - 12, false);

    draw_set_color(c_white);
    draw_text(dx2 - 92, dy2 - 34, "VOLTAR");
}

// =====================================
// NOTIFICACAO TEMPORARIA
// =====================================

if (nexus_notification_timer > 0) {

    var notif_w = 330;
    var notif_h = 48;

    var notif_x = gw - notif_w - 18;
    var notif_y = gh - 95;

    draw_set_alpha(0.95);

    draw_set_color(make_color_rgb(20, 35, 45));

    draw_rectangle(
        notif_x,
        notif_y,
        notif_x + notif_w,
        notif_y + notif_h,
        false
    );

    draw_set_color(make_color_rgb(80, 235, 230));

    draw_rectangle(
        notif_x,
        notif_y,
        notif_x + 4,
        notif_y + notif_h,
        false
    );

    draw_set_color(c_white);

    draw_text(
        notif_x + 14,
        notif_y + 16,
        nexus_notification
    );
}

// Restaurar cor
draw_set_color(c_white);
draw_set_alpha(1);