class Displacement
{
  float x1, y1, x2, y2, x3, y3, x4, y4,user1,user2,user3,user4;
  float[] min_value;
  float[] u1,u2,u3,u4;
  Displacement()
  {}
  void init()
  {
    min_value  = new float[12];
    u1  = new float[3];
    u2  = new float[3];
    u3  = new float[3];
    u4  = new float[3];
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
    
    calculate_Displacement();
  }
  
  void calculate_Displacement()
  {
    min_value[0] = sqrt(sq(x2-x1)+(sq(y2-y1)));
    min_value[1] = sqrt(sq(x3-x1)+(sq(y3-y1)));
    min_value[2] = sqrt(sq(x4-x1)+(sq(y4-y1)));
    min_value[3] = sqrt(sq(x1-x2)+(sq(y1-y2)));
    min_value[4] = sqrt(sq(x3-x2)+(sq(y3-y2)));
    min_value[5] = sqrt(sq(x4-x2)+(sq(y4-y2)));
    min_value[6] = sqrt(sq(x1-x3)+(sq(y1-y3)));
    min_value[7] = sqrt(sq(x2-x3)+(sq(y2-y3)));
    min_value[8] = sqrt(sq(x2-x1)+(sq(y2-y1)));
    min_value[9] = sqrt(sq(x1-x4)+(sq(y1-y4)));
    min_value[10] = sqrt(sq(x2-x4)+(sq(y2-y4)));
    min_value[11] = sqrt(sq(x3-x4)+(sq(y3-y4)));
    
    for(int i=0; i<12; i++)
    {
      if(i<3)
      {
        u1[i]= min_value[i];
      }
      if(i>2 && i<6)
      {
        u2[i-3]= min_value[i];
      }
      if(i>5 && i < 9)
      {
        u3[i-6]= min_value[i];
      }
      if(i>8 && i < 12)
      {
        u3[i-9]= min_value[i];
      }
    }
    user1 = min(u1);
    user2 = min(u2);
    user3 = min(u3);
    user4 = min(u4);
  }
  
  float getShortest(int index)
  {
    float val = 0;
    switch(index)
    {
      case 1:
      {val = user1;}
      case 2:
      {val = user2;}
      case 3:
      {val = user3;}
      case 4:
      {val = user4;}
      default:
      {println("Invalid User index: "+index);}
    }
    return val;
  }
  
  void setShortest(int index, float val)
  {
    switch(index)
    {
      case 1:
      {
        user1 = val;
        break;
      }
      case 2:
      {
        user1 = val;
        break;
      }
      case 3:
      {
        user1 = val;
        break;
      }
      case 4:
      {
        user1 = val;
        break;
      }
      default:
      {
        println("Invalid User index: "+index);
        break;
      }
    }
  }
}