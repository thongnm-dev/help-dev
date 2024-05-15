package factory;

import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author thongnm
 */
public class NumericFactory {

    public static String range(String min, String max, int pNumericScale) {

        double wRandomDecimal = ThreadLocalRandom.current().nextDouble(Double.parseDouble(min), Double.parseDouble(max));

//        return getNumberWithScale(wRandomDecimal, pNumericScale);
        return "";
    }

    public static String random() {
//        String wMin;
//        String wMax = getMaxRangeValue(pColumnInfo);
//
//        if (pColumnInfo.getData_type().contains("serial")) {
//            wMin = "1";
//        } else {
//            wMin = StringUtils.join("-", wMax);
//        }
//
//        return range(wMin, wMax, pColumnInfo.getNumeric_scale());
        return "";
    }
    
//    public static String rangeMax(DataTableModel pColumnInfo) {
//
//        if (pColumnInfo.getNumeric_scale() == 0) {
//            return StringUtils.repeat("9", pColumnInfo.getMaxLength());
//        }
//
//        return StringUtils.join(StringUtils.repeat("9", pColumnInfo.getMaxLength() - pColumnInfo.getNumeric_scale()), ".",
//                StringUtils.repeat("9", pColumnInfo.getNumeric_scale()));
//    }
//
//    public static String rangeMaxVal(DataTableModel pColumnInfo) {
//        String wMax;
//        String wMaxRange = getMaxRange(pColumnInfo);
//        String wDefaultMaxRange = Const.DataTypes.NUMERIC_MAX_VALUES.get(pColumnInfo.getData_type());
//
//        if (Double.parseDouble(wMaxRange) > Double.parseDouble(wDefaultMaxRange)) {
//            wMax = wDefaultMaxRange;
//        } else {
//            wMax = wMaxRange;
//        }
//
//        return wMax;
//    }
//
//    public static String numScale(double pNumber, int pNumericScale) {
//        return BigDecimal.valueOf(pNumber).setScale(pNumericScale, RoundingMode.HALF_UP).toString();
//    }
}
