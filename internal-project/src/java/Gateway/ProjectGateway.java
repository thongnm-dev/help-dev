
package Gateway;

import Common.BaseGateway;
import java.util.Collection;
import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.Query;
import Model.ProjectIF;
import Model.ProjectIF_;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

@Stateless
public class ProjectGateway extends BaseGateway<ProjectIF> {


    public Collection<ProjectIF> GetAll(Date fromDate) {

        Query query = getEntityManager().createNamedQuery("GET_ALL_PROJECT");

//        query.setParameter("fromdate", fromDate);

        return query.getResultList();
    }

    public  ProjectIF GetById(Long id) {
        CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<ProjectIF> criteriaQuery = criteriaBuilder.createQuery(ProjectIF.class);
        Root<ProjectIF> userRoot = criteriaQuery.from(ProjectIF.class);

        return getEntityManager().createQuery(criteriaQuery.select(userRoot)
                  .where(criteriaBuilder.equal(userRoot.get(ProjectIF_.id), id)))
                 .getSingleResult();
    }

//    CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();
//    CriteriaQuery<UserEntity> criteriaQuery = criteriaBuilder.createQuery(UserEntity.class);
//    Root<UserEntity> userRoot = criteriaQuery.from(UserEntity.class);
//    UserEntity queryResult = getEntityManager().createQuery(criteriaQuery.select(userRoot)
//      .where(criteriaBuilder.equal(userRoot.get("id"), id)))
//      .getSingleResult();
//    return queryResult;
}
