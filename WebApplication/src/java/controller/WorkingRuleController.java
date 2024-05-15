package controller;

import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import java.io.Serializable;

@Named
@SessionScoped
public class WorkingRuleController implements Serializable {
    
    public String init() {
        
        return "/WorkingRule.xhtml";
    }
}
