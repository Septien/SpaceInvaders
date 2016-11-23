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