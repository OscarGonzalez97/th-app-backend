package com.roshka.utils;


import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.roshka.DTO.PostulanteListaDTO;
import com.roshka.modelo.PostulanteTecnologia;
import com.roshka.modelo.Tecnologia;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class PostulantesExcelExporter {
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<PostulanteListaDTO> listUsers;
    private HashMap<String, String> filtros;

    public PostulantesExcelExporter(List<PostulanteListaDTO> listUsers, HashMap<String, String> filtros) {
        this.listUsers = listUsers;
        workbook = new XSSFWorkbook();
        this.filtros = filtros;
    }


    private void writeHeaderLine() {
        sheet = workbook.createSheet("Postulantes");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        Row row = sheet.createRow(0);
        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeightInPoints((short)14);
        font.setColor(IndexedColors.WHITE.getIndex());
        font.setBold(true);
        font.setItalic(false);

        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setAlignment(HorizontalAlignment.CENTER);
        // Setting font to style
        style.setFont(font);

        createCell(row, 0, "Postulantes "+currentDateTime, style);

        row = sheet.createRow(2);
        createCell(row, 0, "Filtros", style);

        row = sheet.createRow(3);
        createCell(row, 0, "Nombre", style);
        createCell(row, 1, "Nivel de Ingles", style);
        createCell(row, 2, "Experiencia (Meses)", style);
        createCell(row, 3, "Tecnologias", style);
        createCell(row, 4, "Nivel Tecnologia", style);
        createCell(row, 5, "Institucion", style);
        createCell(row, 6, "Estado", style);
        createCell(row, 7, "Convocatoria", style);
        createCell(row, 8, "Fecha Inicio Convocatoria", style);


        row = sheet.createRow(6);
        createCell(row, 0, "Nombre", style);
        createCell(row, 1, "Nivel de Ingles", style);
        createCell(row, 2, "Experiencia", style);
        createCell(row, 3, "Tecnologias", style);
        createCell(row, 4, "Estado", style);

    }

    private void createCell(Row row, int columnCount, Object value, CellStyle style) {
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        }else {
            cell.setCellValue((String) value);
        }
        cell.setCellStyle(style);
    }

    private void writeDataLines() {
        int rowCount = 7;

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(12);
        style.setFont(font);

        for (PostulanteListaDTO user : listUsers) {
            Row row = sheet.createRow(rowCount++);
            int columnCount = 0;

            StringBuilder tecno = new StringBuilder();
            for(PostulanteTecnologia tecnologia: user.getTecnologias()){
                tecno.append(tecnologia.getTecnologia().getNombre()).append(" ");
            }

            createCell(row, columnCount++, user.getNombre() + " " + user.getApellido(), style);
            createCell(row, columnCount++, user.getNivelIngles().intValue(), style);
            createCell(row, columnCount++, user.getExperienciaMeses().intValue(), style);
            createCell(row, columnCount++, tecno.toString(), style);
            createCell(row, columnCount++, user.getEstado().getEstado(), style);
            tecno.delete(0, tecno.length()-1);
        }

        Row row = sheet.createRow(4);
        createCell(row, 0, filtros.get("nombre"), style);
        createCell(row, 1, filtros.get("nivelIngles"), style);
        createCell(row, 2, filtros.get("experienciaEnMeses"), style);
        createCell(row, 3, filtros.get("tecnologia"), style);
        createCell(row, 4, filtros.get("nivelTecnologia"), style);
        createCell(row, 5, filtros.get("institucion"), style);
        createCell(row, 6, filtros.get("estado"), style);
        createCell(row, 7, filtros.get("convocatoria"), style);
        createCell(row, 8, filtros.get("convocatoriaFecha"), style);
    }

    public void export(HttpServletResponse response) throws IOException {
        writeHeaderLine();
        writeDataLines();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();

        outputStream.close();

    }
}