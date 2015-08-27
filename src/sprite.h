#pragma once

#include <SDL2/SDL.h>
#include <string>

class Graphics;

class Sprite {
  public:

    Sprite(const std::string& file, unsigned int x, unsigned int y, unsigned int w, unsigned int h);

    virtual void draw(Graphics& graphics, unsigned int x, unsigned int y);

  private:

    std::string file;
    SDL_Rect rect;
};
