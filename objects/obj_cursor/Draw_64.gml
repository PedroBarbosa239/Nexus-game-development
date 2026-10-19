// obj_cursor - Draw GUI

if (!global.pc_active) exit;

if (global.report_open) {
    exit;
}


var cursor_x = scr_crt_mouse_x();
var cursor_y = scr_crt_mouse_y();

draw_sprite_ext(
    spr_cursor_xp,
    0,
    cursor_x,
    cursor_y,
    0.15,
    0.15,
    0,
    c_white,
    1
);