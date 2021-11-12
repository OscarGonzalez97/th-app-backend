package com.roshka.modelo;

import java.util.Arrays;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class EstadoPostulanteConverter implements AttributeConverter<EstadoPostulante, String>, org.springframework.core.convert.converter.Converter<String,EstadoPostulante> {
 
    @Override
    public String convertToDatabaseColumn(EstadoPostulante modalidad) {
        if (modalidad == null) {
            return null;
        }
        return modalidad.getEstado();
    }

    @Override
    public EstadoPostulante convertToEntityAttribute(String estado) {
        if (estado == null) {
            return null;
        }
        
        return Arrays.stream(EstadoPostulante.values())
          .filter(c -> c.getEstado().equals(estado))
          .findFirst()
          .orElseThrow(IllegalArgumentException::new);
    }

    @Override
    public EstadoPostulante convert(String arg0) {
        return convertToEntityAttribute(arg0);
    }
}
