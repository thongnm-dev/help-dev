package common;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.primefaces.model.LazyDataModel;

/**
 *
 * @author thongnm
 */
public class BaseLazyDataModel<T> extends LazyDataModel<T> {

    private final Collection<T> dataSource;

    public BaseLazyDataModel(Collection<T> dataSource) {
        super();

        this.dataSource = dataSource;
    }

    @Override
    public int count(Map map) {
        return dataSource.size();
    }

    @Override
    public List load(int pFirst, int pPageSize, Map map, Map map1) {
        List<T> wResultList = dataSource.stream()
                .skip(pFirst)
                .limit(pPageSize)
                .collect(Collectors.toList());

        return wResultList;
    }

}
