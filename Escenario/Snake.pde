private class Snake extends GameObject {

  private int puntaje;
  private int velocidad;
  private int direccion;
  private Cabeza cabeza;
  private Cuerpo cuerpos;

  public Snake(PVector posicion, int velocidad) {
    
    this.posicion=posicion;
    this.velocidad=velocidad;
    
    this.puntaje=0;
  }

  public void display() {
    cabeza=new Cabeza(new PVector(this.posicion.x, this.posicion.y));
    cuerpos=new Cuerpo(new PVector(this.posicion.x, this.posicion.y+15));
    this.mover(direccion);
    this.visualizarPuntaje();
  }

  public void mover(int direccion) {
    if (direccion==0) {
      this.posicion.x=this.posicion.x+velocidad*DeltaTime.getDeltaTime(frameRate);
    }
    if (direccion==1) {
      this.posicion.x=this.posicion.x-velocidad*DeltaTime.getDeltaTime(frameRate);
    }
    if (direccion==2) {
      this.posicion.y=this.posicion.y-velocidad*DeltaTime.getDeltaTime(frameRate);
    }
    if (direccion==3) {
      this.posicion.y=this.posicion.y+velocidad*DeltaTime.getDeltaTime(frameRate);
    }
  }

  public void visualizarPuntaje() {
    fill(#ffffff);
    text("Puntaje:"+puntaje,20,20);
  }

  public void setDireccion(int direccion) {
    this.direccion=direccion;
  }
  
  public void setPuntaje(int puntaje){
    this.puntaje=puntaje;
  }
  public int getPuntaje(){
    return this.puntaje;
  }
}
