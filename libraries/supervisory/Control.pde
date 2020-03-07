// Application Class

// Author: David Coelho
// Last Update: 2016-04-18

// Static Variables

Application app_ref;   // Main reference for application
Control control_ref;   // Main reference for control

MouseEv mouse_ref;     // Main reference for which kind of mouse event ocurred
char key_ref;          // Main reference for the last key pressed
int last_time_ref;     // Main reference for the last time hold

int max_handlers = 20; // Maximum number of handlers

// Static Methods

void main_mouse_handler()
{
  if(mouse_ref == MouseEv.move)
  {
    if(control_ref.is_inside(control_ref))
      control_ref.set_control_state(ControlState.focus);
    else
      control_ref.set_control_state(ControlState.normal);
  }
}

// Implementation

abstract class Control
{
  // Attributes
  
  int x = 0, y = 0, w = 0, h = 0;

  int normal_color = 128;
  int focused_color = 80;
  int disabled_color = 180;

  ControlState control_state;

  String[] key_handlers = new String[max_handlers];
  int key_handler_count = 0;
  
  String[] mouse_handlers = new String[max_handlers];
  int mouse_handlers_count = 0;

  String[] serial_handlers = new String[max_handlers];
  int serial_handler_count = 0;
  
  String[] timer_handlers = new String[max_handlers];
  int timer_handler_count = 0;
  
  boolean[] timer_on = new boolean[max_handlers];
  int [] timer_period_ms = new int[max_handlers];
  int [] timer_init = new int[max_handlers];
  
  // Methods
  
  Control(int xpos, int ypos, int wid, int hei)
  {
    x = xpos;
    y = ypos;
    w = wid;
    h = hei;
    control_state = ControlState.normal;
    add_mouse_event("main_mouse_handler");
    
    for (int i = 0; i < max_handlers;  i++)
    {
      timer_on[i] = false;
    }
  }

  abstract void paint();

  void set_control_colors(int norm_color, int focus_color, int dis_color)
  {
    normal_color = norm_color;
    focused_color = focus_color;
    disabled_color = dis_color;
  }
  
  void set_control_state(ControlState ctrl_state)
  {
    control_state = ctrl_state;
  }
  
  ControlState get_control_state(Control self)
  {
    return self.control_state;
  }
  
  boolean is_inside(Control self)
  {
    if ((mouseX >= self.x && mouseX <= self.x + self.w) && (mouseY >= self.y && mouseY <= self.y + self.h))
      return true;
    else
      return false;
  }
  
  void add_key_event(String key_ev)
  {
    key_handlers[key_handler_count] = key_ev;
    key_handler_count++;
  }
  void key_event(Application gui_app, Control self)
  {
    for (int i = 0; i < key_handler_count; i++)
    {
      control_ref = self;
      app_ref = gui_app;
      key_ref = key;
      method(key_handlers[i]);
    } 
     
  }
  
  void add_mouse_event(String mou_ev)
  {
    mouse_handlers[mouse_handlers_count] = mou_ev;
    mouse_handlers_count++;  
  }
  void mouse_event(Application gui_app, MouseEv mouse_event, Control self)
  {
    for (int i = 0; i < mouse_handlers_count; i++)
    {
      control_ref = self;
      app_ref = gui_app;
      mouse_ref = mouse_event;
      method(mouse_handlers[i]);
    }
  }
  
  void add_serial_event(String ser_ev)
  {
    serial_handlers[serial_handler_count] = ser_ev;
    serial_handler_count++; 
  }
  void serial_event(Application gui_app, Control self)
  {
    for (int i = 0; i < serial_handler_count; i++)
    {
      control_ref = self;
      app_ref = gui_app;
      method(serial_handlers[i]);
    }
  }
  
  void add_timer_event(String tim_ev, int period_ms)
  {
    timer_handlers[timer_handler_count] = tim_ev;
    timer_period_ms[timer_handler_count] = period_ms;

    timer_handler_count++;
  }
  void timer_event(Application gui_app, Control self)
  {
    for (int i = 0; i < timer_handler_count; i++)
    {
      if (timer_on[i])
      {
        if (millis() - timer_init[i] >= timer_period_ms[i])
        {
          timer_init[i] = millis();
          control_ref = self;
          app_ref = gui_app;
          method(timer_handlers[i]);
        }
      }
    }
  }
  
  void start_stop_timer(int which_timer, boolean choice)
  {
    timer_init[which_timer] = millis();
    timer_on[which_timer] = choice;
  }

}
