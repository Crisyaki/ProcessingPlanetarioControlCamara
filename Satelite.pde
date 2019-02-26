class Satelite{
  float angulo;
  float radio;
  Orbita orbita;
  PImage textura;
  PShape satelite;
  float distancia;
  
  //constructor
  Satelite(float radio, float ang, float distancia, Orbita orbita,PImage textura){
    angulo = ang;
    this.radio = radio;
    this.orbita = orbita;
    this.textura = textura;
    this.distancia = distancia;
    satelite = createShape(SPHERE,radio);
  }
  
  void rotarSatelite(){
    
    rotateZ(radians(angulo));
    translate (distancia, 0  ,0 ) ;
 
    beginShape();
    satelite.setTexture(textura);
    endShape();
    shape(satelite);
    
    angulo=angulo + 0.65;
    if (angulo>360) angulo=0;
  }

}
