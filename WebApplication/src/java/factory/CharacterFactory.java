package factory;

import common.Const;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author thongnm
 */
public enum CharacterFactory {

    INSTANCE;
    
    private final String NUM_CHARACTER = "0123456789";

    private final String ALPHA = "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnoprstuvwxyz";

    private final String ALPHA_NUM = "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnoprstuvwxyz0123456789";

    public String random(Map<String, Object> param) {

        final String random = (String) param.getOrDefault("random", "");
        final int max_length = (int) param.getOrDefault("max_length", 255);

        switch (random) {
            case Const.Random.ALPHA -> {
                return text(ALPHA, max_length);
            }
            case Const.Random.NUM -> {
                return text(NUM_CHARACTER, max_length);
            }
            case Const.Random.ALPHA_NUM -> {
                return text(ALPHA_NUM, max_length);
            }
            default -> {
            }
        }

        return StringUtils.EMPTY;
    }

    private String text(String pCharacterSet, int length) {
        if (length <=0 ) {
            length = 255;
        }

        StringBuilder wText = new StringBuilder();
        int wCharacterSetLength = pCharacterSet.length();

        for (int i = 0; i < length; i++) {
            wText.append(pCharacterSet.charAt(ThreadLocalRandom.current().nextInt(wCharacterSetLength)));
        }

        return wText.toString();
    }
}
