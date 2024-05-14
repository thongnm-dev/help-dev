package Controller;

import common.BaseController;
import common.Const;
import common.MessageUtils;
import gateway.ProjectGateway;
import java.util.List;
import java.util.stream.Collectors;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import lombok.Getter;
import entity.ProjectIF;

@Named
@SessionScoped
public class TopMenuController extends BaseController {

    @Inject
    private ProjectGateway projectGateway;

    @Getter
    private List<ProjectIF> projects = null;

    public String init() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return null;
        }
        return "/Topmenu.xhtml";
    }

    public String openForm(String url) {
        return redirect(Const.SCR_INFO.get(url));
    }

    public String showForm(ProjectIF project, String url) {

        String wScrUrl = Const.SCR_INFO.get(url);

        setScrIFToSession(url, "pProjectId", project.getId());

        setBackScreenIdToSession(url, "/Topmenu.xhtml");
        
        return redirect(wScrUrl);
    }

    private boolean initData() throws Exception {

        try {
            projects = projectGateway.GetAll().stream().collect(Collectors.toList());
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public void refresh() {
        try {
            projects = projectGateway.GetAll().stream().collect(Collectors.toList());
        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }
}
