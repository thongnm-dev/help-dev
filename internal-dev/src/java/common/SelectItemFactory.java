package common;

import jakarta.faces.model.SelectItem;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

/**
 *
 * @author thongnm
 */
public enum SelectItemFactory {
    INSTANCE;
    
    private final SelectItem noSelectionItem = new SelectItem("", "（Chưa chọn）");
    
    /**
     * 
     * @param <E>
     * @param values
     * @param hasNoSelection
     * @param valueFactory
     * @param labelFactory
     * @return 
     */
    public <E> SelectItem[] create(Iterable<E> values, boolean hasNoSelection, Function<E, Object> valueFactory, Function<E, String> labelFactory) {
        List<SelectItem> items = StreamSupport.stream(values.spliterator(), false)
                .map(value -> new SelectItem(valueFactory.apply(value), labelFactory.apply(value)))
                .collect(Collectors.toList());
        if (hasNoSelection) {
            items.add(0, noSelectionItem);
        }
        return items.toArray(SelectItem[]::new);

    }
}
