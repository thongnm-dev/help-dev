package factory;

import com.ibm.icu.text.Transliterator;
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

    private static final String NUM_CHARACTER = "0123456789";

    private static final String ALPHA = "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnoprstuvwxyz";

    private static final String ALPHA_NUM = "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnoprstuvwxyz0123456789";

    private static final char[] HANKAKU_HIRAGANA = {
        'ぁ', 'あ', 'ぃ', 'い', 'ぅ', 'う', 'ぇ', 'え',
        'ぉ', 'お', 'か', 'が', 'き', 'ぎ', 'く', 'ぐ',
        'け', 'げ', 'こ', 'ご', 'さ', 'ざ', 'し', 'じ',
        'す', 'ず', 'せ', 'ぜ', 'そ', 'ぞ', 'た', 'だ',
        'ち', 'ぢ', 'っ', 'つ', 'づ', 'て', 'で', 'と',
        'ど', 'な', 'に', 'ぬ', 'ね', 'の', 'は', 'ば',
        'ぱ', 'ひ', 'び', 'ぴ', 'ふ', 'ぶ', 'ぷ', 'へ',
        'べ', 'ぺ', 'ほ', 'ぼ', 'ぽ', 'ま', 'み', 'む',
        'め', 'も', 'ゃ', 'や', 'ゅ', 'ゆ', 'ょ', 'よ',
        'ら', 'り', 'る', 'れ', 'ろ', 'ゎ', 'わ', 'ゐ',
        'ゑ', 'を', 'ん', 'ゔ', 'ゕ', 'ゖ'};

    private static final char[] ZENKAKU_KATAKANA = {'ァ', 'ア', 'ィ', 'イ', 'ゥ',
        'ウ', 'ェ', 'エ', 'ォ', 'オ', 'カ', 'ガ', 'キ', 'ギ', 'ク', 'グ', 'ケ', 'ゲ',
        'コ', 'ゴ', 'サ', 'ザ', 'シ', 'ジ', 'ス', 'ズ', 'セ', 'ゼ', 'ソ', 'ゾ', 'タ',
        'ダ', 'チ', 'ヂ', 'ッ', 'ツ', 'ヅ', 'テ', 'デ', 'ト', 'ド', 'ナ', 'ニ', 'ヌ',
        'ネ', 'ノ', 'ハ', 'バ', 'パ', 'ヒ', 'ビ', 'ピ', 'フ', 'ブ', 'プ', 'ヘ', 'ベ',
        'ペ', 'ホ', 'ボ', 'ポ', 'マ', 'ミ', 'ム', 'メ', 'モ', 'ャ', 'ヤ', 'ュ', 'ユ',
        'ョ', 'ヨ', 'ラ', 'リ', 'ル', 'レ', 'ロ', 'ヮ', 'ワ', 'ヰ', 'ヱ', 'ヲ', 'ン',
        'ヴ', 'ヵ', 'ヶ'};

    private static final String[] HANKAKU_KATAKANA = {"ｧ", "ｱ", "ｨ", "ｲ", "ｩ",
        "ｳ", "ｪ", "ｴ", "ｫ", "ｵ", "ｶ", "ｶﾞ", "ｷ", "ｷﾞ", "ｸ", "ｸﾞ", "ｹ",
        "ｹﾞ", "ｺ", "ｺﾞ", "ｻ", "ｻﾞ", "ｼ", "ｼﾞ", "ｽ", "ｽﾞ", "ｾ", "ｾﾞ", "ｿ",
        "ｿﾞ", "ﾀ", "ﾀﾞ", "ﾁ", "ﾁﾞ", "ｯ", "ﾂ", "ﾂﾞ", "ﾃ", "ﾃﾞ", "ﾄ", "ﾄﾞ",
        "ﾅ", "ﾆ", "ﾇ", "ﾈ", "ﾉ", "ﾊ", "ﾊﾞ", "ﾊﾟ", "ﾋ", "ﾋﾞ", "ﾋﾟ", "ﾌ",
        "ﾌﾞ", "ﾌﾟ", "ﾍ", "ﾍﾞ", "ﾍﾟ", "ﾎ", "ﾎﾞ", "ﾎﾟ", "ﾏ", "ﾐ", "ﾑ", "ﾒ",
        "ﾓ", "ｬ", "ﾔ", "ｭ", "ﾕ", "ｮ", "ﾖ", "ﾗ", "ﾘ", "ﾙ", "ﾚ", "ﾛ", "ﾜ",
        "ﾜ", "ｲ", "ｴ", "ｦ", "ﾝ", "ｳﾞ", "ｶ", "ｹ"};

    public String random(Map<String, Object> param) {

        final String random = (String) param.getOrDefault("random", "");

        switch (random) {
            case Const.Random.ALPHA -> {
                return text(ALPHA, param);
            }
            case Const.Random.NUM -> {
                return text(NUM_CHARACTER, param);
            }
            case Const.Random.ALPHA_NUM -> {
                return text(ALPHA_NUM, param);
            }

            case Const.Random.FULL_SIZE -> {
                return text(HANKAKU_HIRAGANA, param);
            }
        }

        return StringUtils.EMPTY;
    }

    private String text(String pCharacterSet, Map<String, Object> param) {

        final Map<String, Object> character = (Map) param.get("character");
        final int max_length = (int) character.getOrDefault("max_length", 255);

        StringBuilder wText = new StringBuilder();
        int wCharacterSetLength = pCharacterSet.length();

        for (int i = 0; i < max_length; i++) {
            wText.append(pCharacterSet.charAt(ThreadLocalRandom.current().nextInt(wCharacterSetLength)));
        }

        if (param.containsKey("full_size")) {
            Transliterator trans = Transliterator.getInstance("Halfwidth-Fullwidth");

            String fullSize = trans.transliterate(wText.toString());

            int wConvSize = 0;
            StringBuilder wConvString = new StringBuilder();
            try {
                for (int i = 0; i < fullSize.length(); i++) {
                    String c = fullSize.substring(i, i + 1);
                    wConvSize += c.getBytes("MS932").length;
                    if (wConvSize > max_length) {
                        return wConvString.toString();
                    }

                    wConvString.append(c);
                }
            } catch (Exception ex) {
                return StringUtils.EMPTY;
            }

            return wConvString.toString();
        }
        return wText.toString();
    }

    private String text(char[] pCharacterSet, Map<String, Object> param) {

        final Map<String, Object> character = (Map) param.get("character");
        final int max_length = (int) character.getOrDefault("max_length", 255);

        StringBuilder wText = new StringBuilder();
        int wCharacterSetLength = pCharacterSet.length;

        int wConvSize = 0;
        try {
            for (int i = 0; i < max_length; i++) {
                String c = wText.toString().substring(i, i + 1);
                wConvSize += c.getBytes("MS932").length;
                if (wConvSize > max_length) {
                    return wText.toString();
                }

                wText.append(pCharacterSet[ThreadLocalRandom.current().nextInt(wCharacterSetLength)]);
            }
        } catch (Exception ex) {
            return StringUtils.EMPTY;
        }
        return wText.toString();
    }

}
