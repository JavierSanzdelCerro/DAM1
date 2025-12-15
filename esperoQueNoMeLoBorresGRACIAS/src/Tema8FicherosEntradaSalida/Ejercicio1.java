package Tema8FicherosEntradaSalida;

import javax.sound.midi.Soundbank;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class Ejercicio1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Escribe la ruta que deseas buscar");
        Path rutaUsu = Paths.get(sc.nextLine());

        if (rutaUsu.toFile().isAbsolute()){
            System.out.println("Esta ruta si que es absoluta");
            System.out.println(rutaUsu.toFile().getAbsolutePath());
        }else{
            System.out.println("Esta ruta no es absoluta");
        }

        System.out.println("El directorio padre es: " + rutaUsu.getParent());
        System.out.println("El nombre del archivo es: " + rutaUsu.getFileName());
        System.out.println("La extensión del archivo es: " + rutaUsu.toString().substring(rutaUsu.toString().lastIndexOf('.')));
        System.out.println("¿El fichero existe?: " + rutaUsu.toFile().exists());
    }
}
