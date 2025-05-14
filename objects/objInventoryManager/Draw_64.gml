if (!isOpen) exit;

draw_set_alpha(0.7);
draw_set_color(c_black);

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1);

for (var _x = 0; _x < inventory.GetGridWidth(); _x++) {
  for (var _y = 0; _y < inventory.GetGridHeight(); _y++) {
    var _gridArea = GetUIItemSlotAreaAt(_x, _y);

    draw_set_color(c_gray);
    draw_rectangle(_gridArea.x1, _gridArea.y1, _gridArea.x2, _gridArea.y2, false);

    if (_x == currentGridX && _y == currentGridY) {
      draw_sprite(selectbox_tl, 0, _gridArea.x1 - uiSelectBoxPadding, _gridArea.y1 - uiSelectBoxPadding);
      draw_sprite(selectbox_tr, 0, _gridArea.x2 - uiSelectBoxPadding, _gridArea.y1 - uiSelectBoxPadding);
      draw_sprite(selectbox_bl, 0, _gridArea.x1 - uiSelectBoxPadding, _gridArea.y2 - uiSelectBoxPadding);
      draw_sprite(selectbox_br, 0, _gridArea.x2 - uiSelectBoxPadding, _gridArea.y2 - uiSelectBoxPadding);
    }

    var _item = inventory.GetItemAt(_x, _y);

    if (is_undefined(_item)) {
      continue;
    }
    
    var _itemIcon = _item.GetIcon();
    var _itemIconX = _gridArea.x1 + ((_gridArea.x2 - _gridArea.x1) / 2) - sprite_get_width(_itemIcon) / 2;
    var _itemIconY = _gridArea.y1 + ((_gridArea.y2 - _gridArea.y1) / 2) - sprite_get_height(_itemIcon) / 2;

    draw_sprite(_itemIcon, 0, _itemIconX, _itemIconY);

    var _itemName = _item.GetName();

    
  }
}

draw_set_color(-1);