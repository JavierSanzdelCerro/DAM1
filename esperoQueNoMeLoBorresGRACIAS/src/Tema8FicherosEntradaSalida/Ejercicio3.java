package Tema8FicherosEntradaSalida;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class Ejercicio3 {
    public static void main(String[] args) throws IOException {
        Path origen = Paths.get("texto.txt");
        Path destino1 = Paths.get("texto1.txt");
        Path destino2 = Paths.get("texto2.txt");

        try {
            Files.copy(origen, destino1, StandardCopyOption.REPLACE_EXISTING);
            Files.copy(origen, destino2, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Path rutaNueva = Files.createDirectories(Path.of("Documentos/programación/docs/samples"));
        Path rutaNueva1 = Files.createDirectories(Path.of("Documentos/programación/docs/exercises"));

        
    }
}
