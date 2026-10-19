/// @function scr_crt_mouse_x()
/// @description Converte a coordenada X do mouse para compensar a curvatura CRT.
function scr_crt_mouse_x() {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    if (gw <= 0 || gh <= 0) {
        return mx;
    }

    var px = (mx / gw) * 2.0 - 1.0;
    var py = (my / gh) * 2.0 - 1.0;

    var curvature = 0.035;
    var r2 = px * px + py * py;

    // Aplicar a mesma transformação do shader
    px *= 1.0 + curvature * r2;

    return (px + 1.0) * 0.5 * gw;
}


function scr_crt_mouse_y() {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    if (gw <= 0 || gh <= 0) {
        return my;
    }

    var px = (mx / gw) * 2.0 - 1.0;
    var py = (my / gh) * 2.0 - 1.0;

    var curvature = 0.035;
    var r2 = px * px + py * py;

    // Aplicar a mesma transformação do shader
    py *= 1.0 + curvature * r2;

    return (py + 1.0) * 0.5 * gh;
}