isOpen = false;

inventory = InventoryGet();

currentGridX = -1;
currentGridY = -1;
currentItem = undefined;

uiGridX = 10;
uiGridY = 10;
uiGridSeparatorX = 8;
uiGridSeparatorY = 8;

uiSelectBoxPadding = 4;

uiItemSlotWidth = 16;
uiItemSlotHeight = 16;

/// @param {real} _gridX
/// @param {real} _gridY
/// @returns {Struct.UIItemSlotArea}
GetUIItemSlotAreaAt = function(_gridX, _gridY) {
  var _x1 = uiGridX + ((uiItemSlotWidth + uiGridSeparatorX) * _gridX);
  var _y1 = uiGridY + ((uiItemSlotHeight + uiGridSeparatorY) * _gridY);
  var _x2 = uiGridX + uiItemSlotWidth + ((uiItemSlotWidth + uiGridSeparatorX) * _gridX);
  var _y2 = uiGridY + uiItemSlotHeight + ((uiItemSlotHeight + uiGridSeparatorY) * _gridY);

  return new UIItemSlotArea(_x1, _y1, _x2, _y2);
}