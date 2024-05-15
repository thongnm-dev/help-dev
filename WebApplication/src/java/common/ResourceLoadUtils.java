
package common;

import java.util.ResourceBundle;


public class ResourceLoadUtils {

    public static String getString(String pKey) {
        return ResourceBundle.getBundle("/Bundle").getString(pKey);
    }

}
