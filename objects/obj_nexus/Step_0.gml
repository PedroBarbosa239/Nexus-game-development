// =====================================
// OBJ_NEXUS - STEP
// =====================================

if (!global.computer_mode) {
    exit;
}
// =====================================
// INICIALIZACAO DO NEXUS
// =====================================

if (nexus_boot_active) {

    nexus_boot_progress += nexus_boot_speed;

    nexus_boot_progress = clamp(
        nexus_boot_progress,
        0,
        1
    );

    // Atualizar mensagens de inicializacao
    if (nexus_boot_progress < 0.25) {
        nexus_boot_message = 0;
    }
    else if (nexus_boot_progress < 0.50) {
        nexus_boot_message = 1;
    }
    else if (nexus_boot_progress < 0.75) {
        nexus_boot_message = 2;
    }
    else {
        nexus_boot_message = 3;
    }

    // Finalizar inicializacao
    if (nexus_boot_progress >= 1) {

        nexus_boot_active = false;

        

        window_alpha = 1;
        window_alpha_target = 1;
        window_fading = false;
    }

    // Enquanto inicializa, impedir interacoes
    exit;
}
// Atualizar fade
if (window_fading) {
    window_alpha = lerp(
        window_alpha,
        window_alpha_target,
        window_alpha_speed
    );

    if (abs(window_alpha_target - window_alpha) < 0.01) {
        window_alpha = window_alpha_target;
        window_fading = false;
    }
}

// Atualizar feedback dos botoes
if (button_feedback_timer > 0) {
    button_feedback_timer--;
}

if (button_feedback_timer <= 0) {
    button_feedback = "";
}

// Atualizar notificacoes
if (nexus_notification_timer > 0) {
    nexus_notification_timer--;
}

if (nexus_notification_timer <= 0) {
    nexus_notification = "";
}

// =====================================
// ANIMACAO DE MINIMIZAR
// =====================================

if (window_minimizing) {

    window_alpha = lerp(
        window_alpha,
        0,
        window_minimize_speed
    );

    if (window_alpha <= 0.05) {

        window_alpha = 0;

        global.pc_screen = "desktop";
        global.pc_app_minimized = true;

        window_minimizing = false;
        window_scale = 1;

        window_fading = false;
    }

    dragging = false;
    hover_button = "";

    exit;
}

// =====================================
// VERIFICAR TELA ATUAL
// =====================================

if (global.pc_screen != "nexus") {
    dragging = false;
    hover_button = "";
    exit;
}

var mx = scr_crt_mouse_x();
var my = scr_crt_mouse_y();

var wx = win_x;
var wy = win_y;
var ww = win_w;
var wh = win_h;

// =====================================
// BOTOES DA BARRA DE TITULO
// =====================================

var close_x1 = wx + ww - 36;
var close_y1 = wy + 7;
var close_x2 = wx + ww - 9;
var close_y2 = wy + 26;

var min_x1 = wx + ww - 66;
var min_y1 = wy + 7;
var min_x2 = wx + ww - 43;
var min_y2 = wy + 26;

// =====================================
// POSICAO DOS BOTOES
// =====================================

var content_x = wx + 10;
var content_y = wy + 42;
var content_w = ww - 20;
var content_h = wh - 54;

var buttons_y = content_y + content_h - 48;
var button_h = 34;
var button_w = 125;
var gap = 10;

var reject_x = content_x + 12;
var accept_x = reject_x + button_w + gap;
var docs_x = accept_x + button_w + gap;

// =====================================
// DETECTAR HOVER
// =====================================

hover_button = "";

if (!documents_open) {

    if (mx >= reject_x && mx <= reject_x + button_w &&
        my >= buttons_y && my <= buttons_y + button_h) {

        hover_button = "reject";
    }
    else if (mx >= accept_x && mx <= accept_x + button_w &&
             my >= buttons_y && my <= buttons_y + button_h) {

        hover_button = "accept";
    }
    else if (mx >= docs_x && mx <= docs_x + button_w &&
             my >= buttons_y && my <= buttons_y + button_h) {

        hover_button = "docs";
    }
}

// =====================================
// MOVIMENTAR JANELA
// =====================================

if (dragging && mouse_check_button(mb_left)) {

    win_x = mx - drag_offset_x;
    win_y = my - drag_offset_y;

    win_x = clamp(
        win_x,
        0,
        max(0, display_get_gui_width() - win_w)
    );

    win_y = clamp(
        win_y,
        0,
        max(0, display_get_gui_height() - 35)
    );
}

if (mouse_check_button_released(mb_left)) {
    dragging = false;
}

// =====================================
// PROCESSAR CLIQUES
// =====================================

if (mouse_check_button_pressed(mb_left)) {

    // FECHAR
    if (mx >= close_x1 && mx <= close_x2 &&
        my >= close_y1 && my <= close_y2) {

        global.pc_screen = "desktop";
        global.pc_app_open = false;
        global.pc_app_minimized = false;

        documents_open = false;
        dragging = false;

        nexus_notification = "NEXUS encerrado.";
        nexus_notification_timer = 90;

        show_debug_message("NEXUS fechado.");

        exit;
    }

    // MINIMIZAR
    if (mx >= min_x1 && mx <= min_x2 &&
        my >= min_y1 && my <= min_y2) {

        if (!window_minimizing) {

          
		    window_minimizing = true;
		    window_alpha = 1;
		    window_scale = 1;

		    window_fading = false;

		    dragging = false;
		    documents_open = false;

		    nexus_notification = "NEXUS minimizando...";
		    nexus_notification_timer = 60;
        }

        exit;
    }

    // =====================================
// DOCUMENTOS ABERTOS
// =====================================

if (documents_open) {

    var dx1 = wx + 65;
    var dy1 = wy + 75;
    var dx2 = wx + ww - 65;
    var dy2 = wy + wh - 65;

    // Botao VOLTAR
    if (
        mx >= dx2 - 115 && mx <= dx2 - 15 &&
        my >= dy2 - 42 && my <= dy2 - 12
    ) {
        documents_open = false;

        button_feedback = "docs";
        button_feedback_timer = 8;

        exit;
    }

    // Obter proposta atual
    var _proposal = scr_get_current_proposal();
// =====================================
// ROLAGEM DO DOCUMENTO
// =====================================


    if (!is_undefined(_proposal)) {

        var _list_x = dx1 + 18;
        var _list_y = dy1 + 78;
        var _list_w = (dx2 - dx1) * 0.34;

        // Verificar clique nos documentos
        for (var i = 0; i < array_length(_proposal.documents); i++) {

            var _doc_id = _proposal.documents[i];

            var _item_y = _list_y + 40 + i * 48;

            if (
                mx >= _list_x + 8 &&
                mx <= _list_x + _list_w - 8 &&
                my >= _item_y &&
                my <= _item_y + 40
            ) {

                // Confirmar que o documento existe
                for (var j = 0; j < array_length(global.documents); j++) {

                    if (global.documents[j].id == _doc_id) {

                        if (selected_document_id != _doc_id) {
    selected_document_id = _doc_id;
    document_scroll = 0;
}

                        show_debug_message(
                            "Documento selecionado: " + _doc_id
                        );

                        break;
                    }
                }

                exit;
            }
        }
    }

    // Impedir que cliques atinjam a janela principal
    exit;
}

    // ABRIR DOCUMENTOS
    if (hover_button == "docs") {

        documents_open = true;

        button_feedback = "docs";
        button_feedback_timer = 8;

        nexus_notification = "Documentos do caso abertos.";
        nexus_notification_timer = 100;

        show_debug_message("Documentos abertos.");

        exit;
    }

  // =====================================
// NEGAR PROPOSTA
// =====================================

if (hover_button == "reject") {

    var _proposal = scr_get_current_proposal();

    // Impedir registro caso não exista proposta para o dia
    if (is_undefined(_proposal)) {
        nexus_notification = "Erro: proposta nao encontrada.";
        nexus_notification_timer = 120;
        exit;
    }

    global.nexus_decision = "recusar";

    // Registrar a decisão e os dados da proposta
    var _decision = {
        day: global.campaign_day,
        time: global.game_minutes,
        proposal_id: _proposal.id,
        proposal_title: _proposal.title,
        area: _proposal.area,
        ai_recommendation: _proposal.ai_recommendation,
        decision: "NEGAR"
    };

    array_push(global.decision_history, _decision);
show_debug_message(
    "Historico: " + string(global.decision_history)
);
    global.decisions_rejected += 1;

    button_feedback = "reject";
    button_feedback_timer = 8;

    nexus_notification = "Proposta recusada: " + _proposal.title;
    nexus_notification_timer = 120;

    show_debug_message(
        "Proposta recusada: " + _proposal.id
    );

    scr_end_day();

    exit;
}

   // =====================================
// APROVAR PROPOSTA
// =====================================

if (hover_button == "accept") {

    var _proposal = scr_get_current_proposal();

    // Impedir registro caso não exista proposta para o dia
    if (is_undefined(_proposal)) {
        nexus_notification = "Erro: proposta nao encontrada.";
        nexus_notification_timer = 120;
        exit;
    }

    global.nexus_decision = "aceitar";

    // Registrar a decisão e os dados da proposta
    var _decision = {
        day: global.campaign_day,
        time: global.game_minutes,
        proposal_id: _proposal.id,
        proposal_title: _proposal.title,
        area: _proposal.area,
        ai_recommendation: _proposal.ai_recommendation,
        decision: "APROVAR"
    };

    array_push(global.decision_history, _decision);
show_debug_message(
    "Historico: " + string(global.decision_history)
);	
    global.decisions_accepted += 1;

    button_feedback = "accept";
    button_feedback_timer = 8;

    nexus_notification = "Proposta aprovada: " + _proposal.title;
    nexus_notification_timer = 120;

    show_debug_message(
        "Proposta aprovada: " + _proposal.id
    );

    scr_end_day();

    exit;
}

    // ARRASTAR PELA BARRA DE TITULO
    if (mx >= wx + 4 && mx <= wx + ww - 70 &&
        my >= wy + 4 && my <= wy + 32) {

        dragging = true;

        drag_offset_x = mx - win_x;
        drag_offset_y = my - win_y;
    }
}