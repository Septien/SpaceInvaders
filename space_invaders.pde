final int moveOne = 1;
final int moveTwo = 2;

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

class Martian {
  //States of the martian (position 1 or position 2)
  private int[][] move1;
  private int[][] move2;
  //Appears on the board
  private boolean alive;
  //In wich movement is the martian now
  private int movement;
  //Size of the matrix
  private int n;
  private int m;
  //Size of each square
  private int gridSizeX;
  private int gridSizeY;
  
  Martian(String martianFile, int gSx, int gSy) {
    loadMartianMatrix(martianFile);
    alive = true;
    gridSizeX = gSx;
    gridSizeY = gSy;
    movement = moveOne;
  }
  
  private void loadMartianMatrix(String martian) {
    BufferedReader reader;
    String line;
    String[] l;
    int i, j;
  
    reader = createReader(martian);
    line = readNextLine(reader);
    if (line != null) {
      l = split(line, " ");
      n = int(l[0]);
      m = int(l[1]);
      move1 = new int[n][m];
      move2 = new int[n][m];
      for (i = 0; i < n; i++) {
        line = readNextLine(reader);
        if (line != null) {
          l = split(line, " "); 
          for (j = 0; j < m; j++)
            move1[i][j] = int(l[j]);
        }
      }
      line = readNextLine(reader);
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
  
  public boolean isAlive() {
    return alive;
  }
  
  public void drawMartian() {
    if (!alive)
      return;
      
    int i, j;
    fill(0, 255, 0);
    if (movement == moveOne) {
      for (i = 0; i < n; i++) {
        for (j = 0; j < m; j++) {
          if (move1[i][j] == 1) {
            rect(gridSizeX*j, gridSizeY*i, gridSizeX, gridSizeY);
          }
        }
      }
      movement = moveTwo;
    }
    else {
      for (i = 0; i < n; i++) {
        for (j = 0; j < m; j++) {
          if (move2[i][j] == 1) {
            rect(gridSizeX*j, gridSizeY*i, gridSizeX, gridSizeY);
          }
        }
      }
      movement = moveOne;
    }
  }
  
  //Kill martian, no longer on screen
  public void kill() {
    alive = false;
  }
}

void setup() {
  background(0);
  size(600, 480);
  //Width of grid
  int gridWidth;
  int gn = 160;
  //Height of grid
  int gridHeight;
  int gm = 160;

  noFill();
  stroke(255);
  gridWidth = width/gn;
  gridHeight = height/gm;
  for (int i = 0; i < width; i += width/gn)
    for ( int j = 0; j < height; j += height/gm)
      rect(i, j, width/gn, height/gm);

  
}


void draw() {

}