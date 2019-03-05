# Class Template Generator

Bash script to create a simple C++ template class with its respective constructor, getters, and setters.

## Usage

To use this script, you need to provide arguments to it via the cli. 

### Positional arguments in order:
* The first argument represents the class name. You don't need to provide the extension, it will be written as a .h file.
* The next arguments will represent the type and name of the attribute, respectively. 

`$ ./createClass.sh <class_name> <type> <name> ...`

## Example

Suppose you want to create a class called Person, with an int attribute for age and a string attribute for name. You need to run the script like this:

`$ ./createClass.sh Person int age string name`

Which will produce the following output in the file Person.h:

    #ifndef Person_h
    #define Person_h
    #include <iostream>
    using namespace std;
 
    // Class definition 
    class Person {
 
    // Private attributes 
        private: 
            int age;
            string name;
 
    // Public methods 
        public: 
    // Constructor 
          Person::Person(); 
    //Getters 
          int get_age(); 
          string get_name(); 
    //Setters 
          void set_age(int); 
          void set_name(string); 
    // ToString Method 
          void toString(); 
    }; 
     
     // Constructor initializes attributes to 0 by default 
     Person::Person() {
        age= 0; 
        name= 0;
    }
    
    // Getters 
    int Person::get_age() { return age; }
    string Person::get_name() { return name; }
 
    //Setters 
    void Person::set_age(int new_age) { age= new_age; }
    void Person::set_name(string new_name) { name= new_name; }
  
    //ToString 
    void Person::toString() {
      cout << "age" << age << endl; 
      cout << "name" << name << endl; 
    }
   
    #endif
    

You can have a class with as many attributes as you want, but first write its type and then its name.

**NOTE: if you are using a computer with a non-UNIX environment (like Windows), you might need to do some extra leg work ro run the bash script in case you haven't installed it. Here's a StackOverflow [answer](https://stackoverflow.com/questions/6413377/is-there-a-way-to-run-bash-scripts-on-windows) that can help you.**


## About collaborating
Feel free to collaborate to this project if you'd like to. Any additional feature or code refactoring is welcome. Happy hacking!
### Some ideas
* Developing another script that creates a `main.cpp` file that instantiates the class created.
* Modularizing the code to make it cleaner.
* Adding a destructor to the class.
* Change code notation to camel case.
