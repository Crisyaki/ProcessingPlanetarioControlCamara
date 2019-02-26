Planeta[] p;
Estrella star;
boolean[] haySatelite; //true hay satelite, false no
PImage[] texturas;
PImage fondo,cristalNave;
float naveX,naveY,naveZ;
float anguloNave,angulo;
PShape nave;
boolean primeraPersona, vistaGeneral, tutorial;
String info,tutorialString;

void setup(){
  size(992 ,614 ,P3D) ;
  noStroke();
  crearEstrella();
  crearPlanetas();
  fondo = loadImage("fondo3.jpg");
  //nave = loadShape("SpaceShip.obj");
  nave = createShape(BOX,10);
  cristalNave = loadImage("cristal1.jpg");
  naveZ = 0;
  anguloNave = 0;
  primeraPersona = false;
  vistaGeneral = true;
  tutorial = false;
  
  info = "Pulsa i para saber los controles";
  tutorialString = "Información de controles del programa\n" + 
             "Para controlar la dirección de la nave se puede usar tanto WSAD QE, como el ratón.\n" +
             "Para ir hacia delante con la nave se usa la rueda del ratón\n" +
             "Para resetear el programa pulsa P\n" + 
             "El modo de vista general está activado por defecto y se activa con el 1\n" + 
             "El modo en primera persona se activa con el 2\n\n" + 
             "Para salir del menú informativo pulse la I\n";
}

void draw(){
  background(fondo);
  
  if(tutorial) {
    background(0);
    textSize(14);
    fill(255);
    text(tutorialString, 100 , 100 ); 
    return;
  }
  //Texto
  textSize(20);
  fill(255);
  text(info, 10 , 20 ); 
  
  pushMatrix();
  translate(naveX,naveY,naveZ);
  shape(nave);
  popMatrix();
  
  if (primeraPersona)
      camera(width/2 + naveX + 200 * sin(radians(angulo)), height/2 + naveY - 100, naveZ + 200 * cos(radians(angulo)), width/2 + naveX, height/2 + naveY, naveZ, 0, 1, 0);
  else 
      camera();
  
  translate ( width /2 , height /2 , 0 ) ;

  pushMatrix();
  star.rotarEstrella();
  popMatrix();
  for(int i = 0; i<p.length;i++){
    pushMatrix();
    p[i].rotarPlaneta(); //Rotación sobre si misma
    if(haySatelite[i]) {
      pushMatrix();
      p[i].getSatelite().rotarSatelite(); //puede ser nulo
      popMatrix();
    }
    popMatrix(); 
  }
  
  //Cristal de la nave para la 1º persona
  //tint(255, 127);
  //image(cristalNave, 0, 0);
  
  
}

void crearEstrella(){
  star = new Estrella(100,45,loadImage("estrella.jpg"));
}

void crearPlanetas(){
  p = new Planeta[8];
  haySatelite = new boolean[8];
  p[0] = new Planeta(18,-45,0.5, new Orbita(200, 100 , 0),loadImage("planeta1.jpg"));
  haySatelite[0] = true;
  p[0].createSatelite(5,25,new Orbita(0,0, 40));
  
  p[1] = new Planeta(30,-65,0.10, new Orbita(300 , 80 , 50),loadImage("planeta2.jpg"));
  haySatelite[1] = false;
  
  p[2] = new Planeta(50,80,0.65, new Orbita(200 ,-180 , 50),loadImage("planeta3.jpg"));
  haySatelite[2] = false;
  
  p[3] = new Planeta(25,190,0.73, new Orbita(330 ,90 , 50),loadImage("planeta4.jpg"));
  haySatelite[3] = false;
  
  p[4] = new Planeta(18,15,0.3, new Orbita(200 , 90, 50),loadImage("planeta5.jpg"));
  haySatelite[4] = false;
  
  p[5] = new Planeta(50,270,0.53, new Orbita(350 , -150 , 50),loadImage("planeta6.jpg"));
  haySatelite[5] = true;
  p[5].createSatelite(20,80 ,new Orbita(0,0, 180));
  
  p[6] = new Planeta(18,-69,0.83, new Orbita(260 , -40, 50),loadImage("planetaOscuro.jpg"));
  haySatelite[6] = false;
  
  p[7] = new Planeta(10,20,0.93, new Orbita(340 , 100, 50),loadImage("venusmap.jpg"));
  haySatelite[7] = false;
  
}

void reset(){
  crearEstrella();
  crearPlanetas();
  naveZ = 0;
  naveX = 0;
  naveY = 0;
  anguloNave = 0;
  primeraPersona = false;
  vistaGeneral = true;
}

void intrucciones(){

}

void mouseMoved() {
  if(primeraPersona){
    naveX = mouseX-width/2;
    naveY = mouseY-height/2;
  }else{
    naveX = mouseX;
    naveY = mouseY;
  }
}

void mouseWheel(MouseEvent event) {
  naveZ += 10*event.getCount();
  
}

void keyPressed ( ) {
  switch(key){
    case 119: //W
        naveY-=10;
        break;
    case 115: //S
        naveY+=10;
        break;
    case 97: //A 
        naveX-=10;
        break;
    case 100: //D
        naveX+=10;
        break;
    case 113: //Q
        anguloNave -= 10;
        pushMatrix();
        rotateY(radians(angulo));
        translate (10, 10  ,0 ) ;
        popMatrix();
        break;
    case 101: //E
        anguloNave +=10;
        pushMatrix();
        rotateY(radians(angulo));
        translate (10, 10  ,0 ) ;
        popMatrix();
        break;
    case 112: //P --> Resetar todo
        reset();
        break;
    case 105: //I --> Información
        if(!tutorial) tutorial = true;
        else tutorial = false;
        break;
    case 49: //1 --> Modo 1 Vista general
        primeraPersona = false;
        vistaGeneral = true;
        break;
    case 50: //2 --> Modo 2 Primera Persona
        primeraPersona = true;
        vistaGeneral = false;
        break;
  }
  
}
