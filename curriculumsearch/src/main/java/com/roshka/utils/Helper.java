package com.roshka.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class Helper {
    /**
     * Se espera fecha en el formato yyyy-MM-dd
     * @param fecha
     * @return retorna fecha correcta o nulo si no es posible convertir
     */
    public static Date convertirFecha(String fecha) {
        try {
                if(fecha == null || fecha.trim().equals("")) return null;
                return new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            System.err.println("Error al parsear");
            e.printStackTrace();
            return null;
        }
    }

    public static final long getMonthsDifference(Date date1, Date date2) {
        YearMonth m1 = YearMonth.from(date1.toInstant().atZone(ZoneOffset.UTC));
        YearMonth m2 = YearMonth.from(date2.toInstant().atZone(ZoneOffset.UTC));
    
        return m1.until(m2, ChronoUnit.MONTHS) + 1;
    }
}
