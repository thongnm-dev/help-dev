package factory;

import common.Const;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import org.apache.commons.lang3.StringUtils;

public enum DataFactory {
    INSTANCE;

    public String perform(Map<String, Object> param) {

        String result = StringUtils.EMPTY;
        switch ((String) param.get("setting")) {
            case Const.Setting.DEF, Const.Setting.SEQ -> {
                result = performSeqVal(param);
            }
            case Const.Setting.FIX -> {
                result = performFixedVal(param);
            }
            case Const.Setting.RANDOM -> {
                result = performRandomVal(param);
            }
            case Const.Setting.RANGE -> {
                result = performRangeVal(param);
            }
        }
        return result;
    }

    private String performSeqVal(Map<String, Object> param) {

        Pattern wPattern = Pattern.compile("(\\D*)(\\d+)");
        final String fixed = (String) param.getOrDefault("fixed", "");
        int rowNum = (int) param.get("no");

        Matcher wMatcher = wPattern.matcher(fixed);

        String matcherRef = wMatcher.matches() ? wMatcher.group(1) : fixed;

        long wNumericValue = wMatcher.matches() ? Long.parseLong(wMatcher.group(2)) : Long.parseLong(fixed);

        // the column is numeric
        if (param.containsKey("numeric")) {
            return NumericFactory.INSTANCE.sequence(param, wNumericValue);
        }

        // the column is character varying
        if (param.containsKey("character")) {
            final int length = (int) ((Map) param.get("character")).getOrDefault("max_length", 0);

            int wIncrementLength = length - StringUtils.length(matcherRef);

            return StringUtils.join(matcherRef, paddingZero((long) (wNumericValue % Math.pow(10, wIncrementLength)), wIncrementLength));
        }

        // The column is date
        if (param.containsKey("datetime")) {
            return DateTimeFactory.INSTANCE.sequence(param, rowNum);
        }
        
        return StringUtils.EMPTY;
    }

    private String performFixedVal(Map<String, Object> param) {
        final String fixed = (String) param.getOrDefault("fixed", "");

        // the column is numeric
        if (param.containsKey("numeric")) {

            return StringUtils.isNumeric(fixed) ? fixed : "0";
        }

        // the column is character varying
        if (param.containsKey("character")) {
            return fixed;
        }

        // The column is date
        if (param.containsKey("datetime")) {
            return DateTimeFactory.INSTANCE.fixed(param);
        }

        return StringUtils.trim(fixed);
    }

    private String performRandomVal(Map<String, Object> param) {

        final String paramVal = (String) param.getOrDefault("param", false);

        // the column is numeric
        if (param.containsKey("numeric")) {
            final Map<String, Object> numMap = (Map) param.get("numeric");

            if (StringUtils.isNotBlank(paramVal)) {

                List<String> wParams = Arrays.stream(StringUtils.split(paramVal, ","))
                        .map(String::trim)
                        .collect(Collectors.toList());

                Collections.sort(wParams);

                return NumericFactory.INSTANCE.range(wParams.get(0), Double.valueOf(wParams.get(1)), (Integer) numMap.get("scale"));
            }

            return NumericFactory.INSTANCE.random(param);

        }

        // the column is character varying
        if (param.containsKey("character")) {
            return CharacterFactory.INSTANCE.random(param);
        }

        // The column is date
        if (param.containsKey("datetime")) {
            return DateTimeFactory.INSTANCE.random(param);
        }
        
        return StringUtils.EMPTY;
    }

    /**
     *
     * @param param
     * @return
     */
    private String performRangeVal(Map<String, Object> param) {
        final String paramStr = (String) param.get("param");

        final List<String> wParams = Arrays.stream(StringUtils.split(paramStr, ","))
                .map(String::trim)
                .collect(Collectors.toList());
        
        // the column is numeric
        if (param.containsKey("numeric")) {
            return wParams.get(ThreadLocalRandom.current().nextInt(wParams.size()));
        }

        // the column is character varying
        if (param.containsKey("character")) {
            return CharacterFactory.INSTANCE.random(param);
        }

        // The column is date
        if (param.containsKey("datetime")) {
            return DateTimeFactory.INSTANCE.range(param);
        }
        
        return StringUtils.EMPTY;
    }

    /**
     *
     * @param number
     * @param pLength
     * @return
     */
    private String paddingZero(long number, int pLength) {
        return paddingZero(String.valueOf(number), pLength);
    }

    /**
     *
     * @param pText
     * @param pLength
     * @return
     */
    private String paddingZero(String pText, int pLength) {
        return StringUtils.leftPad(pText, pLength, "0");
    }
}
