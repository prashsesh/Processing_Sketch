UI u1 = new UI();

void setup()
{
  size(700, 600);
  //fullScreen(2);
  //fullScreen(SPAN);
  u1.create();
}

void draw()
{
  background(0);
  u1.init();
}