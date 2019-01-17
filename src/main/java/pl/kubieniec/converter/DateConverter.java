package pl.kubieniec.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.kubieniec.model.Category;
import pl.kubieniec.repository.CategoryRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter implements Converter<String, Date> {

    @Override
    public Date convert(String s) {
        Date date = null;
        try {
            if (s.equals("")) {
                return null;
            } else if (!s.contains("T") && (s.contains(":"))) {
                date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(s);
            } else if (s.contains(":") && (s.contains("T"))) {
                date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(s);
            } else {
                date = new SimpleDateFormat("yyyy-MM-dd").parse(s);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
