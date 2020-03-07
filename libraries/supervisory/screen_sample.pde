// Screen Sample class

// Author: David Coelho
// Last Update: 2016-04-18

// Static Variables / Controls

int Potent1;

Label label_sample;
Button button_sample;
Graphic graphic_sample;
ProgressBar pb_sample;
ScrollBar sb_sample;

// Handlers

void graphic_sample_timer_handler()
{
  // Add protection
  if (conection == true)
  {
    Graphic graphic_ref = (Graphic)control_ref;
    Potent1 = values[1];
    graphic_ref.update_value(Potent1);
  }
}

void button_sample_mouse_handler()
{
  if (mouse_ref == MouseEv.click)
  {
    Potent1 = values[1];
    pb_sample.update_value(Potent1);    
  }
}

// Main function

Screen screen_sample(int type)
{
  Screen screen = new Screen(type);
  
  // Label Sample
  label_sample = new Label((width-100)/2,10,100,20,"Label Sample",14);
  screen.add_control(label_sample);
  
  // Button Sample
  button_sample = new Button(270,260,100,30);
  button_sample.set_text("Button Sample",12);
  button_sample.add_mouse_event("button_sample_mouse_handler");
  screen.add_control(button_sample);
  
  // Graphic Sample
  graphic_sample = new Graphic(200,50,250,200,-10,1033);
  graphic_sample.add_timer_event("graphic_sample_timer_handler",20);
  graphic_sample.start_stop_drawning(true);
  graphic_sample.start_stop_timer(0,true);
  screen.add_control(graphic_sample);
  
  // Progress bar Sample
  pb_sample = new ProgressBar(150,50,30,200,0,1023,false);
  pb_sample.update_value(900);
  screen.add_control(pb_sample);
  
  // Scroll Bar Sample
  sb_sample = new ScrollBar(470,50,30,200,false);
  screen.add_control(sb_sample);
  
  return screen;
}

