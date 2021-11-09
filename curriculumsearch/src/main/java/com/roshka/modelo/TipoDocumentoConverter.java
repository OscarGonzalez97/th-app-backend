package com.roshka.modelo;

import java.util.Arrays;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class TipoDocumentoConverter implements AttributeConverter<TipoDocumento, String> {
 
    @Override
    public String convertToDatabaseColumn(TipoDocumento modalidad) {
        if (modalidad == null) {
            return null;
        }
        return modalidad.getCode();
    }

    @Override
    public TipoDocumento convertToEntityAttribute(String code) {
        if (code == null) {
            return null;
        }
        
        return Arrays.stream(TipoDocumento.values())
          .filter(c -> c.getCode().equals(code))
          .findFirst()
          .orElseThrow(IllegalArgumentException::new);
    }
}

