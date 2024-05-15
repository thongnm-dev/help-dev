package factory;

import common.Const;
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

    public String random(String pCharacterSetType, String dataType) {

        switch (pCharacterSetType) {
            case Const.Random.ALPHA -> {
                return text(ALPHA, dataType);
            }
            case Const.Random.NUM -> {
                return text(NUM_CHARACTER, dataType);
            }
            case Const.Random.ALPHA_NUM -> {
                return text(ALPHA_NUM, dataType);
            }
            default -> {
            }
        }

        return StringUtils.EMPTY;
    }

    private String text(String pCharacterSet, String pMaxLength) {
//        if (pMaxLength <=0 ) {
//            pMaxLength = 255;
//        }

        StringBuilder wText = new StringBuilder();
        int wCharacterSetLength = pCharacterSet.length();

//        for (int i = 0; i < pMaxLength; i++) {
//            wText.append(pCharacterSet.charAt(ThreadLocalRandom.current().nextInt(wCharacterSetLength)));
//        }

        return wText.toString();
    }
}
