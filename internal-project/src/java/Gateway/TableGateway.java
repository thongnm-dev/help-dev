package Gateway;

import Common.BaseGateway;
import java.util.Collection;
import java.util.Map;
import javax.ejb.Stateless;
import javax.persistence.Query;
import Model.TableIF;

@Stateless
public class TableGateway extends BaseGateway<TableIF> {

    public Collection<TableIF> GetAll(Long project) {

        Query query = getEntityManager().createNamedQuery("GET_ALL_TABLE");

        query.setParameter("project", project);

        return query.getResultList();
    }

    public Collection<TableIF> GetTables(Map<String, Object> params) {
        StringBuilder wSqlQuery = new StringBuilder();

        wSqlQuery.append(" SELECT ");
        wSqlQuery.append(" t.* ");
        wSqlQuery.append(" FROM ");
        wSqlQuery.append("     t_table T ");
        wSqlQuery.append(" WHERE 1 = 1 ");

        wSqlQuery.append(" AND t.project_id = ?project_id");

        if (params.containsKey("physical")) {
            wSqlQuery.append(" AND regexp_replace(t.physical, '[　\\s]', '', 'g') = regexp_replace(?physical, '[　\\s]', '', 'g')");
        }

        if (params.containsKey("logical")) {
            wSqlQuery.append(" AND ( ");
            wSqlQuery.append("          regexp_replace(t.logical, '[　\\s]', '', 'g') = regexp_replace(?logical, '[　\\s]', '', 'g')");
            wSqlQuery.append("       OR regexp_replace(t.logical_v, '[　\\s]', '', 'g') = regexp_replace(?logical, '[　\\s]', '', 'g')");
            wSqlQuery.append(" ) ");
        }

        Query query = getEntityManager().createNativeQuery(wSqlQuery.toString(), TableIF.class);

        query.setParameter("project_id", params.get("project"));

        if (params.containsKey("physical")) {
            query.setParameter("physical", params.get("physical"));
        }

        if (params.containsKey("logical")) {
            query.setParameter("logical", params.get("logical"));
        }

        return query.getResultList();
    }
}
