package controller;

import common.BaseController;
import common.Const;
import common.MessageUtils;
import entity.DbConection;
import entity.ProjectIF;
import gateway.ProjectGateway;
import gateway.TableGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.Getter;
import lombok.Setter;
import model.TableJoin;
import org.eclipse.persistence.config.EntityManagerProperties;

@Named
@SessionScoped
public class SqlBuilderController extends BaseController {

    private final String SRC_ID = "SQLBUILDER";

    @Getter
    private List<TableItem> tableItems = null;
    
    @Getter
    @Setter
    private List<String> tableSql;
    
    @Getter
    private List<TableJoin> tableJoins = new ArrayList<>();

    
    @Inject
    private ProjectGateway projectGateway;
    
    @Inject
    private TableGateway tableGateway;


    public String init() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_ID));
        }
        
        getSession().put(C_SESSION_KEY_SCR, SRC_ID);
        
        return Const.SCR_INFO.get(SRC_ID);
    }

    /**
     * init data
     *
     * @return @throws Exception
     */
    private boolean initData() throws Exception {

        try {

            tableSql = new ArrayList<>();
            
            tableJoins = new ArrayList<>();
            
            tableJoins.add(new TableJoin() {{setIsfrom(true);}});
            
            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");

            ProjectIF projectInfo = projectGateway.GetById(wProjectId);
            DbConection dbConection = projectInfo.getDbConnection();

            final Map<String, String> properties = new HashMap<String, String>() {
                {
                    put(EntityManagerProperties.JDBC_URL, dbConection.getDbUrl());
                    put(EntityManagerProperties.JDBC_USER, dbConection.getDbUsr());
                    put(EntityManagerProperties.JDBC_PASSWORD, dbConection.getDbPass());
                }
            };

            tableItems = new ArrayList<>();
            try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties);
                    EntityManager manager = emf.createEntityManager()) {

                tableGateway.GetTables(manager, dbConection.getDbSchema()).stream()
                        .forEach(wRow -> {
                            TableItem model = new TableItem();
                            model.setPhysical((String) wRow.get("physical"));
                            model.setLogical((String) wRow.get("logical"));
                            tableItems.add(model);
                        });
            }
            
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public void addNewJoin() {
        
        try {
            tableJoins.add(new TableJoin());
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
    public class TableItem {
        private String physical;
        private String logical;
    }
}
