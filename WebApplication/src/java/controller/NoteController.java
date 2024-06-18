package controller;

import common.BaseController;
import common.Const;
import common.SelectItemFactory;
import entity.NoteIF;
import entity.ProjectIF;
import gateway.NoteGateway;
import gateway.ProjectGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.model.SelectItem;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import java.util.List;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

@Named
@SessionScoped
public class NoteController extends BaseController {

    private final String SRC_ID = "NOTE";
    
    @Getter
    private SelectItem[] projectItems = null;
    
    @Getter
    @Setter
    private String note = StringUtils.EMPTY;
        
    @Getter
    @Setter
    private String type = "1";
    
    @Getter
    @Setter
    private Long project = 0L;
        
    @Inject
    private ProjectGateway projectGateway;
    
    @Inject
    private NoteGateway noteGateway;

    public String init() {

        List<ProjectIF> targets = projectGateway.GetAll().stream().collect(Collectors.toList());
        
        projectItems = SelectItemFactory.INSTANCE.create(targets, false,
                    (row) -> row.getId(),
                    (row) -> row.getProjectName());

        getSession().put(C_SESSION_KEY_SCR, SRC_ID);
        return Const.SCR_INFO.get(SRC_ID);
    }
    
    public void save() {
        
        boolean check = true;

        if (StringUtils.isBlank(type)) {
            addErrorAndRequired("mainForm", "cbType", "E0003");
            check = false;
        }

        if (StringUtils.isBlank(note)) {
            addErrorAndRequired("mainForm", "txtNote", "E0003");
            check = false;
        }
        if (!check) return;

        NoteIF model = new NoteIF();
        
        model.setNote_type(type);
        
        model.setNote_data(note);
        
        model.setProject_id(project);
        
        noteGateway.insert(model);
    }
}
