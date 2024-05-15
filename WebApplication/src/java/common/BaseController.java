package common;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.component.UIComponent;
import jakarta.faces.component.UIData;
import jakarta.faces.component.UIInput;
import jakarta.faces.component.UIViewRoot;
import jakarta.faces.context.ExternalContext;
import jakarta.faces.context.FacesContext;
import jakarta.persistence.metamodel.Attribute;
import org.apache.commons.lang3.StringUtils;

public class BaseController implements Serializable {

    protected static final String C_SESSION_KEY_SCR = "SCR_ID";

    protected static final String C_SESSION_KEY_DELIVERYINFO = "keyDeliveryInfo";

    protected static final String C_SESSION_KEY_DELIVERY_ITEMS = "forwardItems";

    protected static final String C_SESSION_KEY_BACK_FORWARD = "backforward";

    protected <U> U getScrFromSession(String pScreenId, String pItemKey) {
        return (U) getScrIFFromSession(pScreenId).get(pItemKey);
    }

    protected void setBackScreenIdToSession(String pScreenId, String pBackScreenId) {
        getScrIFFromSession(pScreenId).put(C_SESSION_KEY_BACK_FORWARD, pBackScreenId);
    }

    protected String getBackScreenIdFromSessionOnlyId(String pScreenId) {
        return (String) getScrIFFromSession(pScreenId).get(C_SESSION_KEY_BACK_FORWARD);
    }

    protected void setScrIFToSession(String pScreenId, String itemKey, Object itemValue) {
        getScrIFFromSession(pScreenId).put(itemKey, itemValue);
    }

    protected Map<String, Object> getScrIFFromSession(String screenId) {

        Map<String, Object> gmnSession;
        Map<String, Object> scrDeliveryInfo = getSession();

        if (!scrDeliveryInfo.containsKey(screenId)) {
            gmnSession = new HashMap<>();
            scrDeliveryInfo.put(screenId, gmnSession);
        }

        gmnSession = (Map) scrDeliveryInfo.get(screenId);

        return gmnSession;
    }

    protected String getBackScr(String scrId) {
        return (String) getScrIFFromSession(scrId).getOrDefault(C_SESSION_KEY_BACK_FORWARD, "/Topmenu.xhtml");
    }

    protected String redirect(String url) {
        this.ctx().keepMessages();
        return StringUtils.join(new String[]{url, url.contains("?") ? "&" : "?", "faces-redirect=true"});
    }

    protected Map<String, Object> getSession() {
        return ctx().session();
    }

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

    public void setErrorComponent(List<String> pComponentIdList) {
        FacesContext context = FacesContext.getCurrentInstance();
        UIViewRoot root = context.getViewRoot();
        //フォームIDとコンポーネントIDを結合
        pComponentIdList.forEach(componentId -> {
            String setId = "testForm:" + componentId;
            //コンポーネントが存在しない場合false
            if (root.findComponent(setId) != null) {
                //コンポーネントが存在する場合はsetValidでエラー設定
                ((UIInput) root.findComponent(setId)).setValid(false);
            }
        });
    }
    
    public void setErrorComponentInDataTable(String tableId, int rowIndex, String componentId) {
        FacesContext context = FacesContext.getCurrentInstance();
        UIViewRoot root = context.getViewRoot();
        //datatableのコンポーネントを作成
        UIData dataTable = (UIData) root.findComponent(":testForm:" + tableId);
        //datatable内のコンポーネントIDを作成
        String setId = ":testForm:" + tableId + ":" + componentId;
        //探索する行を設定
        dataTable.setRowIndex(rowIndex);
        //指定されたindexが探索可能な行かチェック
        if (dataTable.isRowAvailable()) {
            //行内のコンポーネントを探索
            for (UIComponent comp : dataTable.getChildren()) {
                //普通のdatatableではcolumnが取得できる。
                if (!comp.getChildren().isEmpty()) {
                    //column内に探しているコンポーネントがいるかどうかチェック
                    if (comp.getChildren().get(0).findComponent(setId) != null) {
                        //column内に探しているコンポーネントがいる場合はエラーを設定
                        UIInput com = (UIInput) comp.getChildren().get(0).findComponent(setId);
                        if (String.format("testForm:%s:%s:%s", tableId, rowIndex, componentId).equals(com.getClientId())) {
                            com.setValid(false);
                            break;
                        }
                    }
                }
            }
        }
    }
    
    public enum Context {

        INSTANCE;

        public FacesContext facesContext() {
            return FacesContext.getCurrentInstance();
        }

        public ExternalContext externalContext() {
            return facesContext().getExternalContext();
        }

        public Map<String, Object> session() {
            return externalContext().getSessionMap();
        }

        public Map<String, Object> request() {
            return externalContext().getRequestMap();
        }

        public void keepMessages() {
            if (!facesContext().getMessageList().isEmpty()) {
                externalContext().getFlash().setKeepMessages(true);
            }

        }

        private List<FacesMessage> messages() {
            return this.facesContext().getMessageList();
        }

        public boolean hasErrors() {
            return this.hasErrors(this.messages());
        }

        public boolean hasErrors(Attribute field) {
            return this.hasErrors(field.getName());
        }

        public boolean hasErrors(String fieldName) {
            return this.hasErrors(this.facesContext().getMessageList(fieldName));
        }

        private boolean hasErrors(List<FacesMessage> messages) {
            return messages.stream().anyMatch((message) -> {
                return message.getSeverity() == FacesMessage.SEVERITY_ERROR;
            });
        }
    }
}
