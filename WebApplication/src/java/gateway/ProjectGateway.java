package gateway;

import common.BaseGateway;
import java.util.Collection;
import jakarta.ejb.Stateless;
import jakarta.persistence.Query;
import entity.ProjectIF;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.Objects;

@Stateless
public class ProjectGateway extends BaseGateway {

    public Collection<ProjectIF> GetAll() {

        Query query = getEntityManager().createNamedQuery("GET_ALL_PROJECT");

        return query.getResultList();
    }

    public ProjectIF GetById(Long projectId) {
        CriteriaBuilder criteriaBuilder = CriteriaBuilder();

        CriteriaQuery<ProjectIF> criteriaQuery = criteriaBuilder.createQuery(ProjectIF.class);
        Root<ProjectIF> userRoot = criteriaQuery.from(ProjectIF.class);

        if (Objects.nonNull(projectId)) {
            criteriaQuery.where(criteriaBuilder.equal(userRoot.get("id"), projectId));
        }

        return Query(criteriaQuery).getSingleResult();
    }
}
