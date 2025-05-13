global.__inventory = undefined;
global.__inventoryQuantityMax = 20;

function InventoryManager(_gridWidth, _gridHeight) constructor {
  __gridWidth = _gridWidth;
  __gridHeight = _gridHeight;
  __itemSlotsGrid = array_create(__gridWidth, array_create(__gridHeight, undefined));
  
  IsFull = function() {
    var _i = 0;
    
    repeat(array_length(__itemSlotsGrid)) {
      var _itemLine = __itemSlotsGrid[_i];
      var _j = 0;

      repeat(array_length(_itemLine)) {
        var _itemSlot = _itemLine[_j];
        
        if (is_undefined(_itemSlot)) {
          return false;
        }
        _j++;
      }
      _i++;
    }

    return true;
  }
  
  /// @param {Struct.InventoryItem} _item
  /// @returns {Struct.InventoryItem|undefined}
  AddItem = function(_item) {
    var _i = 0;

    repeat(array_length(__itemSlotsGrid)) {
      var _itemLine = __itemSlotsGrid[_i];
      var _j = 0;

      repeat(array_length(_itemLine)) {
        var _itemSlot = _itemLine[_j];
        
        if (is_undefined(_itemSlot)) {
          _itemSlot = _item;

          return _itemSlot;
        }
        _j++;
      }
      _i++;
    }

    return undefined;
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

function InventoryItem(_icon, _name, _quantity) constructor {
  __icon = _icon;
  __name = _name;
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

  /// @param {real} _newQuantity
  SetQuantity = function(_newQuantity) {
    __quantity = clamp(_newQuantity, 0, __maxQuantity);
  }

  /// @param {real} _newMaxQuantity
  SetMaxQuantity = function(_newMaxQuantity) {
    __maxQuantity = max(_newMaxQuantity, 1);
  }
}

function InventoryGet() {
  if (!is_undefined(global.__inventory)) {
    return global.__inventory;
  }

  global.__inventory = new InventoryManager(4, 3);
  global.__inventory.AddItem(new InventoryItem(beetroot_05, "Beetroot", 3));
  global.__inventory.AddItem(new InventoryItem(egg, "Egg", 4));
  global.__inventory.AddItem(new InventoryItem(fish, "Fish", 8));
  global.__inventory.AddItem(new InventoryItem(milk, "Milk", 1));

  return global.__inventory;
}