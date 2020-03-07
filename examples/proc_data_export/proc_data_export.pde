// Exporting bytes to a file

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

PrintWriter output1;            // Handler to Write at a file
String filename1 = "data1.csv"; // Name of file to be written 
PrintWriter output2;            // Handler to Write at a file
String filename2 = "data2.txt"; // Name of file to be written 

int data1 = 0;                  // data to be saved at file
int data2 = 0;                  // data to be saved at file
int data3 = 0;                  // data to be saved at file

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(500,500); // size(wid,hei)
  
  // Define Background Color
  background(128);
  
  // Feed Handlers with files
  output1 = createWriter(filename1);
  output2 = createWriter(filename2);
  
  // Print information to .csv file (needed)
  output1.println("sep=,");  // to indicate how the data will be separeted
  
  // Execute draw just once
  noLoop();
}

// Main Loop (repeats indefinitely)
void draw()
{
  for (int i = 0; i < 10; i++)
  {
    // update data
    data1 = data1 + i;
    data2 = data2 + 2*i;
    data3 = data3 + 3*i;
    
    // send data to file
    output1.println(data1 + "," + data2 + "," + data3);
    output2.println(data1 + "," + data2 + "," + data3);
  }
  
  // Write remaining data to file (if exists)
  output1.flush();
  output2.flush();
  
  // Finish files
  output1.close();
  output2.close();
  
  // Close canvas
  exit();
}
