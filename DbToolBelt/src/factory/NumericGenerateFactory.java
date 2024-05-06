package factory;

import Cmn.Const;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.concurrent.ThreadLocalRandom;
import model.DataTableModel;
import org.apache.commons.lang3.StringUtils;

public class NumericGenerateFactory {

    /**
     * 指定範囲内のランダム数字作成
     *
     * @param min 最小値
     * @param max 最大値
     * @param pNumericScale 小数点以下桁数
     * @return データが作成された
     */
    public static String generateRanged(String min, String max, int pNumericScale) {

        double wRandomDecimal = ThreadLocalRandom.current().nextDouble(Double.parseDouble(min), Double.parseDouble(max));

        return getNumberWithScale(wRandomDecimal, pNumericScale);
    }

    /**
     * 指定桁数でランダム数字作成
     *
     * @param pColumnInfo カラム情報
     * @return データが作成された
     */
    public static String generateRandomNumeric(DataTableModel pColumnInfo) {
        String wMin;
        String wMax = getMaxRangeValue(pColumnInfo);

        if (pColumnInfo.getData_type().contains("serial")) {
            wMin = "1";
        } else {
            wMin = StringUtils.join("-", wMax);
        }

        return generateRanged(wMin, wMax, pColumnInfo.getNumeric_scale());
    }

    public static String getMaxRange(DataTableModel pColumnInfo) {

        if (pColumnInfo.getNumeric_scale() == 0) {
            return StringUtils.repeat("9", pColumnInfo.getMaxLength());
        }

        return StringUtils.join(StringUtils.repeat("9", pColumnInfo.getMaxLength() - pColumnInfo.getNumeric_scale()), ".",
                StringUtils.repeat("9", pColumnInfo.getNumeric_scale()));
    }

    public static String getMaxRangeValue(DataTableModel pColumnInfo) {
        String wMax;
        String wMaxRange = getMaxRange(pColumnInfo);
        String wDefaultMaxRange = Const.DataTypes.NUMERIC_MAX_VALUES.get(pColumnInfo.getData_type());

        if (Double.parseDouble(wMaxRange) > Double.parseDouble(wDefaultMaxRange)) {
            wMax = wDefaultMaxRange;
        } else {
            wMax = wMaxRange;
        }

        return wMax;
    }

    public static String getNumberWithScale(double pNumber, int pNumericScale) {
        return BigDecimal.valueOf(pNumber).setScale(pNumericScale, RoundingMode.HALF_UP).toString();
    }

}
