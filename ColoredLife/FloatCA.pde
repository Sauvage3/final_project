


class FloatCA {
  int grids[][][] = new int[2][GRIDW][GRIDH];
  float dgrid[][] = new float[GRIDW][GRIDH];
  int igrid = 0;  

  float delta = 0.1; 
  int param = 0;
  
  // the neighbourhood
  int nx[][] = {   
     {0,-1},  {1,-1}, {1,0}, {1,1}, {0,1}, {-1,1}, {-1,0}, {-1,-1} 
  };

  FloatCA(int param) {
    this.param = param;
  }

  int grabc( int x, int y ) {
        int f = grids[igrid][x][y];
        float b = dgrid[x][y];
        if ( f > 0 ) b += INCCOL; else b -= DECCOL;
        if ( b < 0 ) b = 0;
        if ( b > 1 ) b = 1;
        dgrid[x][y] = b;
        return round( b * 255 ) ;    
  }
  
  void randomize() {
    for (int y = 0; y < GRIDH; y++) {
      for (int x = 0; x < GRIDW; x++) {
        grids[igrid][x][y] = 0;
        if ( random(100) < FILLPERC ) grids[igrid][x][y] = 1;
      }
    }
  }  

  void evolve() {
    int i2 = 1 - igrid;
    for (int y = 0; y < GRIDH; y++) {
      for (int x = 0; x < GRIDW; x++) {
        float v = 0;
        for (int s = 0; s < nx.length; s++) {
          int x0 = (x + nx[s][0]*1 + GRIDW) % GRIDW;
          int y0 = (y + nx[s][1]*1 + GRIDH) % GRIDH;
          v += grids[igrid][x0][y0];
        }
        int v0 = grids[igrid][x][y];
        if ( v0 == 0) {
          if (v == 3) v0 = 1;
        } else {
          if ( v < 2 || v > 3 ) v0 = 0;
        }
        if ( v0 <  0 ) v0 = 0;
        if ( v0 >  1 ) v0 = 1;
        grids[i2][x][y] = v0;
      }
    }
    igrid = i2;
    // always add a some cells
    //for (int i = 0; i < 1; i++) grids[igrid][ floor( random(1)*GRIDW )][ floor( random(1)*GRIDH )] = 1;
  }
}
