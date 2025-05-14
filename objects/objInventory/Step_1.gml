if (InputPressed(INPUT_VERB.INVENTORY)) {
  isOpen = !isOpen;
}

if (!isOpen) {
  currentItem = undefined;
  exit;
};