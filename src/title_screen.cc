#include "title_screen.h"

#include "audio.h"
#include "graphics.h"
#include "input.h"
#include "text.h"

void TitleScreen::init() {
  text.reset(new Text("text"));
}

bool TitleScreen::update(Input& input, Audio& audio, Graphics& graphics, unsigned int elapsed) {
  return !input.any_pressed();
}

void TitleScreen::draw(Graphics& graphics) {
  text->draw(graphics, "Press any key.", 320, 232, Text::CENTER);
}
