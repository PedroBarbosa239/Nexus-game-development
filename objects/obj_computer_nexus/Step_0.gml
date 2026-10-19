	// obj_nexus_computer - Step
	// Atalho para entrar no computador
if (!global.computer_mode) {
    if (keyboard_check_pressed(ord("P"))) {
        scr_computer_enter();
    }

    exit;
}

// Atalho para sair do computador
if (global.computer_mode && keyboard_check_pressed(vk_escape)) {
    scr_computer_exit();
    exit;
}
	if (!global.pc_active) {
	    exit;
	}

	if (!mouse_check_button_pressed(mb_left)) {
	    exit;
	}

	var mx = scr_crt_mouse_x();
	var my = scr_crt_mouse_y();

	var gh = display_get_gui_height();

	// =====================================
	// ABRIR OU RESTAURAR O NEXUS
	// =====================================

	if (global.pc_screen == "desktop") {

	    // Clique no icone NEXUS
	    if (mx >= 41 && mx <= 89 &&
	        my >= 76 && my <= 124) {

	         global.pc_screen = "nexus";
    global.pc_app_open = true;
    global.pc_app_minimized = false;

    with (obj_nexus) {
        window_minimizing = false;
        window_scale = 1;

        // Sempre iniciar a tela de carregamento
        nexus_boot_active = true;
        nexus_boot_progress = 0;
        nexus_boot_message = 0;

        window_alpha = 1;
        window_alpha_target = 1;
        window_fading = false;
    }

    show_debug_message("NEXUS aberto: inicializando sistema.");
    exit;	
	    }

	  // Restaurar NEXUS pela barra de tarefas
if (global.pc_app_open && mx >= 108 && mx <= 270
&& my >= gh - 30 && my <= gh - 8) {
    
    global.pc_screen = "nexus";
    global.pc_app_minimized = false;

    with (obj_nexus) {
           window_minimizing = false;

		    window_alpha = 0;
		    window_alpha_target = 1;
		    window_fading = true;

		    window_scale = 1;

		    nexus_notification = "NEXUS restaurado.";
		    nexus_notification_timer = 90;
    }

    show_debug_message("NEXUS restaurado.");
    exit;
}
	}