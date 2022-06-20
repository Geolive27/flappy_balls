  //Flappy Code
    bird b = new bird();
    pillar[] p = new pillar[3];
    boolean end=false;
    boolean intro=true;
    int score=0;
    void setup(){
      size(500,800);
      for(int i = 0;i<3;i++){
      p[i]=new pillar(i);
      }
    }
    //** La configuration du vide est techniquement une fonction que vous créez en haut de chaque programme. À l'intérieur des accolades se trouve le code que vous souhaitez exécuter une fois dès que le programme démarre.
    void draw(){
      background(0);
      if(end){
      b.move();
      }
      b.drawBird();
      if(end){
      b.drag();
      }
      b.checkCollisions();
      for(int i = 0;i<3;i++){
      p[i].drawPillar();
      p[i].checkPosition();
      }
      fill(0);
      stroke(255);
      textSize(32);
      if(end){
      rect(20,20,100,50);
      fill(255);
      text(score,30,58);
      }else{
      rect(150,100,200,50);
      rect(150,200,200,50);
      fill(255);
      if(intro){
        text("Flappy Code",155,140);
        text("Click to Play",155,240);
      }else{
      text("game over",170,140);
      text("score",180,240);
      text(score,280,240);
      }
      }
    }
    //**Vous dessinez les carrés sur le tampon au lieu de l'écran. Ensuite, vous dessinez le tampon à l'écran, et enfin, vous dessinez le texte au-dessus du tampon. Puisque vous dessinez le tampon à l'écran à chaque image, il efface l'ancien texte, mais les carrés que vous avez précédemment dessinés sont conservés dans le tampon.
    class bird{
      float xPos,yPos,ySpeed;
    bird(){
    xPos = 250;
    yPos = 400;
    }
    //**une classe est une définition de modèle de la méthode s et de la variable s dans un type particulier d'objet
    void drawBird(){
      stroke(255);
      noFill();
      strokeWeight(2);
      ellipse(xPos,yPos,20,20);
    }
    void jump(){
     ySpeed=-10; 
    }
    void drag(){
     ySpeed+=0.4; 
    }
    void move(){
     yPos+=ySpeed; 
     for(int i = 0;i<3;i++){
      p[i].xPos-=3;
     }
    }
    void checkCollisions(){
     if(yPos>800){
      end=false;
      //**checkCollision vous permet de déterminer quand deux formes se touchent. Si vous pouvez déterminer que deux formes se touchent, vous pouvez déclencher une action
     }
    for(int i = 0;i<3;i++){
    if((xPos<p[i].xPos+10&&xPos>p[i].xPos-10)&&(yPos<p[i].opening-100||yPos>p[i].opening+100)){
     end=false; 
    }
    }
    } 
    }
    class pillar{
      float xPos, opening;
      boolean cashed = false;
     pillar(int i){
      xPos = 100+(i*200);
      opening = random(600)+100;
     }
     void drawPillar(){
       line(xPos,0,xPos,opening-100);  
       line(xPos,opening+100,xPos,800);
     }
     void checkPosition(){
      if(xPos<0){
       xPos+=(200*3);
       opening = random(600)+100;
       cashed=false;
      } 
      if(xPos<250&&cashed==false){
       cashed=true;
       score++; 
      }
     }

    }
    void reset(){
     end=true;
     score=0;
     b.yPos=400;
     for(int i = 0;i<3;i++){
      p[i].xPos+=550;
      p[i].cashed = false;
     }
    }
    //**La réinitialisation est le plus souvent utilisée pour donner de bonnes valeurs par défaut dans l'inspecteur.
    void mousePressed(){
     b.jump();
     intro=false;
     if(end==false){
       reset();
     }
    }
    //**La fonction mousePressed est appelée une fois après chaque pression sur un bouton de la souris


    void keyPressed(){
     b.jump(); 
     intro=false;
     if(end==false){
       reset();
     }
    }
    //**La fonction keyPressed est appelée une fois à chaque fois qu'une touche est enfoncée. La touche qui a été enfoncée est stockée dans la variable clé.

    
