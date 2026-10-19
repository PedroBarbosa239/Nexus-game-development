// obj_nexus_computer - Draw GUI
if (!global.computer_mode) {
    exit;
}
if (!global.pc_active) {
    exit;
}

var gw = display_get_gui_width();
var gh = display_get_gui_height();


// ==========================================
// PAPEL DE PAREDE - WINDOWS XP
// ==========================================

draw_sprite_stretched(
    spr_wallpaper_xp,
    0,
    0,
    0,
    gw,
    gh
);


// ==========================================
// ICONE DO NEXUS - SEMPRE VISIVEL
// ==========================================

var ix = 45;
var iy = 80;

// Sombra
draw_set_color(make_color_rgb(25, 65, 100));
draw_rectangle(ix - 4, iy - 4, ix + 48, iy + 44, false);

// Monitor
draw_set_color(make_color_rgb(190, 205, 215));
draw_rectangle(ix, iy, ix + 40, iy + 32, false);

// Tela
draw_set_color(make_color_rgb(30, 80, 145));
draw_rectangle(ix + 4, iy + 4, ix + 36, iy + 27, false);

// Letra N
draw_set_color(c_white);
draw_text(ix + 16, iy + 8, "N");

// Nome do aplicativo
draw_text(ix - 2, iy + 38, "NEXUS");


// ==========================================
// BARRA DE TAREFAS - WINDOWS XP
// ==========================================

var taskbar_y = gh - 32;

// Barra azul
draw_set_color(make_color_rgb(35, 90, 190));
draw_rectangle(0, taskbar_y, gw, gh, false);

// Brilho superior
draw_set_color(make_color_rgb(100, 165, 245));
draw_rectangle(0, taskbar_y, gw, taskbar_y + 3, false);

// Botao INICIAR
draw_set_color(make_color_rgb(45, 145, 55));
draw_rectangle(4, taskbar_y + 4, 94, gh - 3, false);

// Brilho do botao
draw_set_color(make_color_rgb(105, 205, 80));
draw_rectangle(4, taskbar_y + 4, 94, taskbar_y + 8, false);

// Texto START
draw_set_color(c_white);
draw_text(15, taskbar_y + 10, "START");



// ==========================================
// BOTAO DO NEXUS NA BARRA DE TAREFAS
// ==========================================

if (global.pc_app_open) {

    draw_set_color(make_color_rgb(45, 105, 185));
    draw_rectangle(100, taskbar_y + 4, 270, gh - 3, false);

    draw_set_color(c_white);

    if (global.pc_app_minimized) {
        draw_text(112, taskbar_y + 10, "NEXUS");
    }
    else {
        draw_text(112, taskbar_y + 10, "NEXUS - Caso 001");
    }
}

// ==========================================
// RELOGIO DO JOGO
// ==========================================
var minutos_totais = floor(global.game_minutes);

var hora = floor(minutos_totais / 60);
var minuto = minutos_totais mod 60;

var texto_hora = string(hora);
var texto_minuto = string(minuto);

if (hora < 10) {
    texto_hora = "0" + texto_hora;
}

if (minuto < 10) {
    texto_minuto = "0" + texto_minuto;
}

draw_set_color(c_white);
draw_text(
    gw - 70,
    taskbar_y + 10,
    texto_hora + ":" + texto_minuto
);

// ==========================================
// RESTAURAR CONFIGURACOES DE DESENHO
// ==========================================

draw_set_alpha(1);
draw_set_color(c_white);