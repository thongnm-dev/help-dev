package Gateway;

import Common.BaseGateway;
import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.Query;
import Model.TableIF;
import javax.persistence.EntityManager;

@Stateless
public class TableGateway extends BaseGateway<TableIF> {

    public Collection<TableIF> GetTables(Long project) {

        Query wQuery = getEntityManager().createNamedQuery("GET_ALL_TABLE");

        wQuery.setParameter("project", project);

        return wQuery.getResultList();
    }

    public Collection<TableIF> GetTables(EntityManager manager, String nspname) {

        StringBuilder wSqlstr = new StringBuilder();
        wSqlstr.append(" SELECT ");
        wSqlstr.append("     C.relname AS physical ");
        wSqlstr.append("   , pg_catalog.obj_description(C.oid, 'pg_class') AS logical ");
        wSqlstr.append("   , '' AS logical_v ");
        wSqlstr.append(" From ");
        wSqlstr.append("   pg_class C ");
        wSqlstr.append("   LEFT JOIN pg_namespace N ");
        wSqlstr.append("     ON N.oid = C.relnamespace ");
        wSqlstr.append(" WHERE ");
        wSqlstr.append("   N.nspname = ?nspname ");
        wSqlstr.append("   AND C.relkind = 'r' ");
        wSqlstr.append(" ORDER BY ");
        wSqlstr.append("   C.relname ASC ");

        Query wQuery = manager.createNativeQuery(wSqlstr.toString(), TableIF.class);

        wQuery.setParameter("nspname", nspname);

        return wQuery.getResultList();
    }
}
