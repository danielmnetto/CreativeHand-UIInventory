if (!isOpen) exit;

draw_set_alpha(0.7);
draw_set_color(c_black);

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1);


for (var _i = 0; _i < inventory.GetGridWidth(); _i++) {
  for (var _j = 0; _j < inventory.GetGridHeight(); _j++) {
    var _x1 = uiGridX + ((uiItemSlotWidth + uiGridSeparatorX) * _i);
    var _y1 = uiGridY + ((uiItemSlotHeight + uiGridSeparatorY) * _j);
    var _x2 = uiGridX + uiItemSlotWidth + ((uiItemSlotWidth + uiGridSeparatorX) * _i);
    var _y2 = uiGridY + uiItemSlotHeight + ((uiItemSlotHeight + uiGridSeparatorY) * _j);

    draw_set_color(c_aqua);

    if (_i == currentGridX && _j == currentGridY) {
      draw_set_color(c_yellow);
    }

    draw_rectangle(_x1, _y1, _x2, _y2, false);
  }
}
draw_set_color(-1);