class UI
{
  Comfort cz = new Comfort();
  Displacement disp = new Displacement();
  PVector[] elements = {};
  float x1, y1, x2, y2, x3, y3, x4, y4, x, y, slope;
  PImage arrow1, arrow2, arrow3, arrow4, arrow5, arrow6, arrow7, arrow8, arrow9, img;
  Table table;
  int i = 0;
  UI()
  {
  }

  void create()
  {
    //table = loadTable("3pt_label_edit.csv", "header");
    table = loadTable("t3_3_label.csv", "header");
    
    arrow1 = loadImage("image/arrow_1_1001.png");
    arrow2 = loadImage("image/arrow_2_1001.png");
    arrow3 = loadImage("image/arrow_3_1001.png");
    arrow4 = loadImage("image/arrow_4_1001.png");   
    arrow5 = loadImage("image/arrow_5_1001.png");
    arrow6 = loadImage("image/arrow_6_1001.png");
    arrow7 = loadImage("image/arrow_7_1001.png");
    arrow8 = loadImage("image/arrow_8_1001.png");   
    arrow9 = loadImage("image/arrow_9_1001.png");
    cz.create();
  }

  void init()
  {
    disp.init();
    translate(width/2, height/2);
    if (i < 4500)
    {
      x1 = (table.getRow(i).getFloat("x1"))*100;
      y1 = (table.getRow(i).getFloat("z1"))*100;
      x2 = (table.getRow(i).getFloat("x2"))*100;
      y2 = (table.getRow(i).getFloat("z2"))*100;
      x3 = (table.getRow(i).getFloat("x3"))*100;
      y3 = (table.getRow(i).getFloat("z3"))*100;
      x4 = (table.getRow(i).getFloat("x4"))*100;
      y4 = (table.getRow(i).getFloat("z4"))*100;
      cz.update(x1,y1,x2,y2,x3,y3,x4,y4);
      disp.update(x1,y1,x2,y2,x3,y3,x4,y4);
      i++; 
     // fill(0);
      stroke(127);
      strokeWeight(2);

      //beginShape();
      //vertex(x1, y1);
      //vertex(x2, y2);
      //vertex(x3, y3);
      //vertex(x4, y4);
      //vertex(mouseX-(width/2), mouseY-(height/2));
      //vertex(-200,100);
      //vertex(x2, y2);
      //vertex(200, -100);
      //vertex(-200, -100);
      //endShape(CLOSE);

      line(x1, y1, x2, y2);
      line(x1, y1, x3, y3);
      line(x1, y1, x4, y4);     
      line(x1, y1, mouseX-(width/2), mouseY-(height/2));

      line(x2, y2, x3, y3);
      line(x2, y2, x4, y4);
      line(x2, y2, mouseX-(width/2), mouseY-(height/2));

      line(x3, y3, x4, y4);
      line(x3, y3, mouseX-(width/2), mouseY-(height/2));
      line(x4, y4, mouseX-(width/2), mouseY-(height/2));

      cz.init();

      image(arrow1, 200, 130);
      image(arrow2, 200, 150);
      image(arrow3, 200, 170);
      image(arrow4, 200, 190);
      image(arrow5, 200, 210);
      image(arrow6, 200, 230);
      image(arrow7, 200, 250);
      image(arrow8, 200, 270);
      image(arrow9, 200, 290);
    } else
    {
      i = 1;
    }
    PVector a = new PVector(x1,y1);
    PVector b = new PVector(x2,y2);
    PVector c = new PVector(a.x+b.x,a.y+b.y);
    if((c.x)>0)
    {
      translate(x2,y2);
    }
    else{translate(x1,y1); line(0,0,c.x,c.y);}
    PVector temp = new PVector();
    elements = (PVector[]) append(elements, c);
    for(PVector p: elements)
    {
     temp = p;
    }
    println(x1+" "+ y1);
    float alpha = map(temp.x, 0, width, 0, TWO_PI);
    float beta = map(temp.y, 0, height, 0, TWO_PI);
    float theta = (alpha) - (beta);
    
    //image(arrow3,c.x+30,c.y+30);
    //image(arrow3,-60,-90);
    //image(arrow3,-60,-120);
  }
}