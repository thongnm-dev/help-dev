
package controller;

import common.BaseController;
import gateway.ProjectGateway;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

@Named
@SessionScoped
public class ProjectController extends BaseController {

    @Inject
    private ProjectGateway gateway;

    /**
     * 
     */
    public ProjectController() {

    }
}
