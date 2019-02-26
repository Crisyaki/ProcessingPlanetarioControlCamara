class Estrella{
  float angulo; //Angulo en grados
  Planeta[] planetas;
  float radio;
  PImage textura;
  PShape estrella;
  
  //constructor
  Estrella(float radio, float ang, PImage textura){
    angulo = ang;
    this.radio = radio;
    this.textura = textura;
    estrella = createShape(SPHERE,radio);
  }
  
  void setPlanetas(Planeta[] p){
    planetas = p;
  }
  
  void rotarEstrella(){
    
    rotateX(radians(-20)) ; //inclinación de la estrella
    rotateY(radians(angulo));
    
    beginShape();
    estrella.setTexture(textura);
    endShape();
    shape(estrella);

    angulo=angulo + 0.25;
    if (angulo>360) angulo=0;
  }
  
}
