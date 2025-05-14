if (!isOpen) exit;

draw_set_alpha(0.7);
draw_set_color(c_black);

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1);

for (var _x = 0; _x < inventory.GetGridWidth(); _x++) {
  for (var _y = 0; _y < inventory.GetGridHeight(); _y++) {
    var _gridArea = GetUIItemSlotAreaAt(_x, _y);
    var _item = inventory.GetItemAt(_x, _y);
    var _name = is_undefined(_item) ? "" : $"[{_x},{_y}]\n{_item.GetName()}\n{_item.GetQuantity()}";
    var _nameColor = c_white;

    draw_set_color(c_gray);

    if (_x == currentGridX && _y == currentGridY) {
      draw_set_color(c_yellow);
      _nameColor = c_black;
    }

    draw_rectangle(_gridArea.x1, _gridArea.y1, _gridArea.x2, _gridArea.y2, false);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(_nameColor);

    draw_text(_gridArea.x1 + (_gridArea.x2 - _gridArea.x1) / 2, _gridArea.y1 + (_gridArea.y2 - _gridArea.y1) / 2, _name)

    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_color(-1);
  }
}

draw_set_color(-1);