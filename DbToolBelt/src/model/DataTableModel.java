
package model;

import Cmn.Const;
import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

/**
 *
 *
 *
 */
@Getter
@Setter
public class DataTableModel implements Serializable {

    /**
     * テーブル名フラグ
     */
    private String table_name = StringUtils.EMPTY;

    /**
     * 項目名
     */
    private String column_name = StringUtils.EMPTY;

    /**
     * データ型
     */
    private String data_type = StringUtils.EMPTY;

    /**
     * データ型
     */
    private String is_nullable = StringUtils.EMPTY;

    /**
     * 主キー
     */
    private String primary_key = StringUtils.EMPTY;

    /**
     * 必須
     */
    private boolean required = false;

    /**
     * 文字最大長さ
     */
    private Integer character_maximum_length = 0;

    /**
     * 数値精密
     */
    private Integer numeric_precision = 0;

    /**
     * 数値スケール
     */
    private Integer numeric_scale = 0;

    /**
     *
     */
    private Integer ordinal_position = 0;

    /**
     * パラメータ
     */
    private String parameter = StringUtils.EMPTY;

    /**
     * 設定値
     */
    private String typeSet = StringUtils.EMPTY;

    /**
     * 基準値
     */
    private String criteriaSet = StringUtils.EMPTY;

    /**
     * 増分値
     */
    private String incremental = StringUtils.EMPTY;

    /**
     * 前ゼロ埋め
     */
    private boolean prezeroPadded = false;

    /**
     * 乱数値
     */
    private String randomValueOpt = StringUtils.EMPTY;

    /**
     *
     */
    private boolean randomValueOptsDisabled = false;

    /**
     *
     */
    private boolean parameterDisabled = false;

    /**
     *
     */
    private boolean criteriaSetDisabled = false;

    /**
     *
     */
    private boolean incrementalDisabled = false;

    public boolean isNumeric() {
        return Const.DataTypes.NUMERIC_TYPES.containsKey(this.data_type);
    }

    public String getFullType() {
        if (Const.DataTypes.NUMERIC_TYPES.containsKey(data_type)) {
            if (data_type.contains("int")) {
                return data_type;
            }

            return numeric_precision == 0 ? data_type
                    : StringUtils.join(data_type, "(", numeric_precision,
                            numeric_scale == 0 ? StringUtils.EMPTY : StringUtils.join(",", numeric_scale), ")");
        } else if (Const.DataTypes.CHARACTER_TYPES.containsKey(data_type)) {
            return character_maximum_length == 0 ? data_type : StringUtils.join(data_type, "(", character_maximum_length, ")");
        }

        return data_type;
    }

    public int getMaxLength() {

        if (Const.DataTypes.NUMERIC_TYPES.containsKey(data_type)) {
            if (data_type.toLowerCase().contains("int") && Const.DataTypes.NUMERIC_TYPES.containsKey(data_type)) {
                return Const.DataTypes.NUMERIC_TYPES.get(data_type);
            }
            return numeric_precision == 0 ? Const.DataTypes.NUMERIC_TYPES.get(data_type) : numeric_precision;
        } else if (Const.DataTypes.CHARACTER_TYPES.containsKey(data_type)) {
            return character_maximum_length == 0 ? Const.DataTypes.CHARACTER_TYPES.get(data_type) : character_maximum_length;
        } else if (Const.DataTypes.DATE_TIME_TYPES.containsKey(data_type)) {
            return Const.DEFAULT_MAX_CHARACTER_LENGTH;
        } else if (Const.DataTypes.BOOLEAN_TYPE.containsKey(data_type)) {
            return 4;
        }

        return Const.DEFAULT_MAX_CHARACTER_LENGTH;
    }

    public String getIncremental() {
        if (StringUtils.isBlank(incremental)) {
            return StringUtils.EMPTY;
        }
        return incremental;
    }

    public boolean getIsRequired() {
        return !"YES".equals(is_nullable);
    }

    public String getRequiredStr() {
        return getIsRequired() ? "Y" : StringUtils.EMPTY;
    }

    public String getPrimaryKey() {
        return getIsPrimaryKey() ? "PK" : StringUtils.EMPTY;
    }

    public boolean getIsPrimaryKey() {
        return Boolean.parseBoolean(primary_key);
    }
}
