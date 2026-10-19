if (global.report_open) {
    window_set_cursor(cr_default);
}

// CLIQUE NO BOTÃO VOLTAR AO INÍCIO

if (global.report_open && mouse_check_button_pressed(mb_left)) {

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    var btn_w = 240;
    var btn_h = 48;

    var btn_x = (gw - btn_w) / 2;
    var btn_y = gh - 100;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    if (
        mx >= btn_x &&
        mx <= btn_x + btn_w &&
        my >= btn_y &&
        my <= btn_y + btn_h
    ) {
        scr_restart_campaign();
	//só trocar o nome da room 
        room_goto(rm_menu);
    }
}