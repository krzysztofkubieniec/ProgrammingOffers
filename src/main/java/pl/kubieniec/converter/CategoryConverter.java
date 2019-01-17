package pl.kubieniec.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.kubieniec.model.Category;
import pl.kubieniec.repository.CategoryRepository;

public class CategoryConverter implements Converter<String, Category> {
    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public Category convert(String s) {
        return categoryRepository.findOne(Long.parseLong(s));
    }

}
