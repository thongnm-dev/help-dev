package factory;

import common.Const;
import java.util.concurrent.ThreadLocalRandom;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author thongnm
 */
public class CharacterFactory {

    private final String NUM_CHARACTER = "0123456789";

    private final String ALPHA = "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnoprstuvwxyz";

    private final String ALPHA_NUM = "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnoprstuvwxyz0123456789";

    public String random(String pCharacterSetType, int pMaxLength) {

        switch (pCharacterSetType) {
            case Const.Random.ALPHA -> {
                return text(ALPHA, pMaxLength);
            }
            case Const.Random.NUM -> {
                return text(NUM_CHARACTER, pMaxLength);
            }
            case Const.Random.ALPHA_NUM -> {
                return text(ALPHA_NUM, pMaxLength);
            }
            default -> {
            }
        }

        return StringUtils.EMPTY;
    }

    private String text(String pCharacterSet, int pMaxLength) {
        if (pMaxLength <=0 ) {
            pMaxLength = 255;
        }

        StringBuilder wText = new StringBuilder();
        int wCharacterSetLength = pCharacterSet.length();

        for (int i = 0; i < pMaxLength; i++) {
            wText.append(pCharacterSet.charAt(ThreadLocalRandom.current().nextInt(wCharacterSetLength)));
        }

        return wText.toString();
    }
}
