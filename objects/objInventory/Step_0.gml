if (!isOpen) exit;

if (inputNavX != 0 || inputNavY != 0) {
  currentGridX = clamp(currentGridX + inputNavX, 0, inventory.GetGridWidth());
  currentGridY = clamp(currentGridY + inputNavY, 0, inventory.GetGridHeight());
}

currentItem = inventory.GetItemAt(currentGridX, currentGridY);

if (InputPressed(INPUT_VERB.ACCEPT) && !is_undefined(currentItem)) {
  currentItem.Use();

  if (currentItem.GetQuantity() == 0) {
    inventory.RemoveItemAt(currentGridX, currentGridY);
  }
}