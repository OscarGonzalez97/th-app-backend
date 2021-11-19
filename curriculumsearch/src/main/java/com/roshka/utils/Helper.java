package com.roshka.utils;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import com.roshka.modelo.DBFile;

import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

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

    public static DBFile createFile(MultipartFile file) {
        // Normalize file name
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        try {
            // Check if the file's name contains invalid characters
            if(fileName.contains("..")) {
                throw new Exception("Sorry! Filename contains invalid path sequence " + fileName);
            }
            if(file.getSize()==0)  throw new Exception("Sorry! File cant be void");;

            DBFile dbFile = new DBFile(fileName, file.getContentType(), file.getBytes());

            return dbFile;
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
        catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

}
