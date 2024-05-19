package gateway;

import common.BaseGateway;
import common.Const;
import entity.MstIF;
import java.util.Collection;
import jakarta.ejb.Stateless;
import jakarta.persistence.Query;
import entity.ProjectIF;
import entity.SettingIF;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.QueryHints;
import org.eclipse.persistence.config.ResultType;

@Stateless
public class ProjectGateway extends BaseGateway {

    /**
     * GetAll
     * @return 
     */
    public Collection<ProjectIF> GetAll() {

        Query query = getEntityManager().createNamedQuery("GET_ALL_PROJECT");

        return query.getResultList();
    }

    /**
     * GetById
     * @param projectId
     * @return 
     */
    public ProjectIF GetById(Long projectId) {
        CriteriaBuilder criteriaBuilder = CriteriaBuilder();

        CriteriaQuery<ProjectIF> criteriaQuery = criteriaBuilder.createQuery(ProjectIF.class);
        Root<ProjectIF> userRoot = criteriaQuery.from(ProjectIF.class);

        if (Objects.nonNull(projectId)) {
            criteriaQuery.where(criteriaBuilder.equal(userRoot.get("id"), projectId));
        }

        return Query(criteriaQuery).getSingleResult();
    }

    /**
     * GetColumnHistory
     * @param projectId
     * @return 
     */
    public Optional<SettingIF> GetColumnHistory(Long projectId) {

        CriteriaBuilder criteriaBuilder = CriteriaBuilder();
        CriteriaQuery<SettingIF> criteriaQuery = criteriaBuilder.createQuery(SettingIF.class);
        Root<SettingIF> userRoot = criteriaQuery.from(SettingIF.class);
        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("project_id"), projectId));
        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("type"), Const.Data.COLUMN_HISTORY));

        return Optional.ofNullable(Query(criteriaQuery).getResultList().get(0));
    }
    
    /**
     * GetSettings
     * @param projectId
     * @param settingType
     * @return 
     */
    public Collection<SettingIF> GetSettings(Long projectId, String settingType) {

        CriteriaBuilder criteriaBuilder = CriteriaBuilder();
        CriteriaQuery<SettingIF> criteriaQuery = criteriaBuilder.createQuery(SettingIF.class);
        Root<SettingIF> userRoot = criteriaQuery.from(SettingIF.class);
        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("project_id"), projectId));
        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("type"), settingType));

        return Query(criteriaQuery).getResultList();
    }
    
    /**
     * GetSettings
     * @param projectId
     * @param settingType
     * @param target
     * @return 
     */
    public String GetSettings(Long projectId, String settingType, String target) {

        StringBuilder wSqlstr = new StringBuilder();
        
        wSqlstr.append(" SELECT ");
        wSqlstr.append("    setting_json->>'columns' AS columns ");
        wSqlstr.append(" FROM ");
        wSqlstr.append("    t_setting ");
        wSqlstr.append(" WHERE 1=1 ");
        wSqlstr.append("    AND project_id = ?project_id ");
        wSqlstr.append("    AND setting_type = ?setting_type ");
        wSqlstr.append("    AND setting_json->>'table_name' = ?table_name ");
        
        Query wQuery = getEntityManager().createNativeQuery(wSqlstr.toString());
        wQuery.setHint(QueryHints.RESULT_TYPE, ResultType.Map);
        wQuery.setParameter("project_id", projectId);
        wQuery.setParameter("setting_type", settingType);
        wQuery.setParameter("table_name", target);

        return (String)((Map<String, Object>) wQuery.getSingleResult()).getOrDefault("columns", "");
    }
    
    /**
     * GetMstDatas
     * @param projectId
     * @param target
     * @return 
     */
    public Collection<MstIF> GetMstDatas(Long projectId, String target) {

        CriteriaBuilder criteriaBuilder = CriteriaBuilder();

        CriteriaQuery<MstIF> criteriaQuery = criteriaBuilder.createQuery(MstIF.class);
        Root<MstIF> userRoot = criteriaQuery.from(MstIF.class);
        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("project_id"), projectId));
        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("table_target"), target));        

        return Query(criteriaQuery).getResultList();
    }
    
    /**
     * GetMstDatas
     * @param manager
     * @param columns
     * @param target
     * @return 
     */
    public Collection<Map<String, Object>> GetMstDatas(EntityManager manager, List<String> columns, String target) {

        StringBuilder wSqlstr = new StringBuilder();
        wSqlstr.append(" SELECT ");
        wSqlstr.append(StringUtils.join(columns, ","));
        wSqlstr.append(" FROM ");
        wSqlstr.append(target);
        Query wQuery = manager.createNativeQuery(wSqlstr.toString());
        wQuery.setHint(QueryHints.RESULT_TYPE, ResultType.Map);
        
        return wQuery.getResultList();
    }
}
