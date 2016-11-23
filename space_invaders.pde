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
  private int[][] move1;
  private int[][] move2;
  private boolean alive;
  private int movement;
  private int n;
  private int m;
  private int gridSize; 
  
  Martian(String martianFile, int gS) {
    loadMartianMatrix(martianFile);
    alive = true;
    gridSize = gS;
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
    int i, j;
    if (movement == moveOne) {
      for (i = 0; i < n; i++)
        for (j = 0; j < m; j++) {
          if (move1[i][j] == 1)
            rect(n*i, m*j, gridSize, gridSize);
        }
        movement = moveTwo;
    }
    else {
      for (i = 0; i < n; i++)
        for (j = 0; j < m; j++) {
          if (move2[i][j] == 1)
            rect(n*i, m*j, gridSize, gridSize);
        }
      movement = moveOne;
    }
  }
  
  public void kill() {
    alive = false;
  }
}

void setup() {
  background(0);
  size(600, 480);
  
}


void draw() {

}