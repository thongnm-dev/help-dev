package gateway;

import common.BaseGateway;
import java.util.Collection;
import jakarta.ejb.Stateless;
import jakarta.persistence.Query;
import entity.ProjectIF;

@Stateless
public class ProjectGateway extends BaseGateway<ProjectIF> {

    public Collection<ProjectIF> GetAll() {

        Query query = getEntityManager().createNamedQuery("GET_ALL_PROJECT");

        return query.getResultList();
    }
}
