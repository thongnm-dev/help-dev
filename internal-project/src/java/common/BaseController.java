package common;

import java.io.Serializable;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIInput;
import javax.faces.component.UIViewRoot;
import javax.faces.context.FacesContext;
import org.apache.commons.lang3.StringUtils;

public class BaseController implements Serializable {

    protected Context ctx() {
        return Context.INSTANCE;
    }

    protected void addErrorAndRequired(String pMainForm, String pComponentId, String pMsg) {
        setErrorComponent(pMainForm, pComponentId);
        addMessage(FacesMessage.SEVERITY_ERROR, pMsg);
    }

    protected void addErrorMsg(String pMsg) {
        addMessage(FacesMessage.SEVERITY_ERROR, pMsg);
    }


    protected void addInfoMsg(String pMsg) {
        addMessage(FacesMessage.SEVERITY_INFO, pMsg);
    }

    protected void addWarnMsg(String pMsg) {
        addMessage(FacesMessage.SEVERITY_WARN, pMsg);
    }

    protected void addMessage(FacesMessage.Severity severity, String pMsg) {
        ctx().facesContext().addMessage(null, new FacesMessage(severity, "", pMsg));
    }

    private void setErrorComponent(String pMainForm, String pComponentId) {
        FacesContext wContext = FacesContext.getCurrentInstance();
        UIViewRoot wRoot = wContext.getViewRoot();

        String wSetId = StringUtils.join(":", pMainForm, ":", pComponentId);

        if (wRoot.findComponent(wSetId) != null) {
            ((UIInput) wRoot.findComponent(wSetId)).setValid(false);
        }
    }

    public enum Context {

        INSTANCE;

        public FacesContext facesContext() {
            return FacesContext.getCurrentInstance();
        }
    }
}
