package gateway;

import common.BaseGateway;
import entity.PrmIF;
import jakarta.ejb.Stateless;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.Collection;

@Stateless
public class PrmGateway extends BaseGateway<PrmIF> {
    
    
    public Collection<PrmIF> GetPrms(String prmCd) {
        CriteriaBuilder criteriaBuilder = getCriteriaBuilder();
        
        CriteriaQuery<PrmIF> criteriaQuery = criteriaBuilder.createQuery(PrmIF.class);
        Root<PrmIF> root = criteriaQuery.from(PrmIF.class);
        
        criteriaQuery.where(criteriaBuilder.equal(root.get("prmCd"), prmCd));
        
        criteriaQuery.orderBy(criteriaBuilder.asc(root.get("orderBy")));
        
        return Query(criteriaQuery).getResultList();
    }
}
