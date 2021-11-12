WhitePiece c[] = new WhitePiece[500];
void setup() {
  size(800, 600);
  noStroke();
  for (int i=0; i<c.length; i++) {
    c[i] = new BlackPiece();
  }
  for (int i=c.length/5; i<c.length; i++) {
    c[i] = new WhitePiece();
  }
}
void draw() {
  background(135, 206, 236);
  //fill(49, 99, 0);
  //rect(0, 400, 800, 200);
  for (int i=0; i<c.length; i++) {
    c[i].show();
    c[i].drift();
  }
}

class WhitePiece {
  double myX, myY, myWidth, myHeight, mySpeedX, myAngle, mySpeedY;
  int myColor, myOpacity;
  WhitePiece() { 
    myX =400;
    myY = 300;
    myAngle = Math.random()*2*Math.PI;
    myWidth = (int)(Math.random()*80)+80;
    myHeight = (int)(Math.random()*40)+20;
    mySpeedX = (int)(Math.random()*3)-1;
    mySpeedY = (int)(Math.random()*4)-1;
    myColor = color ((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    myOpacity = (int)(Math.random()*60)+60;
  }


  void drift() {
    myX+= mySpeedX*Math.cos(myAngle);
    myY+=mySpeedX*Math.sin(myAngle);
    if (myX >900)
      myX = 400;
    if (myY >700)
      myY = 300;
    if (myX <-100)
      myX = 400;
    if (myY <-100)
      myY = 300;


    float changeSpeed = 0;
    if (mousePressed == true) {
      //changeSpeed +=(float)(Math.random()*4+2);
      changeSpeed +=1;
    }
    if (changeSpeed == 1)
      mySpeedX +=1;
    //mySpeedY +=1;
    if (changeSpeed == 2)
      mySpeedX +=1;
    //mySpeedY +=1;
    if (changeSpeed == 3)
      mySpeedX +=1;
    //mySpeedY +=1;
    if (changeSpeed == 4)
      mySpeedX +=1;
    //mySpeedY +=1;
    if (changeSpeed >= 5)
      mySpeedX = 0;
  }

  void show() {
    fill(myColor, myOpacity);
    ellipse((float)myX, (float)myY, (float)myWidth, (float)myHeight);

    //    int diam = 0;
    //float r = 0;
    //noFill();
    //while(diam < 30){
    //  stroke(0,r,0);
    //  ellipse(myX,myY,diam+100, myHeight);
    //  diam++;
    //  r+=255/30.0;
    //}
  }
}
class BlackPiece extends WhitePiece {
  BlackPiece() {
    myX = 400;
    myY = 300;
    myWidth = (int)(Math.random()*80)+50;
    myHeight = (int)(Math.random()*40)+10;
    mySpeedX = (int)(Math.random()*4)-4;
    mySpeedY = (int)(Math.random()*4)-4;
    myColor = (int)(Math.random()*256);
    myOpacity = 255;
  }
}
