package Tema8FicherosEntradaSalida;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Scanner;

public class Ejercicio2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Dime una ruta que quieras buscar");
        String ruta = sc.nextLine();
        Path rutaFinal = Paths.get(ruta);

        System.out.println("La ruta de la subcarpeta que contiene este elemento es: " + rutaFinal.toFile().getAbsolutePath());
        if (rutaFinal.toFile().exists()){
            System.out.println("La ruta si que existe");
            if (rutaFinal.toFile().isFile()){
                System.out.println("Este elemento es un fichero");
            }else {
                System.out.println("Este elemento es un directorio y este es su contenido: ");
                File[] contenido = rutaFinal.toFile().listFiles();
                for (File archivo : contenido){
                    System.out.println(archivo.getName());
                }
            }
        }else {
            System.out.println("La ruta no existe en este ordenador");
        }

    }
}
