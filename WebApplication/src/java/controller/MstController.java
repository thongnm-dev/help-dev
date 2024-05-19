package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import common.BaseController;
import common.Const;
import common.MessageUtils;
import common.SelectItemFactory;
import entity.DbConection;
import entity.PrmIF;
import entity.ProjectIF;
import gateway.PrmGateway;
import gateway.ProjectGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.model.SelectItem;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.EntityManagerProperties;

@Named
@SessionScoped
public class MstController extends BaseController {

    private final String SRC_ID = "MST";

    @Getter
    @Setter
    private String target = Const.Data.FILE;

    @Getter
    @Setter
    private String targetDataType = Const.Data.FILE;

    @Getter
    private SelectItem[] targeItems = null;

    @Getter
    private SelectItem[] dataTypeItems = null;

    @Getter
    private List<Map<String, Object>> items = null;

    @Inject
    private ProjectGateway projectGateway;

    @Inject
    private PrmGateway prmGateway;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;

    @Getter
    private List<ColumnModel> columns = new ArrayList<>();

    public String init() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_ID));
        }

        getSession().put(C_SESSION_KEY_SCR, SRC_ID);
        return Const.SCR_INFO.get(SRC_ID);
    }

    /**
     * initData
     * @return
     */
    private boolean initData() {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");
            List<PrmIF> targets = prmGateway.GetPrms(Const.OPTION_MST_DATA).stream().collect(Collectors.toList());

            targeItems = SelectItemFactory.INSTANCE.create(targets, false,
                    (row) -> row.getPrmId(),
                    (row) -> row.getPrmValue());

            List<Map<String, String>> tables = new ArrayList<>();
            projectGateway.GetSettings(wProjectId, Const.Data.TABLE_MST)
                    .stream().forEach(setting -> {
                        try {
                            ObjectMapper mapper = new ObjectMapper();
                            Map<String, Object> json = mapper.readValue(setting.getSetting(), Map.class);

                            tables.add(new HashMap<String, String>() {
                                {
                                    put("table_name", (String) json.get("table_name"));
                                    put("table_logical", (String) json.get("table_logical"));
                                }
                            });
                        } catch (Exception e) {
                            addErrorMsg(e.getMessage());
                        }
                    });
            dataTypeItems = SelectItemFactory.INSTANCE.create(tables, true,
                    (row) -> row.get("table_name"),
                    (row) -> row.get("table_logical"));
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    /**
     * handleTargetChange
     */
    public void handleTargetChange() {
        try {

            ObjectMapper mapper = new ObjectMapper();
            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");
            String result = projectGateway.GetSettings(wProjectId, Const.Data.TABLE_MST, targetDataType);

            Map<String, Object> columnInfo = mapper.readValue(result, Map.class);

            columns = new ArrayList<>();
            for (Map.Entry entry : columnInfo.entrySet()) {
                ColumnModel column = new ColumnModel();
                column.setHeaderText((String) entry.getValue());
                column.setProperty((String) entry.getKey());
                columns.add(column);
            }
            
            items = new ArrayList<>();
            if (StringUtils.equals(target, Const.Data.FILE)) {
                projectGateway.GetMstDatas(wProjectId, targetDataType)
                        .stream()
                        .forEach(row -> {                            
                            try {
                                items.add(mapper.readValue(row.getDataJson(), Map.class));
                            } catch (JsonProcessingException e) {
                                
                            }
                        });
            } else {
                ProjectIF projectInfo = projectGateway.GetById(wProjectId);
                DbConection dbConection = projectInfo.getDbConnection();
                final Map<String, String> properties = new HashMap<String, String>() {
                    {
                        put(EntityManagerProperties.JDBC_URL, dbConection.getDbUrl());
                        put(EntityManagerProperties.JDBC_USER, dbConection.getDbUsr());
                        put(EntityManagerProperties.JDBC_PASSWORD, dbConection.getDbPass());
                    }
                };

                try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties);
                        EntityManager manager = emf.createEntityManager()) {
                    List<String> selects = columns.stream()
                                           .map(column -> column.getProperty())
                            .collect(Collectors.toList());

                    items = projectGateway.GetMstDatas(manager, selects, targetDataType)
                            .stream().collect(Collectors.toList());
                }
            }
        } catch (Exception e) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    /**
     * perform click back
     *
     * @return
     */
    public String back() {
        return redirect(getBackScr((String) getSession().get(C_SESSION_KEY_SCR)));
    }

    @Getter
    @Setter
    public class ColumnModel {
        private String headerText;
        private String property;
    }
}
