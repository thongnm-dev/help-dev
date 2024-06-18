package gateway;

import common.BaseGateway;
import entity.NoteIF;
import jakarta.ejb.Stateless;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.Optional;
import jakarta.persistence.criteria.CriteriaBuilder;

@Stateless
public class NoteGateway extends BaseGateway {

    public Optional<NoteIF> GetNote(Long project, String pType) {
        CriteriaBuilder criteriaBuilder = CriteriaBuilder();

        CriteriaQuery<NoteIF> criteriaQuery = criteriaBuilder.createQuery(NoteIF.class);
        Root<NoteIF> root = criteriaQuery.from(NoteIF.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get("project_id"), project));
        criteriaQuery.where(criteriaBuilder.equal(root.get("note_type"), pType));

        return Query(criteriaQuery).getResultStream().findFirst();
    }

    public void insert(NoteIF model) {

        getEntityManager().persist(model);
    }
}
