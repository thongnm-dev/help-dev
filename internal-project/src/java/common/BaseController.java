package common;

import javax.faces.context.FacesContext;

public class BaseController {

    public Context ctx() {
        return Context.INSTANCE;
    }

    public void addErrorMsg(String pMsg) {
        //ctx().facesContext().addMessage(null, fm);
    }
    public enum Context {

        INSTANCE;
        
        public FacesContext facesContext() {
            return FacesContext.getCurrentInstance();
        }
    }
}
