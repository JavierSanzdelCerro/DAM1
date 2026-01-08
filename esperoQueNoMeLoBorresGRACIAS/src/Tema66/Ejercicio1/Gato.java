package Tema66.Ejercicio1;

public class Gato extends Animal {


    @Override
    public void hacerSonido() {
        super.sonido = "miau";
        super.hacerSonido();
    }
}
