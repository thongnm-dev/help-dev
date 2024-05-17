package factory;

import common.Const;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;
import jp.co.enecom.ma_tanaka.time.MtDate;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author thongnm
 */
public enum DateTimeFactory {

    INSTANCE;

    /**
     * random
     * @param param
     * @return 
     */
    public String random(Map<String, Object> param) {

        MtDate wStart = MtDate.now().setYear(1970);
        MtDate wEnd = MtDate.now().setYear(2999);

        final String datatype = (String) param.getOrDefault("data_type", "date");
        final String paramVal = (String) param.getOrDefault("param", "");

        final String format = StringUtils.contains(datatype, "date") ? Const.DateFormat.Format.DATE : Const.DateFormat.Format.DATETIME;

        if (StringUtils.isBlank(paramVal)) {
            return MtDate.of(random(wStart.toDate().getTime(), wEnd.toDate().getTime())).format(format);
        }

        String[] wDateRange = StringUtils.split(paramVal, ",");
        if (Const.YEAR.matcher(wDateRange[0]).matches()) {
            wStart = MtDate.of(StringUtils.join(wDateRange[0], "0101080000"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH.matcher(wDateRange[0]).matches()) {
            wStart = MtDate.of(StringUtils.join(wDateRange[0], "01080000"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH_DD.matcher(wDateRange[0]).matches()) {
            wStart = MtDate.of(StringUtils.join(wDateRange[0], "080000"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH_DD_HH.matcher(wDateRange[0]).matches()) {
            wStart = MtDate.of(StringUtils.join(wDateRange[0], "0101"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH_DD_HH_MM.matcher(wDateRange[0]).matches()) {
            wStart = MtDate.of(StringUtils.join(wDateRange[0], "00"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH_DD_HH_MM_SS.matcher(wDateRange[0]).matches()) {
            wStart = MtDate.of(wDateRange[0], Const.DateFormat.None.DATETIME);
        }

        if (Const.YEAR.matcher(wDateRange[1]).matches()) {
            wEnd = MtDate.of(StringUtils.join(wDateRange[1], "1231080000"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH.matcher(wDateRange[1]).matches()) {
            wEnd = MtDate.of(StringUtils.join(wDateRange[1], "01080000"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH_DD.matcher(wDateRange[1]).matches()) {
            wEnd = MtDate.of(StringUtils.join(wDateRange[1], "080000"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH_DD_HH.matcher(wDateRange[1]).matches()) {
            wEnd = MtDate.of(StringUtils.join(wDateRange[1], "0101"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH_DD_HH_MM.matcher(wDateRange[1]).matches()) {
            wEnd = MtDate.of(StringUtils.join(wDateRange[1], "01"), Const.DateFormat.None.DATETIME);
            
        } else if (Const.YEAR_MONTH_DD_HH_MM_SS.matcher(wDateRange[1]).matches()) {
            wEnd = MtDate.of(wDateRange[1], Const.DateFormat.None.DATETIME);
        }
        return MtDate.of(random(wStart.toDate().getTime(), wEnd.toDate().getTime())).format(format);
    }
    
    /**
     * sequence
     * @param param
     * @param pRecordIndex
     * @return 
     */
    public String sequence(Map<String, Object> param, int pRecordIndex) {
        
        final String datatype = (String) param.getOrDefault("data_type", "date");
        final String refVal = (String) param.getOrDefault("ref", "");
        final String sequence = (String) param.getOrDefault("sequence", "");

        final String noneFormat = StringUtils.contains(datatype, "date") ? Const.DateFormat.None.DATE : Const.DateFormat.None.DATETIME;
        final String format = StringUtils.contains(datatype, "date") ? Const.DateFormat.Format.DATE : Const.DateFormat.Format.DATETIME;
        
        int incrementalValue;
        MtDate wDefaultValue;

        if (isValidDate(refVal, noneFormat)) {
            wDefaultValue = MtDate.of(refVal, noneFormat);
        } else {
            wDefaultValue = MtDate.now();
        }

        if (StringUtils.isBlank(sequence)) {
            incrementalValue = pRecordIndex;
        } else {
            incrementalValue = pRecordIndex * Integer.parseInt(sequence);
        }

        switch (format) {
            case Const.DateFormat.None.DATE -> {
                return wDefaultValue.addDay(incrementalValue).format(Const.DateFormat.Format.DATE);
            }
            case Const.DateFormat.None.DATETIME -> {
                return wDefaultValue.addSecond(incrementalValue).format(Const.DateFormat.Format.DATETIME);
            }
        }

        return StringUtils.EMPTY;
    }
    
    /**
     * fixed
     * @param param
     * @return 
     */
    public String fixed(Map<String, Object> param) {
        final String refVal = (String) param.getOrDefault("ref", "");
        final String datatype = (String) param.getOrDefault("data_type", "date");
        
        final String noneFormat = StringUtils.contains(datatype, "date") ? Const.DateFormat.None.DATE : Const.DateFormat.None.DATETIME;
        final String format = StringUtils.contains(datatype, "date") ? Const.DateFormat.Format.DATE : Const.DateFormat.Format.DATETIME;
        
        if (isValidDate(refVal, noneFormat)) {
            return MtDate.of(refVal, noneFormat).format(format);
        }
        return MtDate.now().format(format);
    }
    
    /**
     * fixed
     * @param param
     * @return 
     */
    public String range(Map<String, Object> param) {
        return StringUtils.EMPTY;
    }
    
    /**
     * random
     * @param pStart
     * @param pEnd
     * @return 
     */
    private Date random(long pStart, long pEnd) {
        return new Date(ThreadLocalRandom.current().nextLong(pStart, pEnd));
    }

    /**
     * isValidDate
     * @param pDate
     * @param pDateFormat
     * @return 
     */
    private boolean isValidDate(String pDate, String pDateFormat) {
        DateFormat wSdf = new SimpleDateFormat(pDateFormat);

        try {
            wSdf.parse(pDate);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
