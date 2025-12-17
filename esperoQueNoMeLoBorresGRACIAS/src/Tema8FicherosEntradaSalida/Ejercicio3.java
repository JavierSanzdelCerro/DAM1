package Tema8FicherosEntradaSalida;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class Ejercicio3 {

    public static void main(String[] args) throws IOException {
        Path rutaAbs = Paths.get("C:\\Users\\dam1\\Desktop\\Nueva carpeta\\DAM1\\esperoQueNoMeLoBorresGRACIAS\\src\\docs");

        Path origen = Paths.get(rutaAbs + "\\texto.txt");
        Path destino1 = Paths.get(rutaAbs + "\\texto(+1).txt");
        Path destino2 = Paths.get(rutaAbs + "\\texto(+2).txt");


        try {
            Files.copy(origen, destino1, StandardCopyOption.REPLACE_EXISTING);
            Files.copy(origen, destino2, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Path rutaNueva = Files.createDirectories(Path.of(rutaAbs + "\\docs"));
        Path rutaNueva1 = Files.createDirectories(Path.of("Documentos/programación/docs/exercises"));

        
    }
}
