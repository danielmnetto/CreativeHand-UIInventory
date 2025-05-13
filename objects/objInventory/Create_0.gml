isOpen = false;

inventory = InventoryGet();

currentGridX = 0;
currentGridY = 0;
currentItem = undefined;

inputNavX = 0;
inputNavY = 0;

uiGridX = display_get_gui_width() / 4;
uiGridY = display_get_gui_height() / 4;
uiGridSeparatorX = 16;
uiGridSeparatorY = 16;

uiItemSlotWidth = 64;
uiItemSlotHeight = 64;