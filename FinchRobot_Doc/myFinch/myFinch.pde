// Import the Finch Robot Library 
import edu.cmu.ri.createlab.terk.robot.finch.*;

Finch myFinch = new Finch(); //Create a Global Finch Object. 

//Note : All the operations on the Finch are execute using the Finch Robot Object.

PFont font;

void setup() 
  {
    size(05, 05); // Needs a default size so initializing to the minimum possible.

    myFinch.showAccelerometerGraph(); // Opening the Accelerometer Graph 
    
    myFinch.buzz(300, 2000); //Indicating the readiness of the Finch with a Buzz sound on the onboard buzzer.
  }
  

void draw() 
  {
    double xAccel = myFinch.getXAcceleration(); // Acceleration along X
    double yAccel = myFinch.getYAcceleration(); // Acceleration along Y 
    double zAccel = myFinch.getZAcceleration(); // Acceleration along Z
  
    myFinch.updateAccelerometerGraph(xAccel, yAccel,zAccel); // Update the value of the Graph
    
    keyPressed(); //Decode the Key pressed and Take Appropriate Action
  
    fill (255, 0, 0);
    ellipse(100,100,200,200);
  
    fill(0,255,0);
    ellipse(300,100, 200,200);
  
    fill (0, 0, 255);
    ellipse(100, 300, 200,200);
  
    fill (255,255,0);
    ellipse(300, 300, 200,200);
  
    fill (255,255,255);
    ellipse(200,200,100,100);
  
    font = loadFont("ComicSansMS-Bold-60.vlw");
    textFont(font,25);
  
    fill(0,0,0,255);
    text("Front",275,300);
    text("Back",75,100);
    text("Left",75,300);
    text("Right",275,100);
    text("Stop",175,200);
    
    if(mouseX > 220 && mouseY >220)
    {
      myFinch.setLED(200,200,0);
    }
    else if(mouseX <= 180 && mouseY >220)
    {
      myFinch.setLED(0,0,200);
    }
    else if(mouseX > 220 && mouseY <= 180)
    {
      myFinch.setLED(0,200,0);
    }
    else if(mouseX < 180 && mouseY < 180)
    {
      myFinch.setLED(200,0,0);
    }
    else 
    {
      myFinch.setLED(200,200,200);
    }
  } 
  
  
void stop()
 {
   myFinch.closeAccelerometerGraph();
   myFinch.quit();
 }

void keyPressed()
  { 
    if(key == CODED)
    {
      if(keyCode == UP)
      {
        moveFinchForward();
      }
      else if (keyCode == RIGHT)
      {
        moveFinchRight();
      }  
      else if (keyCode == DOWN)
      {
        moveFinchBackward();
      }
      else if(keyCode== LEFT)
      {
        moveFinchLeft();
      }
      else if(keyCode== SHIFT)
      {
        FinchStop();
      }
      else if (keyCode == CONTROL)
      {
        int leftWheel  = (2*255 /400 * mouseX)-235;
        int rightWheel = (2*255 /400 * mouseY)-235;
  
        myFinch.setWheelVelocities(leftWheel,rightWheel);
      }
      else
      {
        for (int i=1;i<4;i++)
        {
          rotateFinch(i); 
        }
      }
    }
  }

void moveFinchForward() 
// Function to move the Finch in the Foward Direction
 {
   int leftWheel = 255;
   int rightWheel = 255;
   myFinch.setWheelVelocities(leftWheel,rightWheel);
 }

void moveFinchBackward()
// Function to move the Finch in the Backward Direction
 {
   int leftWheel= -255;
   int rightWheel = -255;
   myFinch.setWheelVelocities(leftWheel,rightWheel);
 }

void moveFinchRight()
// Function to move the Finch in the Right Direction
 {
    int leftWheel= 155;
    int rightWheel = -155;
    myFinch.setWheelVelocities(leftWheel,rightWheel);
 }
 
void moveFinchLeft()
// Function to move the Finch in the Left Direction
 {
    int leftWheel= -155;
    int rightWheel = 155;
    myFinch.setWheelVelocities(leftWheel,rightWheel);
 }
 
void FinchStop()
//Function to Stop the Finch
 {
    int leftWheel = 0;
    int rightWheel = 0;
    myFinch.setWheelVelocities(leftWheel,rightWheel); 
 }
 
void rotateFinch( int i)
//Function to rotate the Finch based on User input 
// Example : rotateFinch(1) would rotate it 90 degree 

 {
   int time;
   int leftWheel= 255;
   int rightWheel = -255;
   
   if (i == 1)
   {
     time = 1750/4;  //90 degree 
   }
   else if (i ==2)
   {
     time = 1750/2; //180 degree
   }
   else
   {
     time = 1750; //360 degree 
   }
   
   myFinch.setWheelVelocities(leftWheel,rightWheel,time);
   delay(1000);
   return; 
  
 }
 

