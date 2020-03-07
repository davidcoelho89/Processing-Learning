// Button Class

// Author: David Coelho
// Last Update: 2016-04-18

// Static Variables

// Static Methods

// Implementation

class Button extends Control
{
  String label_text = null;
  int t_size;
  
  Button(int xpos, int ypos, int wid, int hei)
  {
    super(xpos,ypos,wid,hei);
  }
  
  void paint()
  {
    // black border
    stroke(0);
    // Set fill
    if (control_state == ControlState.normal){
      fill(normal_color);
    }
    else if (control_state == ControlState.focus){
      fill(focused_color);
    }
    else if (control_state == ControlState.focus){
      fill(disabled_color);
    }
    // just paint if it is not hidden
    if (control_state != ControlState.hidden){
      rect(x, y, w, h, 3);
      if(label_text != null){
        fill(0); // black letter
        textAlign(CENTER,CENTER);
        textSize(t_size);
        text(label_text,x,y,w,h);
      }
    }
  }
  
  void set_text(String text_input, int text_size){
    label_text = text_input;
    t_size = text_size;
  }
  
}
