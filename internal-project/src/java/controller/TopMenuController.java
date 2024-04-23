
package controller;

import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * 
 */
@Named
@SessionScoped
public class TopMenuController implements Serializable{
    
    public String init() throws Exception {
        
        return  "/topmenu.xhtml";
    }
}
