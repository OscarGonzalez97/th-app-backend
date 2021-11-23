package com.roshka.utils;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

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

    /**
     * Diferencia en meses entre 2 fechas.
     * @param date1 La fecha inicial. No puede ser nulo
     * @param date2 La fecha final. Si es nulo, se asume a la fecha de hoy
     * @return
     */
    public static final long getMonthsDifference(Date date1, Date date2) {
        if(date2==null) date2 = new Date();
        long diffInMillies = Math.abs(date2.getTime() - date1.getTime());
        long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
    
        return Math.round(diff/30.d) ;
    }

    public static LocalDate convertToLocalDateViaSqlDate(Date dateToConvert) {
        if(dateToConvert == null) return null;
        return new java.sql.Date(dateToConvert.getTime()).toLocalDate();
    }

    public static int calculateAge(LocalDate birthDate, LocalDate currentDate) {
        if ((birthDate != null) && (currentDate != null)) {
            return Period.between(birthDate, currentDate).getYears();
        } else {
            return 0;
        }
    }

    public static int calculateAge(Date birthDate) {
        LocalDate currentDate = LocalDate.now();
        return calculateAge(convertToLocalDateViaSqlDate(birthDate),currentDate);
    }

    public static String formatDate(LocalDate fecha, String format){
        if(fecha == null || format == null) return null;
        return fecha.format(DateTimeFormatter.ofPattern(format));
    }
    public static String formatDate(Date fecha, String format){
        return formatDate(convertToLocalDateViaSqlDate(fecha), format);
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
