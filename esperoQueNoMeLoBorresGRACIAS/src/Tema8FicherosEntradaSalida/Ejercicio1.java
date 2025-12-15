package Tema8FicherosEntradaSalida;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class Ejercicio1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Escribe la ruta que deseas buscar");
        Path rutaUsu = Paths.get(sc.nextLine());

        if (rutaUsu.toFile().getAbsolutePath()!=null){
            System.out.println("Esta ruta si que es relativa");
        }
    }
}
