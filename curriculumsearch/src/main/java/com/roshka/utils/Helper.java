package com.roshka.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Helper {
    /**
     * Se espera fecha en el formato yyyy-MM-dd
     * @param fecha
     * @return retorna fecha correcta o nulo si no es posible convertir
     */
    public static Date convertirFecha(String fecha) {
        try {

                return new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            System.err.println("Error al parsear");
            e.printStackTrace();
            return null;
        }
    }
}
