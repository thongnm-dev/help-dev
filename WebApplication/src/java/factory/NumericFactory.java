package factory;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author thongnm
 */
public enum NumericFactory {

    INSTANCE;

    public String range(String min, String max, Integer pNumericScale) {

        double wRandomDecimal = ThreadLocalRandom.current().nextDouble(Double.parseDouble(min), Double.parseDouble(max));

        return numScale(wRandomDecimal, pNumericScale);
    }

    public String random(Map<String, Object> param) {
//        String wMin;
//        String wMax = rangeMax(pColumnInfo);
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
    
//    public String rangeMax(DataTableModel pColumnInfo) {
//
//        if (pColumnInfo.getNumeric_scale() == 0) {
//            return StringUtils.repeat("9", pColumnInfo.getMaxLength());
//        }
//
//        return StringUtils.join(StringUtils.repeat("9", pColumnInfo.getMaxLength() - pColumnInfo.getNumeric_scale()), ".",
//                StringUtils.repeat("9", pColumnInfo.getNumeric_scale()));
//    }
//
//    public String rangeMaxVal(DataTableModel pColumnInfo) {
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
    private String numScale(double pNumber, int pNumericScale) {
        return BigDecimal.valueOf(pNumber).setScale(pNumericScale, RoundingMode.HALF_UP).toString();
    }
}
