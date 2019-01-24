package pl.kubieniec.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.kubieniec.model.Technology;
import pl.kubieniec.repository.TechnologyRepository;

public class TechnologyConverter implements Converter<String, Technology> {
    @Autowired
    private TechnologyRepository technologyRepository;

    @Override
    public Technology convert(String s) {
        return technologyRepository.findOne(Long.parseLong(s));
    }

}
