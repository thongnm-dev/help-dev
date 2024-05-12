
package gateway;

import common.BaseGateway;
import entity.FuncIf;
import entity.FuncIf_;
import jakarta.ejb.Stateless;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.Collection;
import java.util.Objects;

@Stateless
public class FuncGateway extends BaseGateway<FuncIf> {

    public Collection<FuncIf> GetFuncs(Long projectId) {
        
        CriteriaBuilder criteriaBuilder = getCriteriaBuilder();
        
        CriteriaQuery<FuncIf> criteriaQuery = criteriaBuilder.createQuery(FuncIf.class);
        Root<FuncIf> userRoot = criteriaQuery.from(FuncIf.class);
        
        if (Objects.nonNull(projectId)) {
            criteriaQuery.where(criteriaBuilder.equal(userRoot.get(FuncIf_.project), projectId));
        }
        
        return Query(criteriaQuery).getResultList();
    }
}
