package gateway;

import common.BaseGateway;
import entity.TableColumnIF;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.Collection;
import java.util.Map;
import org.eclipse.persistence.config.QueryHints;
import org.eclipse.persistence.config.ResultType;

@Stateless
public class TableColumnGateway extends BaseGateway<TableColumnIF> {

    public Collection<TableColumnIF> GetTableColumns(Long projectId, String tableName) {
        CriteriaBuilder criteriaBuilder = getCriteriaBuilder();

        CriteriaQuery<TableColumnIF> criteriaQuery = criteriaBuilder.createQuery(TableColumnIF.class);
        Root<TableColumnIF> userRoot = criteriaQuery.from(TableColumnIF.class);

        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("projectId"), projectId));

        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("tableName"), tableName));

        return Query(criteriaQuery).getResultList();
    }

    public Collection<Map<String, Object>> GetTableColumns(EntityManager manager, String nspname, String tableName) {
        StringBuilder wSqlstr = new StringBuilder();
        wSqlstr.append(" WITH tables AS ( ");
        wSqlstr.append("     SELECT c.oid, ");
        wSqlstr.append("            ns.nspname as schema_name, ");
        wSqlstr.append("            c.relname as table_name, ");
        wSqlstr.append("            d.description as table_description, ");
        wSqlstr.append("            pg_get_userbyid(c.relowner) AS table_owner ");
        wSqlstr.append("     FROM pg_catalog.pg_class AS c ");
        wSqlstr.append("     JOIN pg_catalog.pg_namespace AS ns ");
        wSqlstr.append("       ON c.relnamespace = ns.oid ");
        wSqlstr.append("     LEFT JOIN pg_catalog.pg_description d ");
        wSqlstr.append("       on c.oid = d.objoid ");
        wSqlstr.append("      and d.objsubid = 0 ");
        wSqlstr.append("      WHERE ns.nspname not in ('pg_catalog') ");
        wSqlstr.append(" ) ");
        wSqlstr.append(" SELECT ");
        wSqlstr.append("          c.ordinal_position AS id ");
        wSqlstr.append("        , c.column_name AS physical ");
        wSqlstr.append("        , (CASE WHEN c.data_type = 'character varying' ");
        wSqlstr.append("                    THEN c.data_type || '(' || c.character_maximum_length || ')' ");
        wSqlstr.append("                WHEN c.data_type = 'numeric' ");
        wSqlstr.append("                    THEN c.data_type ");
        wSqlstr.append("                ELSE c.data_type ");
        wSqlstr.append("           END)::character varying AS data_type ");
        wSqlstr.append("        , (CASE WHEN kcu.column_name IS NOT NULL THEN true ELSE false END)::boolean AS pk ");
        wSqlstr.append("        , (CASE WHEN c.is_nullable = 'YES' THEN true ELSE false END)::boolean AS nullable ");
        wSqlstr.append("        , d.description as logical ");
        wSqlstr.append("        , cast(nullif(c.numeric_precision, null) as int) numeric_precision ");
        wSqlstr.append("        , cast(nullif(c.numeric_scale, null) as int) numeric_scale ");
        wSqlstr.append("        ,c.ordinal_position ");
        wSqlstr.append(" from tables t ");
        wSqlstr.append(" join information_schema.columns c ");
        wSqlstr.append("     on c.table_schema = t.schema_name ");
        wSqlstr.append("    and c.table_name = t.table_name ");
        wSqlstr.append(" left join pg_catalog.pg_description d ");
        wSqlstr.append("    ON d.objoid = t.oid ");
        wSqlstr.append("   AND d.objsubid = c.ordinal_position ");
        wSqlstr.append("   AND d.objsubid > 0 ");
        wSqlstr.append("      left join information_schema.key_column_usage kcu ");
        wSqlstr.append("          on c.table_schema = kcu.table_schema ");
        wSqlstr.append("          and c.table_name = kcu.table_name ");
        wSqlstr.append("          and c.column_name = kcu.column_name ");
        wSqlstr.append(" where 1=1 ");
        wSqlstr.append("    and t.schema_name = ?nspname ");
        wSqlstr.append("    and t.table_name = ?tblname ");
        wSqlstr.append(" order by ");
        wSqlstr.append("     t.schema_name, ");
        wSqlstr.append("     t.table_name, ");
        wSqlstr.append("     c.ordinal_position ");

        Query wQuery = manager.createNativeQuery(wSqlstr.toString());
        wQuery.setHint(QueryHints.RESULT_TYPE, ResultType.Map);
        wQuery.setParameter("nspname", nspname);
        wQuery.setParameter("tblname", tableName);

        return wQuery.getResultList();
    }
}
