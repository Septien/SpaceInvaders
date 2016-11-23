final int moveOne = 1;
final int moveTwo = 2;

class Martian {
  private int[][] move1;
  private int[][] move2;
  private boolean alive;
  private int movement;
  private int n;
  private int m;
  private int gridSize; 
  
  Martian(int N, int M, int[][] m1, int[][] m2, int gS) {
    n = N;
    m = M;
    move1 = m1;
    move2 = m2;
    movement = moveOne;
    alive = true;
    gridSize = gS;
  }
  
  boolean isAlive() {
    return alive;
  }
  
  void drawMartian() {
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

void loadMartianMatrix(String martian, int[][] m1, int[][] m2) {
  BufferedReader reader;
  String line;
  String[] l;
  int n, m;
  int i, j;
  
  reader = createReader(martian);
  line = readNextLine(reader);
  if (line != null) {
    l = split(line, " ");
    n = int(l[0]);
    m = int(l[1]);
    m1 = new int[n][m];
    m2 = new int[n][m];
    for (i = 0; i < m; i++) {
      line = readNextLine(reader);
      if (line != null) {
        l = split(line, " "); 
        for (j = 0; j < n; j++)
          m1[j][i] = int(l[j]);
      }
    }
    line = readNextLine(reader);
    for (i = 0; i < m; i++) {
      line = readNextLine(reader);
      if (line != null) {
        l = split(line, " "); 
        for (j = 0; j < n; j++)
          m2[j][i] = int(l[j]);
      }
    }
  }
}

void setup() {
  background(0);
  size(1000, 800);
}