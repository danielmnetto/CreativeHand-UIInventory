global.__inventory = undefined;
global.__inventoryQuantityMax = 20;

function InventoryManager(_gridWidth, _gridHeight) constructor {
  __gridWidth = _gridWidth;
  __gridHeight = _gridHeight;
  __itemSlotsGrid = array_create(__gridWidth, array_create(__gridHeight, undefined));
  
  IsFull = function() {
    for(var _y = 0; _y < __gridHeight; _y++) {
      for(var _x = 0; _x < __gridWidth; _x++) {
        var _itemSlot = __itemSlotsGrid[_x][_y];

        if (is_undefined(_itemSlot)) {
          return false;
        }
      }
    }

    return true;
  }
  
  /// @param {Struct.InventoryItem} _item
  /// @returns {Struct.InventoryItem|real} The added item or -1 if it was not possible to add it.
  AddItem = function(_item) {
    for(var _y = 0; _y < __gridHeight; _y++) {
      for(var _x = 0; _x < __gridWidth; _x++) {
        var _itemSlot = __itemSlotsGrid[_x][_y];

        if (is_undefined(_itemSlot)) {
          __itemSlotsGrid[_x][_y] = _item;
          return _item;
        }
      }
    }

    return -1;
  }

  /// @param {real} _gridX
  /// @param {real} _gridY
  RemoveItemAt = function(_gridX, _gridY) {
    __itemSlotsGrid[_gridX][_gridY] = undefined;
  }

  /// @param {real} _gridX
  /// @param {real} _gridY
  /// @returns {Struct.InventoryItem|undefined}
  GetItemAt = function(_gridX, _gridY) {
    var _item = __itemSlotsGrid[_gridX][_gridY];

    return _item;
  }

  /// @returns {real}
  GetGridWidth = function() {
    return __gridWidth;
  }

  /// @returns {real}
  GetGridHeight = function() {
    return __gridHeight;
  }
}

/// @param {Asset.GMSprite} _icon
/// @param {string} _name
/// @param {real} _quantity
/// @param {string} _description
function InventoryItem(_icon, _name, _quantity, _description = "") constructor {
  __icon = _icon;
  __name = _name;
  __description = _description;
  __maxQuantity = global.__inventoryQuantityMax;
  __quantity = clamp(_quantity, 1, __maxQuantity);

  Use = function() {
    var _newQuantity = GetQuantity() - 1;
    show_debug_message($"Item {__name} was used! New quantity is {_newQuantity}.");
    SetQuantity(_newQuantity);
  }

  /// @returns {Asset.GMSprite}
  GetIcon = function() {
    return __icon;
  }

  /// @returns {string}
  GetName = function() {
    return __name;
  }

  /// @returns {string}
  GetDescription = function() {
    return __description;
  }

  /// @returns {real}
  GetQuantity = function() {
    return __quantity;
  }

  /// @returns {real}
  GetMaxQuantity = function() {
    return __maxQuantity;
  }

  /// @param {Asset.GMSprite} _newIcon
  SetIcon = function(_newIcon) {
    __icon = _newIcon;
  }

  /// @param {string} _newName
  SetName = function(_newName) {
    __name = _newName;
  }

  /// @param {string} _newDescription
  SetDescription = function(_newDescription) {
    __description = _newDescription;
  }

  /// @param {real} _newQuantity
  SetQuantity = function(_newQuantity) {
    __quantity = clamp(_newQuantity, 0, __maxQuantity);
  }

  /// @param {real} _newMaxQuantity
  SetMaxQuantity = function(_newMaxQuantity) {
    __maxQuantity = max(_newMaxQuantity, 1);
  }
}

/// @desc This constructor is used to define a rectangle area for item slots at GUI.
/// @param {real} _x1
/// @param {real} _y1
/// @param {real} _x2
/// @param {real} _y2
function UIItemSlotArea(_x1, _y1, _x2, _y2) constructor {
  x1 = _x1;
  y1 = _y1;
  x2 = _x2;
  y2 = _y2;
}

/// @returns {Struct.InventoryManager}
function InventoryGet() {
  if (!is_undefined(global.__inventory)) {
    return global.__inventory;
  }

  global.__inventory = new InventoryManager(4, 3);
  global.__inventory.AddItem(new InventoryItem(beetroot_05, "Beetroot", 3, "You can make a juice with it."));
  global.__inventory.AddItem(new InventoryItem(egg, "Egg", 4, "Is this the one that came first?"));
  global.__inventory.AddItem(new InventoryItem(fish, "Fish", 8, "Such a aquatic creature."));
  global.__inventory.AddItem(new InventoryItem(milk, "Milk", 1, "Don't forget to boil it up before drink it."));
  global.__inventory.AddItem(new InventoryItem(pumpkin_05, "Pumpkin", 2, "Perfect to bake a delicious pie."));
  global.__inventory.AddItem(new InventoryItem(sunflower_05, "Sunflower", 3, "Always looking at the sun."));
  global.__inventory.AddItem(new InventoryItem(wheat_05, "Wheat", 8, "The first step to make bread."));
  global.__inventory.AddItem(new InventoryItem(radish_05, "Radish", 1, "Another color for your salad."));

  return global.__inventory;
}