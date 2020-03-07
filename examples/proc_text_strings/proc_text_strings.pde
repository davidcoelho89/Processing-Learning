// Strings Handling 

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

char[] text1 = {'H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd'};
String text2 = "Hello World";
int x = 10;

String phrase_string1 = "string with more than one word";
String phrase_string2 = "hats & apples, cars + phones % elephants dog.";
String numbers_string = "8,67,5,309";
String[] array_of_strings = {"It", "was", "a", "dark", "and", "stormy", "night."};

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(500,500); // size(wid,hei)
  
  // Define Background Color
  background(128);
  
  // draw() is done only once
  noLoop();
}

// Main Loop (repeats indefinitely)
void draw()
{
  // New string with more than 1 variable
  String text3 = "The value of x is: " + x;
  println(text3);
  
  // Base string 1. A string is immutable!
  String alphabet = "ABcdefghi";
  println(alphabet);
  
  // Get String Length
  int string_length = alphabet.length();
  println(string_length);
  
  // Search the first occurence of a sequence of characters inside string
  int index = alphabet.indexOf("def");
  println(index);
  
  // Gets a substring from original string
  String sub = alphabet.substring(4,7);
  println(sub);
  
  // Gets the char at a specific position
  char c = alphabet.charAt(3);
  println(c);
  
  // Puts all string at upper case
  String uppercase = alphabet.toUpperCase();
  println(uppercase);
  
  // Pust all string at lower case
  String lowercase = alphabet.toLowerCase(); 
  println(lowercase);
  
  // Copy a string value to a new string
  String alphabet2 = new String(lowercase);
  println(alphabet2);
  
  // Compares two strings
  println(alphabet2 == lowercase);       // wrong way
  println(alphabet2.equals(lowercase));  // correct way
  
  // Jump a line
  println();
  
  // Split a bigger string into an array of strings (wt just one token)
  String[] strings_list1 = split(phrase_string1, " ");
  for (int i = 0; i < strings_list1.length; i++)
    println(i + " " + strings_list1[i]);
  
  // Jump a line
  println();

  // Split a bigger string into an array of strings (wt more than one token)
  String[] strings_list2 = splitTokens(phrase_string2, " &,+.");
  for (int i = 0; i < strings_list2.length; i++)
    println(i + " " + strings_list2[i]);

  // Jump a line
  println();
  
  // Split a string of int numbers
  int[] numbers_list = int(split(numbers_string, ',')); 
  for (int i = 0; i < numbers_list.length; i++)
    println(i + " " + numbers_list[i]);
  
  // Jump a line
  println();
  
  // Manual Concatenation
  String onelongstring1 = "";
  for (int i = 0; i < array_of_strings.length; i++)
    onelongstring1 = onelongstring1 + array_of_strings[i] + " ";
  println(onelongstring1);

  // Using Processing's join()
  String onelongstring2 = join(array_of_strings," ");
  println(onelongstring2);
  
  // close canvas
  exit();
}
