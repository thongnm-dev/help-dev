package gateway;

import common.BaseGateway;
import java.util.Collection;
import java.util.Date;
import jakarta.ejb.Stateless;
import jakarta.persistence.Query;
import entity.ProjectIF;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

@Stateless
public class ProjectGateway extends BaseGateway<ProjectIF> {

    public Collection<ProjectIF> GetAll(Date fromDate) {

        Query query = getEntityManager().createNamedQuery("GET_ALL_PROJECT");

//        query.setParameter("fromdate", fromDate);
        return query.getResultList();
    }

    public ProjectIF GetById(Long id) {
        CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<ProjectIF> criteriaQuery = criteriaBuilder.createQuery(ProjectIF.class);
        Root<ProjectIF> userRoot = criteriaQuery.from(ProjectIF.class);

//        return getEntityManager().createQuery(criteriaQuery.select(userRoot)
//                  .where(criteriaBuilder.equal(userRoot.get(ProjectIF_.id), id)))
//                 .getSingleResult();
        return null;
    }

//    CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();
//    CriteriaQuery<UserEntity> criteriaQuery = criteriaBuilder.createQuery(UserEntity.class);
//    Root<UserEntity> userRoot = criteriaQuery.from(UserEntity.class);
//    UserEntity queryResult = getEntityManager().createQuery(criteriaQuery.select(userRoot)
//      .where(criteriaBuilder.equal(userRoot.get("id"), id)))
//      .getSingleResult();
//    return queryResult;
}
