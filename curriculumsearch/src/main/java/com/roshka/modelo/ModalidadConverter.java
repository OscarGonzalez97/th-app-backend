package com.roshka.modelo;

import java.util.Arrays;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class ModalidadConverter implements AttributeConverter<Modalidad, String> {
 
    @Override
    public String convertToDatabaseColumn(Modalidad modalidad) {
        if (modalidad == null) {
            return null;
        }
        return modalidad.getCode();
    }

    @Override
    public Modalidad convertToEntityAttribute(String code) {
        if (code == null) {
            return null;
        }
        
        return Arrays.stream(Modalidad.values())
          .filter(c -> c.getCode().equals(code))
          .findFirst()
          .orElseThrow(IllegalArgumentException::new);
    }
}
