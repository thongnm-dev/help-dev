package common;

import jakarta.faces.context.FacesContext;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.primefaces.model.FilterMeta;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortMeta;
import org.primefaces.model.filter.FilterConstraint;
import org.primefaces.util.LocaleUtils;

/**
 *
 * @author thongnm
 * @param <T>
 */
public class BaseLazyDataModel<T> extends LazyDataModel<T> {

    private final Collection<T> dataSource;

    public BaseLazyDataModel(Collection<T> dataSource) {
        super();

        this.dataSource = dataSource;
    }

    @Override
    public int count(Map<String, FilterMeta> filterBy) {
        
        if (filterBy.isEmpty()) {
            return dataSource.size();
        }
        
        return (int) dataSource.stream().filter(row -> filter(FacesContext.getCurrentInstance(), filterBy.values() ,row)).count();
    }

    @Override
    public List<T> load(int pFirst, int pPageSize, Map<String, SortMeta> sort, Map<String, FilterMeta> filterBy) {
        List<T> wResultList = dataSource.stream()
                .skip(pFirst)
                .filter(row -> filter(FacesContext.getCurrentInstance(), filterBy.values() ,row))
                .limit(pPageSize)
                .collect(Collectors.toList());

        return wResultList;
    }

    private boolean filter(FacesContext context, Collection<FilterMeta> filterBy, T model) {
        boolean matching = true;

        for (FilterMeta filter : filterBy) {
            FilterConstraint constraint = filter.getConstraint();
            Object filterValue = filter.getFilterValue();

            try {

                Field field = model.getClass().getDeclaredField(filter.getField());
                field.setAccessible(true);

                matching = constraint.isMatching(context, field.get(model), filterValue, LocaleUtils.getCurrentLocale());
            } catch (Exception e) {
                matching = false;
            }

            if (!matching) {
                break;
            }
        }

        return matching;
    }
}
