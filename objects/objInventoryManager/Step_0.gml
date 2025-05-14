if (keyboard_check_pressed(vk_f5)) {
  GameReload();
}

if (!isOpen) exit;

var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

currentGridX = -1;
currentGridY = -1;
currentItem = undefined;

for (var _x = 0; _x < inventory.GetGridWidth(); _x++) {
  for (var _y = 0; _y < inventory.GetGridHeight(); _y++) {
    var _gridArea = GetUIItemSlotAreaAt(_x, _y);

    if (_mouseX >= _gridArea.x1 && _mouseY >= _gridArea.y1 && _mouseX <= _gridArea.x2 && _mouseY <= _gridArea.y2) {
      currentGridX = _x;
      currentGridY = _y;
      currentItem = inventory.GetItemAt(currentGridX, currentGridY);
      break;
    }
  }
}

if (mouse_check_button_pressed(mb_left) && !is_undefined(currentItem)) {
  currentItem.Use();

  if (currentItem.GetQuantity() == 0) {
    inventory.RemoveItemAt(currentGridX, currentGridY);
  }
}