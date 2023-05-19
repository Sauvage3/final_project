/**
 * A colored variant of Conway's Game of Life
 * see https://www.algoritmarte.com/ for further details
 *
 * License: Creative Commons Attribution Share Alike 4.0 
 */
 
static int FILLPERC = 10;    // initial percentage of alive cells
static float INCCOL = 0.3;   // v_1 (color component added when a cell becomes alive)
static float DECCOL = 0.04;  // v_2 (color component subtracted when a cell become dead)

// screen size ... also change the size() command in the setup() function
int SCRWIDTH = 1280;
int SCRHEIGHT = 720;

int BLOCKW = 6;  // the screen width of each cell
int BLOCKH = 6;  // the screen height of each cell

int GRIDW = SCRWIDTH / BLOCKW;
int GRIDH = SCRHEIGHT / BLOCKH;

// the three grids (independents grids)
FloatCA ca[] = new FloatCA[3];

void setup() {
  frameRate( 20 );
  background(0);
  size(1280,720,JAVA2D);  
  for (int i = 0; i < 3; i++) {
    FloatCA cc = ca[i] = new FloatCA( round(random(1)*128));
    cc.randomize();
  }
}

void cadraw() {
    noStroke();
    for (int y = 0; y < GRIDH; y++) {
      for (int x = 0; x < GRIDW; x++) {
        int r = ca[0].grabc(x,y);
        int g = ca[1].grabc(x,y);
        int b = ca[2].grabc(x,y);
        fill( 0xff000000 | (r << 16) | (g << 8 ) | b );
        rect( x*BLOCKW, y*BLOCKH, BLOCKW, BLOCKH );
      }
    } 
}

int numsaved = 0;
void draw() {
  for (int i = 0; i < 3; i++)   ca[i].evolve();
  cadraw();

/* 
  // enble this if you want to make a 5 minute video ...
  // (use fffmpeg to combine the .tga generated images) 
  int tf = frameRate * 60 * 5;
  if ( numsaved < tf ) {
    saveFrame(  "E:/tmp/video/vid-" + nf(numsaved, 5) + ".tga" ); 
    numsaved++;  
    if ( numsaved == tf ) {
      println( "stop video" );
    }
  }  
*/  
}
