// Screen Class

// Author: David Coelho
// Last Update: 2016-04-18

// Static Variables

int max_num_ctrls = 20;

// Static Methods

void verify_focus(Control[] ctrls, int ctrl_count)
{
  int focused_control = -1;
  
  if (key == '\t')
  {
    for (int i = 0; i < ctrl_count; i++)
    {
      if (ctrls[i].get_control_state(ctrls[i]) == ControlState.focus)
        focused_control = i;
    }
    if (focused_control == -1)
      ctrls[0].set_control_state(ControlState.focus);
    else if (focused_control == ctrl_count - 1)
      ctrls[focused_control].set_control_state(ControlState.normal);
    else
    {
      ctrls[focused_control].set_control_state(ControlState.normal);
      ctrls[focused_control+1].set_control_state(ControlState.focus);
    }
  }
}

// Implementation

class Screen
{
  // Attributes
  
  int ScreenType;
  int focused_control;
  int control_count;
  Control[] controls = new Control[max_num_ctrls];

  // Methods
  
  Screen(int type)
  {
    control_count = 0;
    focused_control = 0;
    ScreenType = type;
  }
  void paint()
  {
    Control[] ctrls = controls;
    int ctrl_count = control_count;
    for (int i = 0; i < ctrl_count; i++)
    {
      ctrls[i].paint();
    }
  }
  void add_control(Control ctrl)
  {
    controls[control_count] = ctrl;
    control_count++;
  }
  void key_event(Application gui_app)
  {
    Control[] ctrls = controls;
    int ctrl_count = control_count;
    
    verify_focus(controls, control_count);
    
    for (int i = 0; i < ctrl_count; i++)
    {
      ctrls[i].key_event(gui_app, ctrls[i]);
    }
  }
  void mouse_event(Application gui_app, MouseEv mouse_event)
  {
    Control[] ctrls = controls;
    int ctrl_count = control_count;
    for (int i = 0; i < ctrl_count; i++)
    {
      ctrls[i].mouse_event(gui_app, mouse_event, ctrls[i]);
    }
  }
  void serial_event(Application gui_app)
  {
    Control[] ctrls = controls;
    int ctrl_count = control_count;
    for (int i = 0; i < ctrl_count; i++)
    {
      ctrls[i].serial_event(gui_app, ctrls[i]);
    }    
  }
  void timer_event(Application gui_app)
  {
    Control[] ctrls = controls;
    int ctrl_count = control_count;
    for (int i = 0; i < ctrl_count; i++)
    {
      ctrls[i].timer_event(gui_app, ctrls[i]);
    }    
  }
}
