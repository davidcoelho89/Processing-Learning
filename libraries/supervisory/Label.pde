// Label Class

// Author: David Coelho
// Last Update: 2016-04-18

// Static Variables

// Static Methods

// Implementation

class Label extends Control
{
  String label_text;
  int t_size;
  
  Label(int xpos, int ypos, int wid, int hei, String text_input, int text_size){
    super(xpos,ypos,wid,hei);
    label_text = text_input;
    t_size = text_size;
  }

  void paint(){
    // just paint if it is not hidden
    if (control_state != ControlState.hidden){
      fill(255); stroke(255); // white fill and border
      rect(x, y, w, h, 3);
      fill(0); // black letter
      textAlign(CENTER,CENTER);
      textSize(t_size);
      text(label_text,x,y,w,h);
    }
  }

  void set_text(String text_input)
  {
    label_text = text_input;
  }

}
