package gateway;

import common.BaseGateway;
import entity.TableColumnIF;
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
public class TableGateway extends BaseGateway {

    public Collection<TableIF> GetTables(Long projectId) {

        CriteriaBuilder criteriaBuilder = CriteriaBuilder();

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

    public Collection<TableColumnIF> GetTableColumns(Long projectId, String tableName) {
        CriteriaBuilder criteriaBuilder = CriteriaBuilder();

        CriteriaQuery<TableColumnIF> criteriaQuery = criteriaBuilder.createQuery(TableColumnIF.class);
        Root<TableColumnIF> userRoot = criteriaQuery.from(TableColumnIF.class);

        //where
        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("projectId"), projectId));
        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("tableName"), tableName));
        
        // order by
        criteriaQuery.orderBy(criteriaBuilder.asc(userRoot.get("physical")));

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
        wSqlstr.append("                    THEN ");
        wSqlstr.append("                         (CASE WHEN c.numeric_precision IS NOT NULL AND c.numeric_scale IS NOT NULL AND c.numeric_scale <> 0 ");
        wSqlstr.append("                                THEN c.data_type || '(' || c.numeric_precision || ',' || c.numeric_scale || ')'");
        wSqlstr.append("                              WHEN c.numeric_precision IS NOT NULL AND (c.numeric_scale IS NULL OR c.numeric_scale = 0 ) ");
        wSqlstr.append("                                THEN c.data_type || '(' || c.numeric_precision || ')'");
        wSqlstr.append("                              ELSE c.data_type ");
        wSqlstr.append("                         END::character varying)");
        wSqlstr.append("                ELSE c.data_type ");
        wSqlstr.append("           END)::character varying AS data_type ");
        wSqlstr.append("        , (CASE WHEN kcu.column_name IS NOT NULL THEN true ELSE false END)::boolean AS pk ");
        wSqlstr.append("        , (CASE WHEN c.is_nullable = 'YES' THEN true ELSE false END)::boolean AS nullable ");
        wSqlstr.append("        , d.description as logical ");
        wSqlstr.append("        , cast(nullif(c.numeric_precision, null) as int) numeric_precision ");
        wSqlstr.append("        , cast(nullif(c.numeric_scale, null) as int) numeric_scale ");
        wSqlstr.append("        ,c.ordinal_position ");
        wSqlstr.append("        ,c.character_maximum_length AS max_length ");
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
        wSqlstr.append("     c.column_name ");
//        wSqlstr.append("    ,c.ordinal_position ");

        Query wQuery = manager.createNativeQuery(wSqlstr.toString());
        wQuery.setHint(QueryHints.RESULT_TYPE, ResultType.Map);
        wQuery.setParameter("nspname", nspname);
        wQuery.setParameter("tblname", tableName);

        return wQuery.getResultList();
    }

    public Collection<Map<String, Object>> GetDomains(Long projectId, Map<String, Object> param) {
        StringBuilder wSqlstr = new StringBuilder();

        wSqlstr.append(" select ");
        wSqlstr.append("      t1.physical AS table_physical ");
        wSqlstr.append("     ,t1.logical AS table_logical ");
        wSqlstr.append("     ,t2.physical ");
        wSqlstr.append("     ,t2.logical ");
        wSqlstr.append("     ,t2.data_type ");
        wSqlstr.append("     ,t2.is_fk AS pk ");
        wSqlstr.append("     ,t2.nullable ");
        wSqlstr.append(" from t_table t1 ");
        wSqlstr.append(" inner join t_table_dtl t2 ");
        wSqlstr.append("         on t1.physical = t2.table_name ");
        wSqlstr.append("         AND t1.project_id = t2.project_id ");
        wSqlstr.append(" where 1 = 1");
        wSqlstr.append("    AND t1.project_id = ?project_id ");

        if (param.containsKey("keyword_table")) {
            wSqlstr.append("    AND ( t1.physical LIKE ?keyword_table ");
            wSqlstr.append("         OR t1.logical LIKE ?keyword_table ) ");
        }

        if (param.containsKey("keyword_column")) {
            wSqlstr.append("    AND ( t2.physical LIKE ?keyword_column ");
            wSqlstr.append("         OR t2.logical LIKE ?keyword_column ) ");
        }
        
        wSqlstr.append(" order by ");
        wSqlstr.append("     t1.physical ");
        wSqlstr.append("    ,t2.id ");
        
        Query wQuery = getEntityManager().createNativeQuery(wSqlstr.toString());
        wQuery.setHint(QueryHints.RESULT_TYPE, ResultType.Map);

        wQuery.setParameter("project_id", projectId);

        if (param.containsKey("keyword_table")) {
            wQuery.setParameter("keyword_table", "%" + param.get("keyword_table") + "%");
        }

        if (param.containsKey("keyword_column")) {
            wQuery.setParameter("keyword_column", "%" + param.get("keyword_column") + "%");
        }

        return wQuery.getResultList();
    }

    public Collection<Map<String, Object>> GetDomains(EntityManager manager, Map<String, Object> param) {
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
        wSqlstr.append("           c.column_name AS physical ");
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
        wSqlstr.append("        , c.ordinal_position ");
        wSqlstr.append("        , t.table_name AS table_physical ");
        wSqlstr.append("        , t.table_description AS table_logical ");
        wSqlstr.append(" from tables t ");
        wSqlstr.append(" join information_schema.columns c ");
        wSqlstr.append("     on c.table_schema = t.schema_name ");
        wSqlstr.append("    AND c.table_name = t.table_name ");
        wSqlstr.append(" left join pg_catalog.pg_description d ");
        wSqlstr.append("    ON d.objoid = t.oid ");
        wSqlstr.append("   AND d.objsubid = c.ordinal_position ");
        wSqlstr.append("   AND d.objsubid > 0 ");
        wSqlstr.append("      left join information_schema.key_column_usage kcu ");
        wSqlstr.append("          on c.table_schema = kcu.table_schema ");
        wSqlstr.append("          AND c.table_name = kcu.table_name ");
        wSqlstr.append("          AND c.column_name = kcu.column_name ");
        wSqlstr.append(" where 1=1 ");

        wSqlstr.append("    AND t.schema_name = ?nspname ");

        if (param.containsKey("keyword_table")) {
            wSqlstr.append("    AND ( t.table_name LIKE ?keyword_table ");
            wSqlstr.append("         OR t.table_description LIKE ?keyword_table ) ");
        }

        if (param.containsKey("keyword_column")) {
            wSqlstr.append("    AND (c.column_name LIKE ?keyword_column ");
            wSqlstr.append("         OR d.description LIKE ?keyword_column ) ");
        }

        wSqlstr.append(" order by ");
        wSqlstr.append("     t.schema_name, ");
        wSqlstr.append("     t.table_name, ");
        wSqlstr.append("     c.ordinal_position ");

        Query wQuery = manager.createNativeQuery(wSqlstr.toString());
        wQuery.setHint(QueryHints.RESULT_TYPE, ResultType.Map);

        wQuery.setParameter("nspname", param.get("nspname"));

        if (param.containsKey("keyword_table")) {
            wQuery.setParameter("keyword_table", "%" + param.get("keyword_table")+ "%");
        }

        if (param.containsKey("keyword_column")) {
            wQuery.setParameter("keyword_column", "%" + param.get("keyword_column")+ "%");
        }

        return wQuery.getResultList();
    }
}
