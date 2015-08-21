#include "title_screen.h"

#include "audio.h"
#include "graphics.h"
#include "input.h"

void TitleScreen::init(Graphics& graphics) {
}

bool TitleScreen::update(Input& input, Audio& audio, Graphics& graphics, unsigned int elapsed) {
  if (input.key_pressed(SDLK_ESCAPE)) return false;
  return true;
}

void TitleScreen::draw(Graphics& graphics) {
}
