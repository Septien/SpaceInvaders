final int moveOne = 1;
final int moveTwo = 2;
final color green = color(0, 255, 0);
final color white = color(255);
final color black = color(0);

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
          if (move2[i][j] == 1) {
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

class Saucer {
  private int[][] saucer;
  private int n;
  private int m;
  private int lives;
  private int gridSizeX;
  private int gridSizeY;
  private color c;
  
  Saucer(String file, int gSx, int gSy) {
    loadSaucerMatrix(file);
    lives = 3;
    gridSizeX = gSx;
    gridSizeY = gSy;
    c = green;
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
  
  public void draw_saucer() {
    int i, j;
    fill(c);
    for (i = 0; i < n; i++)
      for (j = 0; j < m; j++)
        if (saucer[i][j] == 1)
          rect(gridSizeX*j, gridSizeY*i, gridSizeX, gridSizeY);
  }
}

void setup() {
  background(0);
  size(600, 600);
}


void draw() {

}