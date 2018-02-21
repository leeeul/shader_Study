PShader kal;

ArrayList<PGraphics> sketches=new ArrayList<PGraphics>();
ArrayList<PShader> shaders=new ArrayList<PShader>();
int iter = 0;

PGraphics pg;
float div=10;
void setup() {
  size(600, 600, P2D);


  kal = loadShader("kalei.glsl");
  shaders.add(kal);

  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(255);
  pg.stroke(0);
  pg.endDraw();
  sketches.add(pg);
}

void draw() {
  background(255);
  shaders.get(iter).set("division", div);

  if (keyPressed) {
    if (keyCode==UP) {
      div = constrain(div+1, 3, 80);
    } else if (keyCode==DOWN) {
      div = constrain(div-1, 3, 80);
    }
  }

  for (int i=0; i<=iter; i++) {
    shader(shaders.get(i));
    image(sketches.get(i), 0, 0);
    resetShader();
  }

  if (mousePressed) {
    sketches.get(iter).beginDraw();
    sketches.get(iter).line(mouseX, mouseY, pmouseX, pmouseY);
    sketches.get(iter).endDraw();
  }
}

void keyPressed() {
  if (keyCode==' ') {
    pg.beginDraw();
    pg.background(255);
    pg.endDraw();
  } else if (key=='s') {
    kal = loadShader("kalei.glsl");
    shaders.add(kal);
    
    pg = createGraphics(width, height);
    pg.beginDraw();
    pg.background(255);
    pg.stroke(0);
    pg.endDraw();
    sketches.add(pg);
    div=10;
    iter++;
    println("save");
  }
}