package factory;

import common.Const;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;
import org.apache.commons.lang3.StringUtils;

public enum DataFactory {
    INSTANCE;

    public String perform(Map<String, Object> params) {

        switch ((String) params.get("setting")) {
            case Const.Setting.SEQ -> {
                return performSeqVal(params);
            }
            case Const.Setting.FIX -> {
                return performFixedVal(params);
            }
            case Const.Setting.RANDOM -> {
                return performRandomVal(params);
            }
            case Const.Setting.RANGE -> {
                return performRangeVal(params);
            }
        }
        return "";
    }

    private String performSeqVal(Map<String, Object> params) {

//        Pattern wPattern = Pattern.compile("(\\D*)(\\d+)");
//        Matcher wMatcher = wPattern.matcher(pColumnInfo.getCriteriaSet());
//        String wGenerate = StringUtils.EMPTY;
//        int wIncrementalValue = 0;
//
//        if (StringUtils.isBlank(pColumnInfo.getIncremental())) {
//            wIncrementalValue = pRecordIndex;
//        } else {
//            wIncrementalValue = pRecordIndex * Integer.parseInt(pColumnInfo.getIncremental());
//        }
//
//        if (wMatcher.matches()) {
//            String wNonNumericPart = wMatcher.group(1);
//            String wNumericPart = wMatcher.group(2);
//            long wNumericValue = Long.parseLong(wNumericPart);
//
//            wNumericValue += wIncrementalValue;
//
//            if (pColumnInfo.isNumeric()) {
//                long wMaxValue = (long) Double.parseDouble(NumericGenerateFactory.getMaxRangeValue(pColumnInfo)) + 1;
//                wGenerate = NumericGenerateFactory.getNumberWithScale(wNumericValue % wMaxValue,
//                        pColumnInfo.getNumeric_scale());
//            } else {
//                int wIncrementLength = pColumnInfo.getMaxLength() - wNonNumericPart.length();
//                wGenerate = StringUtils.join(wNonNumericPart,
//                        paddingZero((long) (wNumericValue % Math.pow(10, wIncrementLength)), wIncrementLength));
//            }
//        } else {
//
//            if (pColumnInfo.isNumeric()) {
//                long wMaxValue = (long) Double.parseDouble(NumericGenerateFactory.getMaxRangeValue(pColumnInfo)) + 1;
//                wGenerate = NumericGenerateFactory.getNumberWithScale(
//                        (Double.parseDouble(pColumnInfo.getCriteriaSet()) + wIncrementalValue) % wMaxValue, pColumnInfo.getNumeric_scale());
//            } else {
//                int wIncrementLength = pColumnInfo.getMaxLength() - pColumnInfo.getCriteriaSet().length();
//                wGenerate = StringUtils.join(pColumnInfo.getCriteriaSet(),
//                        paddingZero((long) (wIncrementalValue % Math.pow(10, wIncrementLength)), wIncrementLength));
//            }
//
//        }
        return "";
    }

    private String performFixedVal(Map<String, Object> params) {
        final String refVal = (String) params.getOrDefault("ref", "");
        final boolean numeric = (boolean) params.getOrDefault("numeric", false);
         if (StringUtils.isBlank(refVal)) {
            if (numeric) {
                return "0";
            }
            return StringUtils.SPACE;
        }

        return StringUtils.trim(refVal);
    }

    private String performRandomVal(Map<String, Object> params) {
        
        final boolean numeric = params.containsKey("numeric");
        
        final boolean character = (boolean) params.getOrDefault("character", false);
        final String param = (String) params.getOrDefault("param", false);

        if (numeric) {
            final Map<String, Object> numMap = (Map) params.get("numeric");
            if (StringUtils.isNotBlank(param)) {
                List<String> wParams = Arrays.stream(StringUtils.split(param, ","))
                        .map(String::trim)
                        .collect(Collectors.toList());
                Collections.sort(wParams);

                return NumericFactory.INSTANCE.range(wParams.get(0), wParams.get(1), (Integer) numMap.get("scale"));
            }

            return NumericFactory.INSTANCE.random(params);
        } else if (character) {
            final String random = (String) params.getOrDefault("random", "");
            final String dataType = (String) params.getOrDefault("data_type", "text");
            
            return CharacterFactory.INSTANCE.random(random, dataType);
        }
        return "";
    }

    private String performRangeVal(Map<String, Object> params) {
        final String paramStr = (String) params.get("param");
        final List<String> wParams = Arrays.stream(StringUtils.split(paramStr, ",")).map(String::trim)
                        .collect(Collectors.toList());

        return wParams.get(ThreadLocalRandom.current().nextInt(wParams.size()));
    }
}
