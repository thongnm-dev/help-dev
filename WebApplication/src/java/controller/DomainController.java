package controller;

import common.BaseController;
import common.Const;
import common.MessageUtils;
import common.SelectItemFactory;
import entity.DbConection;
import entity.PrmIF;
import entity.ProjectIF;
import gateway.PrmGateway;
import gateway.ProjectGateway;
import gateway.TableGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.model.SelectItem;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.Setter;
import model.DomainModel;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.EntityManagerProperties;

@Named
@SessionScoped
public class DomainController extends BaseController {

    private final String SRC_ID = "DOMAIN";

    private final String SRC_TABLE_COL = "TABLE_COL";

    @Getter
    @Setter
    private String target = "0";

    @Getter
    @Setter
    private String table = "";

    @Getter
    @Setter
    private String column = "";

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
    private SelectItem[] targeItems = null;

    @Getter
    private List<DomainModel> domains = new ArrayList<>();

    @Inject
    private TableGateway tableGateway;

    @Inject
    private ProjectGateway projectGateway;

    @Inject
    private PrmGateway prmGateway;

    public String init() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_ID));
        }
        return Const.SCR_INFO.get(SRC_ID);
    }

    private boolean initData() throws Exception {

        try {
            domains = new ArrayList<>();
            List<PrmIF> targets = prmGateway.GetPrms(Const.OPTION_TARGET).stream().collect(Collectors.toList());

            targeItems = SelectItemFactory.INSTANCE.create(targets, false,
                                                            (row) -> row.getPrmId(),
                                                            (row) -> row.getPrmValue());
            
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public void search() {
        try {
            domains = new ArrayList<>();

            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");

            Collection<Map<String, Object>> resultList;
            Map<String, Object> params = new HashMap<>();
            
            if (StringUtils.isNotBlank(table)) {
                params.put("keyword_table", table);
            }
            
            if (StringUtils.isNotBlank(column)) {
                params.put("keyword_column", column);
            }

            if (StringUtils.equals(Const.TABLE_FROM_LAYOUT, target)) {

                resultList = tableGateway.GetDomains(wProjectId, params);
            } else {

                ProjectIF projectInfo = projectGateway.GetById(wProjectId);
                DbConection dbConection = projectInfo.getDbConnection();
                final Map<String, String> properties = new HashMap<String, String>() {
                    {
                        put(EntityManagerProperties.JDBC_URL, dbConection.getDbHost());
                        put(EntityManagerProperties.JDBC_USER, dbConection.getDbUsr());
                        put(EntityManagerProperties.JDBC_PASSWORD, dbConection.getDbPass());
                    }
                };

                try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties);
                        EntityManager manager = emf.createEntityManager()) {

                    params.put("nspname", dbConection.getDbSchema());
                    // Retrieve all tables
                    resultList = tableGateway.GetDomains(manager, params);
                }
            }

            resultList.stream().forEach(wRow -> {
                DomainModel model = new DomainModel();
                try {
                    Map<String, Object> row = new HashMap<>();

                    for (Map.Entry entry : wRow.entrySet()) {
                        row.put(((Object) entry.getKey()).toString(), entry.getValue());
                    }

                    BeanUtils.populate(model, row);

                    domains.add(model);
                } catch (Exception e) {
                    addErrorMsg(MessageUtils.getMessage("E0001"));
                }
            });

            setCanSearch(true);
        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    /**
     *
     * @param model
     * @return
     */
    public String showDetail(DomainModel model) {

        Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");

        setScrIFToSession(SRC_TABLE_COL, "pProjectId", wProjectId);
        setScrIFToSession(SRC_TABLE_COL, "pTarget", target);
        setScrIFToSession(SRC_TABLE_COL, "pTblPhysical", model.getTable_physical());
        setScrIFToSession(SRC_TABLE_COL, "pTblLogical", model.getTable_logical());

        setBackScreenIdToSession(SRC_TABLE_COL, Const.SCR_INFO.get(SRC_ID));

        return redirect(Const.SCR_INFO.get(SRC_TABLE_COL));
    }

    /**
     * perform click back
     *
     * @return
     */
    public String back() {
        return redirect(getBackScr((String) getSession().get(C_SESSION_KEY_SCR)));
    }
}
