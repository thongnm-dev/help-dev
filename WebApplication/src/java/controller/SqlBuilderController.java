package controller;

import common.BaseController;
import common.Const;
import common.MessageUtils;
import entity.DbConection;
import entity.ProjectIF;
import gateway.ProjectGateway;
import gateway.TableGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.context.FacesContext;
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
import java.util.Objects;
import lombok.Getter;
import lombok.Setter;
import model.ConditionModel;
import model.Item;
import model.TableJoin;
import org.eclipse.persistence.config.EntityManagerProperties;
import org.primefaces.event.SelectEvent;

@Named
@SessionScoped
public class SqlBuilderController extends BaseController {

    private final String SRC_ID = "SQLBUILDER";

    @Getter
    @Setter
    private Item tableTarget;
    
    @Getter
    private List<Item> tableItems = new ArrayList<>();

    @Getter
    @Setter
    private List<String> tableSql;

    @Getter
    private List<TableJoin> tableJoins = new ArrayList<>();

    @Inject
    private ProjectGateway projectGateway;

    @Inject
    private TableGateway tableGateway;
    
    @Getter
    private List<Item> columnItems  = new ArrayList<>();
    
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

            tableTarget = null;

            tableSql = new ArrayList<>();

            tableJoins = new ArrayList<>();

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
                            Item model = new Item();
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
            TableJoin tableJoin = new TableJoin();
            ConditionModel whereModel = new ConditionModel();

            tableJoin.getWhereJoins().add(whereModel);
            tableJoins.add(tableJoin);
        } catch (Exception e) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    /**
     * perform load column info according table target
     */
    public void loadColumns(SelectEvent pEvent) {

        columnItems = new ArrayList<>();
        try {
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

            try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties); 
                    EntityManager manager = emf.createEntityManager()) {

                // Retrieve all tables
                tableGateway.GetTableColumns(manager, dbConection.getDbSchema(), tableTarget.getPhysical()).stream()
                        .forEach(wRow -> {
                            Item model = new Item();
                            model.setPhysical((String) wRow.get("physical"));
                            model.setLogical((String) wRow.get("logical"));                       
                            columnItems.add(model);
                        });

            }

        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }
    
    /**
     * perform load column info according table target
     */
    public void loadJoinColumns() {
        try {
            FacesContext context = ctx().facesContext();
            TableJoin currentItem = context.getApplication().evaluateExpressionGet(context, "#{item}", TableJoin.class);
            
            if (Objects.nonNull(currentItem)) {
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

                List<Item> joinColumns = new ArrayList<>();
                try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties); 
                        EntityManager manager = emf.createEntityManager()) {

                    // Retrieve all tables
                    tableGateway.GetTableColumns(manager, dbConection.getDbSchema(), currentItem.getJoin().getPhysical()).stream()
                            .forEach(wRow -> {
                                
                                Item model = new Item();
                                model.setPhysical((String) wRow.get("physical"));
                                model.setLogical((String) wRow.get("logical"));                          
                                joinColumns.add(model);
                            });

                }
                
                currentItem.setColumns(joinColumns);
            }
            
        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }
    
    public void exec() {
        try {

            String sss = "aaaa";
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
    
    public SelectItem [] getColumnItems(String pTableTarget) {
        SelectItem[] items = new SelectItem[] {};
        
        return items;
        
    }
}
