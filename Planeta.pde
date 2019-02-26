
class Planeta{
  float angulo; //Angulo en grados
  Satelite luna;
  float radio;
  Orbita orbita;
  PImage textura;
  PShape planeta;
  float incremento;
  
  //constructor
  Planeta(float radio, float ang,float incremento, Orbita orbita,PImage textura){
    angulo = ang;
    this.radio = radio;
    this.orbita = orbita;
    this.textura = textura;
    this.incremento = incremento;
    planeta = createShape(SPHERE,radio);
  }
  
  void createSatelite(float radio,float distancia,Orbita orbSat){
    luna = new Satelite(radio,30,distancia,orbSat,loadImage("satelite1.jpg"));
  }
  
 
  Satelite getSatelite(){
    return luna;
  }
  
  void rotarPlaneta(){

    rotateY(radians(angulo));
    rotateX (radians(-20)) ;

    rotateZ(radians(10));
    translate(orbita.getTranslacionX(),orbita.getTranslacionY(),orbita.getTranslacionZ());
    
    beginShape();
    planeta.setTexture(textura);
    endShape();
    shape(planeta);

    angulo=angulo + 0.65;
    if (angulo>360) angulo=0;
  }
 

}
