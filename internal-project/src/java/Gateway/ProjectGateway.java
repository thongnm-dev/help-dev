
package Gateway;

import Common.BaseGateway;
import java.util.Collection;
import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.Query;
import Model.ProjectIF;

@Stateless
public class ProjectGateway extends BaseGateway<ProjectIF> {


    public Collection<ProjectIF> GetAll(Date fromDate) {

        Query query = getEntityManager().createNamedQuery("GET_ALL_PROJECT");

//        query.setParameter("fromdate", fromDate);

        return query.getResultList();
    }

//    CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();
//    CriteriaQuery<UserEntity> criteriaQuery = criteriaBuilder.createQuery(UserEntity.class);
//    Root<UserEntity> userRoot = criteriaQuery.from(UserEntity.class);
//    UserEntity queryResult = getEntityManager().createQuery(criteriaQuery.select(userRoot)
//      .where(criteriaBuilder.equal(userRoot.get("id"), id)))
//      .getSingleResult();
//    return queryResult;
}
