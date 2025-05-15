if (!isOpen) exit;

var _mouseX = device_mouse_x_to_gui(0);
var _isMouseXAtGuiRightSide = _mouseX >= display_get_gui_width() / 2;

// Black semi-transparent background
draw_set_alpha(0.7);
draw_set_color(c_black);

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1);

// Draw rectangle & items' icons
for (var _y = 0; _y < inventory.GetGridHeight(); _y++) {
  for (var _x = 0; _x < inventory.GetGridWidth(); _x++) {
    var _gridArea = GetUIItemSlotAreaAt(_x, _y);
    var _isItemSelected = _x == currentGridX && _y == currentGridY;
    var _itemBoxSprite = _isItemSelected ? sprBoxLight : sprBoxDark;
    
    draw_sprite_stretched(_itemBoxSprite, 0, _gridArea.x1, _gridArea.y1, _gridArea.x2 - _gridArea.x1, _gridArea.y2 - _gridArea.y1)

    var _item = inventory.GetItemAt(_x, _y);

    if (is_undefined(_item)) {
      continue;
    }
    
    var _itemIcon = _item.GetIcon();
    var _itemIconX = _gridArea.x1 + ((_gridArea.x2 - _gridArea.x1) / 2) - sprite_get_width(_itemIcon) / 2;
    var _itemIconY = _gridArea.y1 + ((_gridArea.y2 - _gridArea.y1) / 2) - sprite_get_height(_itemIcon) / 2;

    draw_sprite(_itemIcon, 0, _itemIconX, _itemIconY);
  }
}

// Draw selected item name, quantity & description.
for (var _y = 0; _y < inventory.GetGridHeight(); _y++) {
  for (var _x = 0; _x < inventory.GetGridWidth(); _x++) {
    var _gridArea = GetUIItemSlotAreaAt(_x, _y);
    var _isItemSelected = _x == currentGridX && _y == currentGridY;
    var _item = inventory.GetItemAt(_x, _y);

    if (is_undefined(_item) || !_isItemSelected) {
      continue;
    }

    draw_sprite(selectbox_tl, 0, _gridArea.x1 - uiSelectBoxPadding, _gridArea.y1 - uiSelectBoxPadding);
    draw_sprite(selectbox_tr, 0, _gridArea.x2 - uiSelectBoxPadding, _gridArea.y1 - uiSelectBoxPadding);
    draw_sprite(selectbox_bl, 0, _gridArea.x1 - uiSelectBoxPadding, _gridArea.y2 - uiSelectBoxPadding);
    draw_sprite(selectbox_br, 0, _gridArea.x2 - uiSelectBoxPadding, _gridArea.y2 - uiSelectBoxPadding);

    var _itemIcon = _item.GetIcon();
    var _itemName = _item.GetName();
    var _itemDescription = _item.GetDescription();
    var _itemQuantity = _item.GetQuantity();

    var _text = scribble($"[c_white]{_itemName} ({_itemQuantity})\n[c_yellow]{_itemDescription}[/]")
      .padding(uiItemDescriptionTextBorder, uiItemDescriptionTextBorder, uiItemDescriptionTextBorder, uiItemDescriptionTextBorder)
      .wrap(uiItemDescriptionWrapWidth) 
    var _text_bbox = _text.get_bbox();

    var _marginDirection = _isMouseXAtGuiRightSide ? -1 : 1;
    var _itemInfoX = _gridArea.x2 + uiItemDescriptionMarginLeft;
    var _itemInfoY = _gridArea.y1 - (_gridArea.y2 - _gridArea.y1) / 2;

    if (_isMouseXAtGuiRightSide) {
      _itemInfoX = _gridArea.x1 - uiItemDescriptionMarginRight - _text_bbox.right;
    }

    draw_sprite_stretched(sprBoxWhite, 0, _itemInfoX, _itemInfoY, _text_bbox.right, _text_bbox.bottom);

    _text.draw(_itemInfoX, _itemInfoY);
  }
}