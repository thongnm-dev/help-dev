
package Common;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.function.Predicate;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Order;
import lombok.AccessLevel;
import lombok.Getter;

public class BaseGateway<T> {

    private Class<T> entityType;

    @PersistenceContext
    @Getter(AccessLevel.PROTECTED)
    private EntityManager entityManager;

    protected CriteriaBuilder getCriteriaBuilder() {
        return entityManager.getCriteriaBuilder();
    }

    protected List<T> findAll() throws Exception {

        return new ArrayList<>();
    }

    protected T find() throws Exception {
        return entityType.newInstance();
    }

    protected List<T> query(Function<?, Predicate[]> filters, Function<?, Order[]> orders) {
        return new ArrayList<>();
    }
}
