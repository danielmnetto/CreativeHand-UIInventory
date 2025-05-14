function GameReload() {
  with(all) {
    if (object_index == __InputUpdateController) {
      continue;
    }
    instance_destroy();    
  }

  global.__inventory = undefined;
  audio_stop_all();
  draw_texture_flush();
  room_goto(room_first);
}