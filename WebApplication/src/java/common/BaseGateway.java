
package common;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import lombok.AccessLevel;
import lombok.Getter;

public class BaseGateway {

    @PersistenceContext(name = "DevPU")
    @Getter(AccessLevel.PROTECTED)
    private EntityManager entityManager;

    protected CriteriaBuilder CriteriaBuilder() {
        return entityManager.getCriteriaBuilder();
    }
    
    protected <R> TypedQuery<R> Query(CriteriaQuery<R> criteriaQuery) {
        return entityManager.createQuery(criteriaQuery);
    }
}
