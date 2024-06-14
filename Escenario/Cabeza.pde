private class Cabeza {
  private PVector posicion;
  private Collider collider;
  
  private ArrayList<String> animalTipo;
  private ArrayList<Integer> tiempoComido;


  public Cabeza(PVector posicion) {
    this.posicion=posicion;
    this.display(this.posicion);
    
    animalTipo=new ArrayList<String>();
    tiempoComido= new ArrayList<Integer>();
  }
  
//Se puso la visualización de la cabeza por aparte debido a q al estar creando una cabeza en el constructor de snake, constantemente estaba reiniciando las arrays
  public void display(PVector newPosicion){
    
    this.collider=new Collider(20.0, this.posicion);
    this.posicion=newPosicion;
    noStroke();
    fill(#0BFF00);
    circle(this.posicion.x, this.posicion.y, 40);
  }

  public void comer(Animal animalComido) {

    boolean isCollide = this.collider.validarCollider(animalComido.getCollider());

    if (isCollide==true) {
      
      int puntajeSumado=animalComido.getValor();
      snake.setPuntaje(snake.getPuntaje()+puntajeSumado);
      
      
      switch(animalComido.getTipo()){
        case 1:
          animalTipo.add("Insecto");
          tiempoComido.add(getTiempo());
          break;
        case 2:
          animalTipo.add("Raton");
          tiempoComido.add(getTiempo());
          break;
        case 3:
          animalTipo.add("Pajaro");
          tiempoComido.add(getTiempo());
          break;
      }
      
      
      setAnimalExist(false);
      animal.remove(0);
 
    }
  }


  public Collider getCollider() {
    return this.collider;
  }

  public void setPosicion(PVector posicion) {
    this.posicion=posicion;
    this.collider.setPosCentro(this.posicion);
  }
}
