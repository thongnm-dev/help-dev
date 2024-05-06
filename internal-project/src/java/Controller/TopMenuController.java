package Controller;

import Common.BaseController;
import Common.Const;
import Common.MessageUtils;
import Gateway.ProjectGateway;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;
import lombok.Getter;
import Model.ProjectIF;

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

        return redirect(wScrUrl);
    }

    private boolean initData() throws Exception {

        try {
            projects = projectGateway.GetAll(new Date()).stream().collect(Collectors.toList());
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public void refresh() {
        try {
            projects = projectGateway.GetAll(new Date()).stream().collect(Collectors.toList());
        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }
}
