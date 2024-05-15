
package common;

import java.util.ResourceBundle;

public class MessageUtils {

    private static final ResourceBundle messages = ResourceBundle.getBundle("/Messages");

    public static String getMessage(String pMsgId) {
        return messages.getString(pMsgId);
    }
}
