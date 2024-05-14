package gateway;

import common.BaseGateway;
import java.util.Collection;
import jakarta.ejb.Stateless;
import jakarta.persistence.Query;
import entity.TableIF;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.Map;
import java.util.Objects;
import org.eclipse.persistence.config.ResultType;
 import org.eclipse.persistence.config.QueryHints;

@Stateless
public class TableGateway extends BaseGateway<TableIF> {

    public Collection<TableIF> GetTables(Long projectId) {

        CriteriaBuilder criteriaBuilder = getCriteriaBuilder();
        
        CriteriaQuery<TableIF> criteriaQuery = criteriaBuilder.createQuery(TableIF.class);
        Root<TableIF> userRoot = criteriaQuery.from(TableIF.class);
        
        if (Objects.nonNull(projectId)) {
            criteriaQuery.where(criteriaBuilder.equal(userRoot.get("projectId"), projectId));
        }
        
        return Query(criteriaQuery).getResultList();        
    }

    public Collection<Map<String, Object>> GetTables(EntityManager manager, String nspname) {

        StringBuilder wSqlstr = new StringBuilder();
        wSqlstr.append(" SELECT ");
        wSqlstr.append("     C.relname AS physical ");
        wSqlstr.append("   , pg_catalog.obj_description(C.oid, 'pg_class') AS logical ");
        wSqlstr.append("   , '' AS logical_v ");
        wSqlstr.append(" From ");
        wSqlstr.append("   pg_class C ");
        wSqlstr.append("   LEFT JOIN pg_namespace N ");
        wSqlstr.append("     ON N.oid = C.relnamespace ");
        wSqlstr.append(" WHERE 1 = 1 ");
        wSqlstr.append("   AND N.nspname = ?nspname ");
        wSqlstr.append("   AND C.relkind = 'r' ");
        wSqlstr.append(" ORDER BY ");
        wSqlstr.append("   C.relname ASC ");

        Query wQuery = manager.createNativeQuery(wSqlstr.toString());
        wQuery.setHint(QueryHints.RESULT_TYPE, ResultType.Map);
        wQuery.setParameter("nspname", nspname);

        return wQuery.getResultList();
    }
}
