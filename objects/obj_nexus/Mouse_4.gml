
/// obj_nexus - Global Left Pressed

// Pega a posicao do mouse na interface
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Dimensoes dos botoes
var by = gh - 85;
var bh = 55;
var bw = 155;

// Botao RECUSAR
if (mx >= 25 && mx <= 25 + bw &&
    my >= by && my <= by + bh)
{
    global.nexus_decision = "recusar";
    show_debug_message("NEXUS: caso recusado.");
}

// Botao ACEITAR
else if (mx >= 195 && mx <= 195 + bw &&
         my >= by && my <= by + bh)
{
    global.nexus_decision = "aceitar";
    show_debug_message("NEXUS: caso aceito.");
}

// Botao DOCUMENTOS
else if (mx >= 365 && mx <= 365 + bw + 20 &&
         my >= by && my <= by + bh)
{
    global.nexus_show_documents = true;
    show_debug_message("NEXUS: abrindo documentos.");
}

// Botao SAIR DO PC
else if (mx >= gw - 180 && mx <= gw - 25 &&
         my >= by && my <= by + bh)
{
    global.nexus_exit_requested = true;
    show_debug_message("NEXUS: solicitando saida do PC.");
}
