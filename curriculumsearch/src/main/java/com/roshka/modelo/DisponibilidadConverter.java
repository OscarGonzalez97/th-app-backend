package com.roshka.modelo;

import java.util.Arrays;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class DisponibilidadConverter implements AttributeConverter<Disponibilidad, String> {
 
    @Override
    public String convertToDatabaseColumn(Disponibilidad modalidad) {
        if (modalidad == null) {
            return null;
        }
        return modalidad.getCode();
    }

    @Override
    public Disponibilidad convertToEntityAttribute(String code) {
        if (code == null) {
            return null;
        }
        
        return Arrays.stream(Disponibilidad.values())
          .filter(c -> c.getCode().equals(code))
          .findFirst()
          .orElseThrow(IllegalArgumentException::new);
    }
}