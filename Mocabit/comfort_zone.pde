class Comfort
{
  float x1, y1, x2, y2, x3, y3, x4, y4;
  int t1 = 255;
  int t2,t3 = 0;
  PImage img1, img2, img3, img4, img5, img_dark1, img_dark2, img_dark3, img_dark4, img_dark5;
  Comfort()
  {
  }

  void update(float ux1, float uy1, float ux2, float uy2, float ux3, float uy3, float ux4, float uy4)
  {
    x1 = ux1;
    x2 = ux2;
    x3 = ux3;
    x4 = ux4;
    y1 = uy1;
    y2 = uy2;
    y3 = uy3;
    y4 = uy4;
  }

  void create()
  {
    img1 = loadImage("image/player_1_1001.png");
    img2 = loadImage("image/player_2_1001.png");
    img3 = loadImage("image/player_3_1001.png");
    img4 = loadImage("image/player_4_1001.png");
    img5 = loadImage("image/player_5_1001.png");

    img_dark1 = loadImage("image/player_1_dark_1001.png");
    img_dark2 = loadImage("image/player_2_dark_1001.png");
    img_dark3 = loadImage("image/player_3_dark_1001.png");
    img_dark4 = loadImage("image/player_4_dark_1001.png");
    img_dark5 = loadImage("image/player_5_dark_1001.png");
  }

  void init()
  {
    
    tint(255,255,255,t3);
      image(img1, x1-60, y1-35);
      image(img2, x2-60, y2-35);
      image(img3, x3-60, y3-35);
      image(img4, x4-60, y4-35);
      image(img5, mouseX-(width/2)-60, mouseY-(height/2)-35);
      
      // four different type of arrows. we will be using only 2 types.
      
      //image(img_dark1, -50, 270);
      image(img_dark2, 0, 270);
      image(img_dark3, 50, 270);
      image(img_dark4, 100, 270);
      image(img_dark5, 150, 270);
      
      image(img1, -50, 210);
      image(img2, 0, 210);
      image(img3, 50, 210);
      image(img4, 100, 210);
      image(img5, 150, 210);
      if(t3<255)
      {t3++;}
    //Fade between images
    println("x1 "+x1+"; x3 "+x3);
    println("y1 "+y1+"; y3 "+y3);
    if(abs(x1)>abs(x3+2) && abs(x1)< abs(x3-2) && abs(y1)>abs(y3-35) && abs(y1)<abs(y3+35))
    {
      t3 = t2 = 0;
      t1 = 255;
      println("bang");
      tint(255,255,255,t1);
      image(img1, x1-60, y1-35);
      if(t1>0)
      {t1--;}
      tint(255,255,255,255-t1);
      image(img_dark1, x1-60, y1-35);
      tint(255,255,255,t2);
      image(img_dark1, x1-60, y1-35);
      if((t1 == 0) && (t2<255))
      {t2++;}
      //try
      //{    
      //  Thread.sleep(100);
      //}
      //  catch(Exception e){}
    }
    
  }
}