if (InputPressed(INPUT_VERB.INVENTORY)) {
  isOpen = !isOpen;
}

if (!isOpen) exit;

inputNavX = InputPressed(INPUT_VERB.RIGHT) - InputPressed(INPUT_VERB.LEFT);
inputNavY = InputPressed(INPUT_VERB.DOWN) - InputPressed(INPUT_VERB.UP);