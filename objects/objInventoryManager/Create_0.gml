isOpen = false;

inventory = InventoryGet();

currentGridX = -1;
currentGridY = -1;
currentItem = undefined;

uiGridX = display_get_gui_width() / 4;
uiGridY = display_get_gui_height() / 4;
uiGridSeparatorX = 8;
uiGridSeparatorY = 8;

uiItemSlotWidth = 24;
uiItemSlotHeight = 24;

uiSelectBoxPadding = 4;

uiItemDescriptionMarginLeft = 6;
uiItemDescriptionTextBorder = 8;
uiItemDescriptionWrapWidth = 160;
uiItemDescriptionShadowColor = c_black;
uiItemDescriptionShadowAlpha = 0.6;
uiItemDescriptionShadowXOffset = 4;
uiItemDescriptionShadowYOffset = 4;

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

scribble_font_set_default("fnt_game");