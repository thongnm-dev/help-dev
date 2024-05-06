package factory;

import Cmn.Const;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;
import jp.co.enecom.ma_tanaka.time.MtDate;
import model.DataTableModel;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author enercom34
 */
public class DateGenerateFactory {

    /**
     * カラム情報を元に日付データ作成
     *
     * @param pColumnInfo カラム情報
     * @return 日付データが作成された
     */
    public static String generateRandomDate(DataTableModel pColumnInfo) {
        String wDateFormat = getDateFormat(pColumnInfo.getColumn_name());

        MtDate wStart = MtDate.now().setYear(1970);
        MtDate wEnd = MtDate.now().setYear(2999);
        if (StringUtils.isNotBlank(wDateFormat)) {
            if (StringUtils.isBlank(pColumnInfo.getParameter())) {
                return MtDate.of(generateDate(wStart.toDate().getTime(), wEnd.toDate().getTime())).format(wDateFormat);
            } else {
                String[] wDateRange = StringUtils.split(pColumnInfo.getParameter(), Const.DEFAULT_DELIMITER);
                if (Const.YEAR.matcher(wDateRange[0]).matches()) {
                    wStart = MtDate.of(StringUtils.join(wDateRange[0], "0101080000"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH.matcher(wDateRange[0]).matches()) {
                    wStart = MtDate.of(StringUtils.join(wDateRange[0], "01080000"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH_DD.matcher(wDateRange[0]).matches()) {
                    wStart = MtDate.of(StringUtils.join(wDateRange[0], "080000"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH_DD_HH.matcher(wDateRange[0]).matches()) {
                    wStart = MtDate.of(StringUtils.join(wDateRange[0], "0101"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH_DD_HH_MM.matcher(wDateRange[0]).matches()) {
                    wStart = MtDate.of(StringUtils.join(wDateRange[0], "00"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH_DD_HH_MM_SS.matcher(wDateRange[0]).matches()) {
                    wStart = MtDate.of(wDateRange[0], Const.DateFormat.DATETIME_FORMAT);
                }

                if (Const.YEAR.matcher(wDateRange[1]).matches()) {
                    wEnd = MtDate.of(StringUtils.join(wDateRange[1], "1231080000"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH.matcher(wDateRange[1]).matches()) {
                    wEnd = MtDate.of(StringUtils.join(wDateRange[1], "01080000"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH_DD.matcher(wDateRange[1]).matches()) {
                    wEnd = MtDate.of(StringUtils.join(wDateRange[1], "080000"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH_DD_HH.matcher(wDateRange[1]).matches()) {
                    wEnd = MtDate.of(StringUtils.join(wDateRange[1], "0101"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH_DD_HH_MM.matcher(wDateRange[1]).matches()) {
                    wEnd = MtDate.of(StringUtils.join(wDateRange[1], "01"), Const.DateFormat.DATETIME_FORMAT);
                } else if (Const.YEAR_MONTH_DD_HH_MM_SS.matcher(wDateRange[1]).matches()) {
                    wEnd = MtDate.of(wDateRange[1], Const.DateFormat.DATETIME_FORMAT);
                }
                return MtDate.of(generateDate(wStart.toDate().getTime(), wEnd.toDate().getTime())).format(wDateFormat);
            }
        }

        return StringUtils.EMPTY;
    }

    /**
     * 日付データ作成
     *
     * @param pStart
     * @param pEnd
     * @return 日付データ
     */
    public static Date generateDate(long pStart, long pEnd) {
        return new Date(ThreadLocalRandom.current().nextLong(pStart, pEnd));
    }

    /**
     * カラム名に年月日に関する文字が入っているかチェック
     *
     * @param pColumnName カラム名
     * @return 処理結果
     */
    public static boolean isDateColumn(String pColumnName) {
        return Const.DATE_FORMATS.entrySet().stream().anyMatch((set) -> (pColumnName.endsWith(set.getKey())));
    }

    /**
     * カラム名を元に日付フォーマット取得
     *
     * @param pColumnName カラム名
     * @return 日付形式
     */
    public static String getDateFormat(String pColumnName) {
        String wDateFormat = StringUtils.EMPTY;

        for (Map.Entry<String, String> set : Const.DATE_FORMATS.entrySet()) {
            if (pColumnName.endsWith(set.getKey())) {
                wDateFormat = set.getValue();
                break;
            }
        }

        return wDateFormat;
    }

    /**
     * カラム情報を元にインクリメントの日付の値作成
     *
     * @param pColumnInfo カラム情報
     * @param pRecordIndex 作成中のレコードのインデックス
     * @return インクリメントの日付の値
     */
    public static String generateSequentialDate(DataTableModel pColumnInfo, int pRecordIndex) {
        String wDateFormat = getDateFormat(pColumnInfo.getColumn_name());
        int incrementalValue;
        MtDate wDefaultValue;

        if (isValidDate(pColumnInfo.getCriteriaSet(), wDateFormat)) {
            wDefaultValue = MtDate.of(pColumnInfo.getCriteriaSet(), wDateFormat);
        } else {
            wDefaultValue = MtDate.now();
        }

        if (StringUtils.isBlank(pColumnInfo.getIncremental())) {
            incrementalValue = pRecordIndex;
        } else {
            incrementalValue = pRecordIndex * Integer.parseInt(pColumnInfo.getIncremental());
        }

        switch (wDateFormat) {
            case Const.DateFormat.NENDO_FORMAT:
                return wDefaultValue.addYear(incrementalValue).format(Const.DateFormat.NENDO_FORMAT);
            case Const.DateFormat.YM_FORMAT:
                return wDefaultValue.addMonth(incrementalValue).format(Const.DateFormat.YM_FORMAT);
            case Const.DateFormat.YMD_FORMAT:
                return wDefaultValue.addDay(incrementalValue).format(Const.DateFormat.YMD_FORMAT);
            case Const.DateFormat.DATETIME_FORMAT:
                return wDefaultValue.addSecond(incrementalValue).format(Const.DateFormat.DATETIME_FORMAT);
            default:
                break;
        }

        return StringUtils.EMPTY;
    }

    /**
     * 妥当日付チェック処理
     *
     * @param pDate 日付値
     * @param pDateFormat 日付形式
     * @return 処理結果
     */
    public static boolean isValidDate(String pDate, String pDateFormat) {
        DateFormat wSdf = new SimpleDateFormat(pDateFormat);

        try {
            wSdf.parse(pDate);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
