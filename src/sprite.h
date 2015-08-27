#pragma once

#include <SDL2/SDL.h>
#include <string>

class Graphics;

class Sprite {
  public:

    Sprite(const std::string& file, int x, int y, int w, int h);

    virtual void draw(Graphics& graphics, int x, int y);

  private:

    std::string file;
    SDL_Rect rect;
};
