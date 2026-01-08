package Tema66.Ejercicio1;

public class Perro extends Animal {


    @Override
    public void hacerSonido() {
        super.sonido = "guau";
        super.hacerSonido();
    }
}
