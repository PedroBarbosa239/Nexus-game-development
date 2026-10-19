// obj_nexus - Create

// Posicao inicial da janela
win_x = 250;
win_y = 85;

// Dimensoes da janela
win_w = 780;
win_h = 540;

// Estado de movimentacao
dragging = false;
drag_offset_x = 0;
drag_offset_y = 0;

// Restaurar a janela
window_min_w = 620;
window_min_h = 440;

// Estado da janela de documentos
documents_open = false;

depth = 0;

// =====================================
// ANIMACAO DE ABERTURA
// =====================================

window_anim = 1;
window_anim_target = 1;
window_anim_speed = 0.20;

window_anim_x = 0;
window_anim_y = 0;

window_anim_start_x = 0;
window_anim_start_y = 0;

window_animating = false;

// =====================================
// ANIMACAO FADE-IN
// =====================================

window_alpha = 1;
window_alpha_target = 1;
window_alpha_speed = 0.12;
window_fading = false;

// =====================================
// FEEDBACK VISUAL DOS BOTOES
// =====================================

button_feedback = "";
button_feedback_timer = 0;

// =====================================
// NOTIFICACOES
// =====================================

nexus_notification = "";
nexus_notification_timer = 0;

// =====================================
// ESTADO DO MOUSE
// =====================================

hover_button = "";


// =====================================
// ANIMACAO DE MINIMIZAR
// =====================================

window_minimizing = false;
window_minimize_speed = 0.22;

window_original_x = win_x;
window_original_y = win_y;
window_original_w = win_w;
window_original_h = win_h;

window_target_x = 108;
window_target_y = display_get_gui_height() - 30;
window_target_w = 160;
window_target_h = 24;

window_scale = 1;

// =====================================
// INICIALIZACAO DO NEXUS
// =====================================

// Estado da inicializacao
nexus_boot_active = false;

// Progresso da inicializacao
nexus_boot_progress = 0;

// Velocidade da barra de progresso
nexus_boot_speed =0.0111;

// Controle das mensagens
nexus_boot_message = 0;

selected_document_id = "";
document_scroll = 0;