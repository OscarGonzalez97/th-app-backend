package com.roshka.service;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import com.roshka.modelo.Estudio;
import com.roshka.modelo.Experiencia;
import com.roshka.modelo.Postulante;
import com.roshka.utils.Helper;
import org.springframework.stereotype.Component;

import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.stream.Collectors;

@Component("pdfGenerator")
public class PdfGenerator {

	private static Font COURIER = new Font(Font.FontFamily.COURIER, 20, Font.BOLD);
	private static Font COURIER_MEDIUM = new Font(Font.FontFamily.COURIER, 16, Font.BOLD);
	private static Font COURIER_SMALL = new Font(Font.FontFamily.COURIER, 14, Font.UNDERLINE);

	public byte[] generatePdfReport(Postulante postulante) {

		Document document = new Document();

		try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			PdfWriter.getInstance(document, byteArrayOutputStream);
			document.open();
			
			addDocTitle(document, postulante);
			createTable(document,postulante);
			
            
			document.close();
			System.out.println("------------------Your PDF Report is ready!-------------------------");
            return byteArrayOutputStream.toByteArray();

		} catch ( DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
            return null;
		}

	}

	private void addDocTitle(Document document, Postulante postulante) throws DocumentException {
		Paragraph p1 = new Paragraph();
		leaveEmptyLine(p1, 1);
		p1.add(new Paragraph("Detalles del postulante", COURIER));
		p1.setAlignment(Element.ALIGN_CENTER);
		document.add(p1);

	}
	private void agregarEncabezado(Document document, String titulo) throws DocumentException {
		
		Paragraph p1 = new Paragraph();
		p1.setAlignment(Element.ALIGN_CENTER);
		p1.add(new Paragraph(titulo, COURIER_MEDIUM));
		document.add(p1);

	}
	private void agregarSubEncabezado(Document document, String titulo) throws DocumentException {
		
		Paragraph p1 = new Paragraph();
		p1.setAlignment(Element.ALIGN_CENTER);
		p1.add(new Paragraph(titulo, COURIER_SMALL));
		document.add(p1);

	}

	private void agregarLabelTexto(Document document, String label, Object texto) throws DocumentException{
		if(texto == null) return;
		if(texto instanceof Date) texto = Helper.formatDate((Date)texto, "dd-MM-yyyy");
		Paragraph paragraph = new Paragraph();
		paragraph.add(label + ": ");
		paragraph.add(texto.toString());
		document.add(paragraph);
	}

 	private void createTable(Document document, Postulante postulante) throws DocumentException {
        
		Paragraph paragraph = new Paragraph();
		leaveEmptyLine(paragraph, 3);
        //paragraph.add();
		agregarEncabezado(document, "Datos personales");
        agregarLabelTexto(document, "Nombre", postulante.getNombre() + " " + postulante.getApellido());
        agregarLabelTexto(document, "Nro de Documento", postulante.getNroDocument());
        agregarLabelTexto(document, "Correo", postulante.getCorreo());
        agregarLabelTexto(document, "Direccion", postulante.getDireccion());
        agregarLabelTexto(document, "Ciudad", postulante.getCiudad().getNombre());
        agregarLabelTexto(document, "Telefono", postulante.getTelefono());
        agregarLabelTexto(document, "Edad", Helper.calculateAge(postulante.getFechaNacimiento()) );
        agregarLabelTexto(document, "Nivel de Ingles", postulante.getNivelIngles());
        agregarLabelTexto(document, "Nacionalidad", postulante.getNacionalidad().getDescripcion());

		agregarEncabezado(document, "Experiencias");

		for(Experiencia ex : postulante.getExperiencias()){
			agregarSubEncabezado(document, ex.getInstitucion());
			agregarLabelTexto(document, "Fecha Inicio", ex.getFechaDesde());
			agregarLabelTexto(document, "Fecha Fin", ex.getFechaHasta());
			agregarLabelTexto(document, "Cargo", ex.getCargo());
			agregarLabelTexto(document, "Tipo Experiencia", ex.getTipoExperiencia());
			agregarLabelTexto(document, "Descripcion", ex.getDescripcion());
			agregarLabelTexto(document, "Nombre Referencia", ex.getNombreReferencia());
			agregarLabelTexto(document, "Telefono Referencia", ex.getTelefonoReferencia());
			agregarLabelTexto(document, "Motivo Salida", ex.getMotivoSalida());
		}
		agregarEncabezado(document, "Estudios");

		for(Estudio ex : postulante.getEstudios()){
			agregarSubEncabezado(document, ex.getInstitucion().getNombre());
			agregarLabelTexto(document, "Fecha Inicio", ex.getFechaDesde());
			agregarLabelTexto(document, "Fecha Fin", ex.getFechaHasta());
			agregarLabelTexto(document, "Tema de Estudio", ex.getTemaDeEstudio());
			agregarLabelTexto(document, "Tipo de Estudio", ex.getTipoDeEstudio());
			agregarLabelTexto(document, "Descripcion", ex.getEstado().toString());
		}

		agregarEncabezado(document, "Cargo al cual postula");
		
		agregarList(postulante.getPostulaciones().stream()
					.map(cc -> cc.getCargo().getNombre())
					.collect(Collectors.toList()), document);
		
		agregarEncabezado(document, "Tecnologias");
		
		agregarList(postulante.getTecnologias().stream()
			.map(cc -> cc.getTecnologia().getNombre())
			.collect(Collectors.toList()), 
			document);

		agregarEncabezado(document, "Referencias Personales");

		agregarList(postulante.getReferencias().stream()
			.map(cc -> "Nombre: " + cc.getNombre() + ". Relacion: " + cc.getRelacion() +  ". Telefono: " + cc.getTelefono() )
			.collect(Collectors.toList()), 
			document);


	} 

	private void agregarList(java.util.List<String> items, Document document) throws DocumentException{
		List list = new List(false);
		for(String item : items){
			list.add(new ListItem(item));
		}
		document.add(list);
		
 
	}
	private static void leaveEmptyLine(Paragraph paragraph, int number) {
		for (int i = 0; i < number; i++) {
			paragraph.add(new Paragraph(" "));
		}
	}
	
}
