// Application Class

// Author: David Coelho
// Last Update: 2016-04-18

// Static Variables

int max_num_screens = 20;

// Static Methods

// Implementation

class Application
{
  // Attributes
  
  int current_screen;
  Screen[] screens = new Screen[max_num_screens];
  int screens_count = 0;  
  
  // Methods
  
  Application()
  {
    screens_count = 0;
    current_screen = 0;
  }
  void paint()
  {
    if (screens_count > 0)
    {
      Screen screen = screens[current_screen];
      screen.paint();
    }
  }
  void add_screen(Screen screen)
  {
    screens[screens_count] = screen;
    screens_count++;
  }
  void set_current_screen(int screen)
  {
    current_screen = screen;
  }
  Screen get_current_screen()
  {
    return screens[current_screen];
  }
  void key_event(Application gui_app)
  {
    Screen screen = screens[current_screen];
    screen.key_event(gui_app);
  }
  void mouse_event(Application gui_app, MouseEv mouse_event)
  {
    Screen screen = screens[current_screen];
    screen.mouse_event(gui_app, mouse_event);
  }
  void serial_event(Application gui_app)
  {
    Screen screen = screens[current_screen];
    screen.serial_event(gui_app);
  }
  void timer_event(Application gui_app)
  {
    Screen screen = screens[current_screen];
    screen.timer_event(gui_app);
  }

}

