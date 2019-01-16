package converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.ProgrammingLanguage;
import pl.kubieniec.repository.CategoryRepository;
import pl.kubieniec.repository.ProgrammingLanguageRepository;

public class ProgrammingLanguageConverter implements Converter<String, ProgrammingLanguage> {
    @Autowired
    private ProgrammingLanguageRepository programmingLanguageRepository;

    @Override
    public ProgrammingLanguage convert(String s) {
        return programmingLanguageRepository.findOne(Long.parseLong(s));
    }

}
