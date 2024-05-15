package factory;

import common.Const;
import java.util.Arrays;
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
//         if (StringUtils.isBlank(pColumnInfo.getCriteriaSet())) {
//            if (Const.DataTypes.NUMERIC_TYPES.containsKey(pColumnInfo.getData_type())) {
//                return Const.DEFAULT_NUMERIC;
//            }
//            return Const.HALF_SPACE;
//        }
//
//        return pColumnInfo.getCriteriaSet().trim();

        return "";
    }

    private String performRandomVal(Map<String, Object> params) {
        
//        if (StringUtils.isNotBlank(pColumnInfo.getParameter())) {
//            List<String> wParams = Arrays.stream(pColumnInfo.getParameter().split(Const.DEFAULT_DELIMITER))
//                    .map(String::trim)
//                    .collect(Collectors.toList());
//            Collections.sort(wParams);
//
//            return NumericGenerateFactory.generateRanged(wParams.get(0), wParams.get(1),
//                    pColumnInfo.getNumeric_scale());
//        }
//
//        if (Const.DataTypes.NUMERIC_TYPES.containsKey(pColumnInfo.getData_type())) {
//            return NumericGenerateFactory.generateRandomNumeric(pColumnInfo);
//        } else if (Const.DataTypes.CHARACTER_TYPES.containsKey(pColumnInfo.getData_type())) {
//            return CharacterGenerateFactory.generateRandomText(pColumnInfo.getRandomValueOpt(),
//                    pColumnInfo.getCharacter_maximum_length() != 0 ? pColumnInfo.getCharacter_maximum_length()
//                    : Const.DataTypes.CHARACTER_TYPES.get(pColumnInfo.getData_type()));
//        }
        return "";
    }

    private String performRangeVal(Map<String, Object> params) {
        final String paramStr = (String) params.get("param");
        final List<String> wParams = Arrays.stream(StringUtils.split(paramStr, ",")).map(String::trim)
                        .collect(Collectors.toList());

        return wParams.get(ThreadLocalRandom.current().nextInt(wParams.size()));
    }
}
