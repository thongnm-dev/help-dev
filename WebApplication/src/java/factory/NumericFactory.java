package factory;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author thongnm
 */
public enum NumericFactory {

    INSTANCE;

    public String sequence(Map<String, Object> param, long numValue) {

        final String sequence = (String) param.getOrDefault("sequence", "");
        final int rowNum = (int) param.getOrDefault("rowNum", 1);
        
        final Map<String, Object> numeric = (Map) param.get("numeric");
        final int scale = (int) numeric.getOrDefault("scale", 0);
        final int precision = (int) numeric.getOrDefault("precision", 5);
        
        int sequenceCal = 0;
        if (StringUtils.isBlank(sequence)) {
            sequenceCal = rowNum;
        } else {
            sequenceCal = rowNum * Integer.parseInt(sequence);
        }
         
        if (scale == 0) {
            return StringUtils.repeat("9", precision);
        }
        
        long wMaxValue = maxValue(param).longValue() + 1;

        return numScale((numValue % wMaxValue) + sequenceCal, scale);
    }

    public String random(Map<String, Object> param) {

        final Map<String, Object> numeric = (Map) param.get("numeric");
        final int scale = (int) numeric.getOrDefault("scale", 0);
        
        return range("1", maxValue(param), scale);
    }

    public String range(String min, Double max, Integer pNumericScale) {

        double wRandomDecimal = ThreadLocalRandom.current().nextDouble(Double.parseDouble(min), max);

        return numScale(wRandomDecimal, pNumericScale);
    }

    private Double maxValue(Map<String, Object> param) {
        String wMax;
        String wMaxRange = defaultValue(param);
        String wDefaultMaxRange = "99999";

        if (Double.parseDouble(wMaxRange) > Double.parseDouble(wDefaultMaxRange)) {
            wMax = wDefaultMaxRange;
        } else {
            wMax = wMaxRange;
        }

        return Double.valueOf(wMax);
    }
    
    /**
     * defaultValue
     * @param param
     * @return 
     */
    private String defaultValue(Map<String, Object> param) {

        final Map<String, Object> numeric = (Map) param.get("numeric");
        final int scale = (int) numeric.getOrDefault("scale", 0);
        final int max_length = (int) numeric.getOrDefault("precision", 5);
        if (scale == 0) {
            return StringUtils.repeat("9", max_length);
        }

        return StringUtils.join(StringUtils.repeat("9", max_length - scale), ".", StringUtils.repeat("9", scale));
    }

    /**
     * 
     * @param pNumber
     * @param pNumericScale
     * @return 
     */
    private String numScale(double pNumber, int pNumericScale) {
        return BigDecimal.valueOf(pNumber).setScale(pNumericScale, RoundingMode.HALF_UP).toString();
    }
}
