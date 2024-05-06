package factory;

import Cmn.Const;
import java.util.concurrent.ThreadLocalRandom;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author enercom34
 */
public class CharacterGenerateFactory {

    /**
     * キャラクタセットと最大長さを元にデータ作成
     *
     * @param pCharacterSetType データ作成用キャラクタセット
     * @param pMaxLength 最大長さ
     * @return データが作成された
     */
    public static String generateRandomText(String pCharacterSetType, int pMaxLength) {

        switch (pCharacterSetType) {
            case Const.RandomOptions.ALPHABET:
                return generateText(Const.SAMPLE_ALPHABET, pMaxLength);
            case Const.RandomOptions.NUMBER:
                return generateText(Const.SAMPLE_NUMBER, pMaxLength);
            case Const.RandomOptions.ENGLISH_CHARACTERS:
                return generateText(Const.SAMPLE_ENGLISH_CHARACTERS, pMaxLength);
            default:
                break;
        }

        return StringUtils.EMPTY;
    }

    /**
     * キャラクタセットと最大長さを元にデータ作成
     *
     * @param pCharacterSet データ作成用キャラクタセット
     * @param pMaxLength 最大長さ
     * @return データが作成された
     */
    public static String generateText(String pCharacterSet, int pMaxLength) {
        if (pMaxLength < 0) {
            throw new IllegalArgumentException("Invalid max length value");
        } else if (pMaxLength == 0) {
            pMaxLength = Const.DEFAULT_MAX_CHARACTER_LENGTH;
        }

        StringBuilder wText = new StringBuilder();
        int wCharacterSetLength = pCharacterSet.length();

        for (int i = 0; i < pMaxLength; i++) {
            wText.append(pCharacterSet.charAt(ThreadLocalRandom.current().nextInt(wCharacterSetLength)));
        }

        return wText.toString();
    }
}
