if (!isOpen) exit;

draw_set_alpha(0.7);
draw_set_color(c_black);

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1);

for (var _x = 0; _x < inventory.GetGridWidth(); _x++) {
  for (var _y = 0; _y < inventory.GetGridHeight(); _y++) {
    var _gridArea = GetUIItemSlotAreaAt(_x, _y);

    draw_set_color(c_aqua);

    if (_x == currentGridX && _y == currentGridY) {
      draw_set_color(c_yellow);
    }

    draw_rectangle(_gridArea.x1, _gridArea.y1, _gridArea.x2, _gridArea.y2, false);
  }
}

draw_set_color(-1);