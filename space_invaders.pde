final color green = color(0, 255, 0);
final color red = color(255, 0, 0);
final color white = color(255);
final color black = color(0);

/**
  reader -> pointer to a file.
  Read the next line of the input file.
  Returns it.
*/
String readNextLine(BufferedReader reader) {
  String line;
  try {
    line = reader.readLine();
  }
  catch(IOException e) {
    e.printStackTrace();
    line = null;
  }
  
  return line;
}

/**
  Draws a matrix containing 0 and 1.
  Draw a rectangle if the value of the matrix is one
  Input: matrix -> matrix to look.
  n,m -> size of the matrix
  gridSizeX, gridSizeY -> width and height of the rectangle.
*/
void drawMatrix(int[][] matrix, int n, int m, int gridSizeX, int gridSizeY) {
  int i, j;
  for (i = 0; i < n; i++) {
        for (j = 0; j < m; j++) {
          if (matrix[i][j] == 1) {
            rect(gridSizeX*j, gridSizeY*i, gridSizeX, gridSizeY);
          }
        }
      }
}

class Martian {
  //States of the martian (position 1 or position 2)
  private int[][] move1;
  private int[][] move2;
  //Appears on the board
  private boolean alive;
  //In wich movement is the martian now
  private boolean moveOne;
  //Size of the matrix
  private int n;
  private int m;
  //Size of each square
  private int gridSizeX;
  private int gridSizeY;
  private color c;
  
  Martian(String martianFile, int gSx, int gSy) {
    loadMartianMatrix(martianFile);
    alive = true;
    gridSizeX = gSx;
    gridSizeY = gSy;
    moveOne = true;
    c = white;
  }
  
  private void loadMartianMatrix(String martian) {
    BufferedReader reader;
    String line;
    String[] l;
    int i, j;
  
    //Open file
    reader = createReader(martian);
    line = readNextLine(reader);
    if (line != null) {
      l = split(line, " ");
      //Size of the matrix
      n = int(l[0]);
      m = int(l[1]);
      move1 = new int[n][m];
      move2 = new int[n][m];
      //Read first matrix
      for (i = 0; i < n; i++) {
        line = readNextLine(reader);
        if (line != null) {
          l = split(line, " ");
          //Fill the matrix with the content of the current line
          for (j = 0; j < m; j++)
            move1[i][j] = int(l[j]);
        }
      }
      line = readNextLine(reader);
      //Read next matrix
      for (i = 0; i < n; i++) {
        line = readNextLine(reader);
        if (line != null) {
          l = split(line, " "); 
          for (j = 0; j < m; j++)
            move2[i][j] = int(l[j]);
        }
      }
    }
  }
  
  public void setColor(color nc) {
    c = nc;
  }
  
  public color getColor() {
    return c;
  }
  
  public boolean isAlive() {
    return alive;
  }
  
  public int getN() {
    return n;
  }
  
  public int getM() {
      return m;
  }
  
  public void setMovement(boolean move) {
    moveOne = move;
  }
  
  public void drawMartian() {
    if (!alive)
      return;

    fill(c);
    noStroke();
    if (moveOne)
      drawMatrix(move1, n, m, gridSizeX, gridSizeY);
    else
      drawMatrix(move2, n, m, gridSizeX, gridSizeY);
  }
  
  //Kill martian, no longer on screen
  public void kill() {
    alive = false;
  }
}

class Saucer {
  //Matrix of saucer
  private int[][] saucer;
  //Size of matrix
  private int n;
  private int m;
  //Array of posible points
  private int[] points;
  private int gridSizeX;
  private int gridSizeY;
  //Color of saucer
  private color c;
  
  Saucer(String file, int gSx, int gSy) {
    loadSaucerMatrix(file);
    gridSizeX = gSx;
    gridSizeY = gSy;
    c = red;
    points = new int[4];
    //Range of points 
    points[0] = 50;
    points[1] = 100;
    points[2] = 150;
    points[3] = 300;
  }
  
  public int getN() {
    return n;
  }
  
  public int getM() {
    return m;
  }
  
  private void loadSaucerMatrix(String suacer) {
    BufferedReader reader;
    String line;
    String[] l;
    int i, j;
  
    reader = createReader(suacer);
    line = readNextLine(reader);
    if (line != null) {
      l = split(line, " ");
      n = int(l[0]);
      m = int(l[1]);
      saucer = new int[n][m];
      for (i = 0; i < n; i++) {
        line = readNextLine(reader);
        if (line != null) {
          l = split(line, " "); 
          for (j = 0; j < m; j++)
            saucer[i][j] = int(l[j]);
        }
      }
    }
  }
  
  public void setColor(color nc) {
    c = nc;
  }
  
  public color getColor() {
    return c;
  }
  
  public void drawSaucer() {
    fill(c);
    drawMatrix(saucer, n, m, gridSizeX, gridSizeY);
  }
}

class Barrack {
  private int[][] barrack;
  private int n;
  private int m;
  private int damage;
  private int gridSizeX;
  private int gridSizeY;
  private color c;
  
  Barrack(String file, int gSx, int gSy) {
    loadBarrackMatrix(file);
    gridSizeX = gSx;
    gridSizeY = gSy;
    //0% of damage
    damage = 0;
    c = green;
  }
  
  private void loadBarrackMatrix(String barrackFile) {
    BufferedReader reader;
    String line;
    String[] l;
    int i, j;
  
    reader = createReader(barrackFile);
    line = readNextLine(reader);
    if (line != null) {
      l = split(line, " ");
      n = int(l[0]);
      m = int(l[1]);
      barrack = new int[n][m];
      for (i = 0; i < n; i++) {
        line = readNextLine(reader);
        if (line != null) {
          l = split(line, " "); 
          for (j = 0; j < m; j++)
            barrack[i][j] = int(l[j]);
        }
      }
    }
  }
  
  public void setColor(color nc) {
    c = nc;
  }
  
  public color getColor() {
    return c;
  }
  
  public int getM() {
    return m;
  }
  
  public int getN() {
    return n;
  }
  
  public void drawBarrack() {
    fill(c);
    drawMatrix(barrack, n, m, gridSizeX, gridSizeY);
  }
}

class Cannon {
  private int[][] cannon;
  private int n;
  private int m;
  //Number of available lives
  private int lives;
  private int gridSizeX;
  private int gridSizeY;
  private color c;
  
  Cannon(String file, int gSx, int gSy) {
    loadCannonMatrix(file);
    gridSizeX = gSx;
    gridSizeY = gSy;
    //0% of damage
    lives = 3;
    c = green;
  }
  
  private void loadCannonMatrix(String barrackFile) {
    BufferedReader reader;
    String line;
    String[] l;
    int i, j;
  
    reader = createReader(barrackFile);
    line = readNextLine(reader);
    if (line != null) {
      l = split(line, " ");
      n = int(l[0]);
      m = int(l[1]);
      cannon = new int[n][m];
      for (i = 0; i < n; i++) {
        line = readNextLine(reader);
        if (line != null) {
          l = split(line, " "); 
          for (j = 0; j < m; j++)
            cannon[i][j] = int(l[j]);
        }
      }
    }
  }
  
  public int getM() {
    return m;
  }
  
  public int getN() {
    return n;
  }
  
  public void setColor(color nc) {
    c = nc;
  }
  
  public color getColor() {
    return c;
  }
  
  public void drawCannon() {
    fill(c);
    drawMatrix(cannon, n, m, gridSizeX, gridSizeY);
  }
}

//Necesary objects and variables.
Martian[][] martians;
Saucer saucer;
Barrack[] barracks;
Cannon cannon;
//Number of squares on x-axis
int gn = 200;
//Number of squares on y-axis
int gm = 200;
//Number of columns and rows of martians
int martianRow = 5;
int martianColumn = 11;
//Number of barracks
int numBarracks = 4;
//Width of grid
int gridWidth;
//Height of grid
int gridHeight;
//Initial points
int initialCoordinate = 23;
//Cannon translate coordinate
int cannonTranslate = 0;


/**
Initialize the array of martians.
Load all pertinent data.
*/
void initializeMartians(int gridWidth, int gridHeight) {
  int i, j;
  
  martians = new Martian[martianRow][martianColumn];
  for (i = 0; i < martianRow; i++) {
    for (j = 0; j < martianColumn; j++) {
      switch (i) {
        //Load martians number 3
        case 0:
          martians[i][j] = new Martian("martians/martian3.txt", gridWidth, gridHeight);
          break;
        //Load the martian number 2
        case 1:
        case 2:
          martians[i][j] = new Martian("martians/martian2.txt", gridWidth, gridHeight);
          break;
        //Load martian number 1
        case 3:
        case 4:
          martians[i][j] = new Martian("martians/martian1.txt", gridWidth, gridHeight);
          break;
      }
    }
  }
}

//Initialize all necesary objects.
void init() {
  int i;
  //Initialize martians
  initializeMartians(gridWidth, gridHeight);
  
  //Initialize saucer
  saucer = new Saucer("martians/saucer.txt", gridWidth, gridHeight);
  
  //Initialize barracks
  barracks = new Barrack[numBarracks];
  for (i = 0; i < numBarracks; i++) {
    barracks[i] = new Barrack("barracks/barrack.txt", gridWidth, gridHeight);
  }
  
  //Initialize cannon
  cannon = new Cannon("cannon/cannon.txt", gridWidth, gridHeight);
}

void drawLine() {
  stroke(green);
  line(0, (gm - 1) * gridHeight, width, (gm - 1) * gridHeight);
}

void setup() {
  background(black);
  size(600, 600);
  
  gridWidth = width/gn;
  gridHeight = height/gm;
  
  init();
  //noLoop();
  //Separate board area and information display area. For debugging
  stroke(green);
  line(0, 12 * gridHeight, width, 12 * gridHeight);
}

void drawMartians() {
  int i, j;
  int n, m;
  int stepY;
  int martianInitialHeight;
  n = martians[0][0].getN();
  m = martians[0][0].getM();
  martianInitialHeight = 6;
  //Calculate height of the first line of martians
  stepY = n + martianInitialHeight;
  for (i = 0; i < martianRow; i++) {
    for (j = 0; j < martianColumn; j++) {
      pushMatrix();
        //Draw each line of martians according to the line they belong to.
        translate(0, i * stepY * gridHeight);
        //Draw each martian of a line with its corresponding separation
        translate((initialCoordinate + (m * j)) * gridWidth, initialCoordinate * gridHeight);
        martians[i][j].drawMartian();
      popMatrix();
    }
  }
}

void drawSaucer() {
  int h;
  int stepY;
  int saucerInitialHieght;
  saucerInitialHieght = 7;
  h = saucer.getN();
  stepY = h + saucerInitialHieght;
  pushMatrix();
    translate(0, stepY * gridHeight);
    saucer.drawSaucer();
  popMatrix();
}

void drawBarracks() {
  int barrackInitialHeight;
  int i;
  int barrackWidth;
  int barrackSeparation;
  barrackSeparation = 21;
  barrackWidth = barracks[0].getM();
  barrackInitialHeight = 150;
  for (i = 0; i < numBarracks; i++) {
    pushMatrix();
      translate(0, barrackInitialHeight * gridHeight);
      translate((initialCoordinate + ((barrackWidth + barrackSeparation) * i)) * gridWidth, 0);
      barracks[i].drawBarrack();
    popMatrix();
  }
}

void drawCannon() {
  int cannonInitialHeight;
  cannonInitialHeight = 180;
  pushMatrix();
    translate((initialCoordinate + cannonTranslate) * gridWidth, cannonInitialHeight * gridHeight);
    cannon.drawCannon();
  popMatrix();
}

void draw() {
  background(black);
  drawMartians();
  drawSaucer();
  drawBarracks();
  drawCannon();
  drawLine();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      cannonTranslate -= 1;
      if (cannonTranslate <= -initialCoordinate)
        cannonTranslate = -initialCoordinate;
    }
    else if (keyCode == RIGHT) {
      int m = cannon.getM();
      cannonTranslate += 1;
      if (cannonTranslate >= gn - 23 - m)
        cannonTranslate = gn - 23 - m;
    }
  }
}