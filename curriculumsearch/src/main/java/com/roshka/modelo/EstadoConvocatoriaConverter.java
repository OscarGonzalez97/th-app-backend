package com.roshka.modelo;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.Arrays;

@Converter(autoApply = true)
public class EstadoConvocatoriaConverter implements AttributeConverter<EstadoConvocatoria, String>, org.springframework.core.convert.converter.Converter<String,EstadoConvocatoria>  {
    @Override
    public String convertToDatabaseColumn(EstadoConvocatoria modalidad) {
        if (modalidad == null) {
            return null;
        }
        return modalidad.getDescripcion();
    }


    @Override
    public EstadoConvocatoria convert(String arg0) {
        return convertToEntityAttribute(arg0);
    }

    @Override
    public EstadoConvocatoria convertToEntityAttribute(String estado) {
        if (estado == null) {
            return null;
        }
        
        return Arrays.stream(EstadoConvocatoria.values())
          .filter(c -> c.getDescripcion().equals(estado))
          .findFirst()
          .orElseThrow(IllegalArgumentException::new);
    }
}
