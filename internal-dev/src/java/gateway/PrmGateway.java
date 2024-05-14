package gateway;

import common.BaseGateway;
import entity.PrmIF;
import entity.PrmIF_;
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
        
        criteriaQuery.where(criteriaBuilder.equal(root.get(PrmIF_.prmCd), prmCd));
        
        criteriaQuery.orderBy(criteriaBuilder.asc(root.get(PrmIF_.orderBy)));
        
        return Query(criteriaQuery).getResultList();
    }
}
