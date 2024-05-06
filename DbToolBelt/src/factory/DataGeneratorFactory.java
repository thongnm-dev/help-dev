package factory;

import Cmn.Const;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import model.DataTableModel;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author enercom34
 */
public class DataGeneratorFactory {

    /**
     * カラム情報を元にデータ作成
     *
     * @param pColumnInfo カラム情報
     * @param pRecordIndex 作成中のレコードのインデックス
     * @return データが作成された
     */
    public static String generateDataValues(DataTableModel pColumnInfo, int pRecordIndex) {
        String wResult = StringUtils.EMPTY;
        List<String> wParams;

        // カラムのデータ型を元にデータ作成
        switch (pColumnInfo.getTypeSet()) {
            case Const.TypeSet.SEQUENTIAL_VAL:
                if (StringUtils.isBlank(pColumnInfo.getCriteriaSet())
                        && Const.DataTypes.CHARACTER_TYPES.containsKey(pColumnInfo.getData_type())) {
                    return StringUtils.join("\"", StringUtils.SPACE, "\"");
                }
                wResult = DateGenerateFactory.isDateColumn(pColumnInfo.getColumn_name())
                        ? DateGenerateFactory.generateSequentialDate(pColumnInfo, pRecordIndex)
                        : generateSequential(pColumnInfo, pRecordIndex);
                break;
            case Const.TypeSet.FIXED_VAL:
                wResult = generateFixedValue(pColumnInfo);
                break;
            case Const.TypeSet.RANDOM_VAL:
                wResult = DateGenerateFactory.isDateColumn(pColumnInfo.getColumn_name())
                        ? DateGenerateFactory.generateRandomDate(pColumnInfo)
                        : generateRandomValue(pColumnInfo);
                break;
            case Const.TypeSet.SPECIFIED_VAL:
                wParams = Arrays.stream(pColumnInfo.getParameter().split(Const.DEFAULT_DELIMITER)).map(String::trim)
                        .collect(Collectors.toList());
                wResult = generateSpecifiedValues(wParams);
                break;
            default:
                break;
        }

        // 戻り値形式
        return processResult(wResult, pColumnInfo);
    }

    /**
     * カラム情報を元に連番データ作成
     *
     * @param pColumnInfo カラム情報
     * @param pRecordIndex 作成中のレコードのインデックス
     * @return 連番データが作成される
     */
    public static String generateSequential(DataTableModel pColumnInfo, int pRecordIndex) {
        Pattern wPattern = Pattern.compile("(\\D*)(\\d+)");
        Matcher wMatcher = wPattern.matcher(pColumnInfo.getCriteriaSet());
        String wGenerate = StringUtils.EMPTY;
        int wIncrementalValue = 0;

        if (StringUtils.isBlank(pColumnInfo.getIncremental())) {
            wIncrementalValue = pRecordIndex;
        } else {
            wIncrementalValue = pRecordIndex * Integer.parseInt(pColumnInfo.getIncremental());
        }

        if (wMatcher.matches()) {
            String wNonNumericPart = wMatcher.group(1);
            String wNumericPart = wMatcher.group(2);
            long wNumericValue = Long.parseLong(wNumericPart);

            wNumericValue += wIncrementalValue;

            if (pColumnInfo.isNumeric()) {
                long wMaxValue = (long) Double.parseDouble(NumericGenerateFactory.getMaxRangeValue(pColumnInfo)) + 1;
                wGenerate = NumericGenerateFactory.getNumberWithScale(wNumericValue % wMaxValue,
                        pColumnInfo.getNumeric_scale());
            } else {
                int wIncrementLength = pColumnInfo.getMaxLength() - wNonNumericPart.length();
                wGenerate = StringUtils.join(wNonNumericPart,
                        paddingZero((long) (wNumericValue % Math.pow(10, wIncrementLength)), wIncrementLength));
            }
        } else {

            if (pColumnInfo.isNumeric()) {
                long wMaxValue = (long) Double.parseDouble(NumericGenerateFactory.getMaxRangeValue(pColumnInfo)) + 1;
                wGenerate = NumericGenerateFactory.getNumberWithScale(
                        (Double.parseDouble(pColumnInfo.getCriteriaSet()) + wIncrementalValue) % wMaxValue, pColumnInfo.getNumeric_scale());
            } else {
                int wIncrementLength = pColumnInfo.getMaxLength() - pColumnInfo.getCriteriaSet().length();
                wGenerate = StringUtils.join(pColumnInfo.getCriteriaSet(),
                        paddingZero((long) (wIncrementalValue % Math.pow(10, wIncrementLength)), wIncrementLength));
            }

        }

        return wGenerate;
    }

    /**
     * 戻り値形式
     *
     * @param pText 処理対象テキストの値
     * @param pColumnInfo カラム情報
     * @return データが作成された
     */
    public static String processResult(String pText, DataTableModel pColumnInfo) {
        if ("null".equals(pText.toLowerCase())) {
            return pText;
        }

        String wResult = pColumnInfo.isPrezeroPadded() ? paddingZeroValue(pText, pColumnInfo) : pText;

        if (!Const.DataTypes.NUMERIC_TYPES.containsKey(pColumnInfo.getData_type())) {
            wResult = StringUtils.join("\"", wResult, "\"");
        }

        return wResult;
    }

    /**
     * カラム情報を元に前ゼロ埋め
     *
     * @param pText 処理対象テキストの値
     * @param pColumnInfo カラム情報
     * @return 前ゼロ埋めたテキスト
     */
    public static String paddingZeroValue(String pText, DataTableModel pColumnInfo) {

        if (Const.DataTypes.CHARACTER_TYPES.containsKey(pColumnInfo.getData_type())) {
            return paddingZero(pText, pColumnInfo.getMaxLength());
        }

        return pText;
    }

    /**
     * 指定長さで前ゼロ埋め
     *
     * @param number 前ゼロ埋める対象値
     * @param pLength 前ゼロ埋めた後の長さ
     * @return 前ゼロ埋めた値
     */
    public static String paddingZero(long number, int pLength) {
        return paddingZero(String.valueOf(number), pLength);
    }

    /**
     * 前ゼロ埋める対象値
     *
     * @param pText 前ゼロ埋める対象値
     * @param pLength 前ゼロ埋めた後の長さ
     * @return 前ゼロ埋めた値
     */
    public static String paddingZero(String pText, int pLength) {
        return StringUtils.leftPad(pText, pLength, "0");
    }

    /**
     * ランダム文字列作成
     *
     * @param pColumnInfo カラム情報
     * @return データが作成された
     */
    public static String generateRandomValue(DataTableModel pColumnInfo) {

        if (StringUtils.isNotBlank(pColumnInfo.getParameter())) {
            List<String> wParams = Arrays.stream(pColumnInfo.getParameter().split(Const.DEFAULT_DELIMITER))
                    .map(String::trim)
                    .collect(Collectors.toList());
            Collections.sort(wParams);

            return NumericGenerateFactory.generateRanged(wParams.get(0), wParams.get(1),
                    pColumnInfo.getNumeric_scale());
        }

        if (Const.DataTypes.NUMERIC_TYPES.containsKey(pColumnInfo.getData_type())) {
            return NumericGenerateFactory.generateRandomNumeric(pColumnInfo);
        } else if (Const.DataTypes.CHARACTER_TYPES.containsKey(pColumnInfo.getData_type())) {
            return CharacterGenerateFactory.generateRandomText(pColumnInfo.getRandomValueOpt(),
                    pColumnInfo.getCharacter_maximum_length() != 0 ? pColumnInfo.getCharacter_maximum_length()
                    : Const.DataTypes.CHARACTER_TYPES.get(pColumnInfo.getData_type()));
        }

        return StringUtils.EMPTY;
    }

    /**
     * ユーザが指定した値の中からランダムでどれか１つ出力
     *
     * @param pSpecifiedValues 指定値一覧
     * @return 指定値内のランダム値
     */
    public static String generateSpecifiedValues(List<String> pSpecifiedValues) {
        return pSpecifiedValues.get(ThreadLocalRandom.current().nextInt(pSpecifiedValues.size()));
    }

    /**
     * 基準値を出力
     *
     * @param pColumnInfo カラム情報
     * @return データが作成された
     */
    public static String generateFixedValue(DataTableModel pColumnInfo) {
        if (StringUtils.isBlank(pColumnInfo.getCriteriaSet())) {
            if (Const.DataTypes.NUMERIC_TYPES.containsKey(pColumnInfo.getData_type())) {
                return Const.DEFAULT_NUMERIC;
            }
            return Const.HALF_SPACE;
        }

        return pColumnInfo.getCriteriaSet().trim();
    }
}
