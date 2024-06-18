package importfile;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.collections4.map.LinkedMap;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.eclipse.persistence.config.EntityManagerProperties;

/**
 *
 * @author thongnm
 */
public class ImportFile {

    private static final Map<String, String> properties = new HashMap<String, String>() {
        {
            put(EntityManagerProperties.JDBC_URL, "jdbc:postgresql://192.168.10.64:5432/ESS");
            put(EntityManagerProperties.JDBC_USER, "mowner01");
            put(EntityManagerProperties.JDBC_PASSWORD, "mowner01");
            put("eclipselink.jdbc.bind-parameters", "false");
        }
    };

    private static final List<String> workSheetIngore = Arrays.asList("変更履歴", "ER図");

    public static void main(String[] args) throws Exception {

        if (StringUtils.equals("1", args[0])) {
            tableLayout(args);
        } else if (StringUtils.equals("2", args[0])) {
            importMstData(args);
        }
    }

    public static void setting(String[] args) throws Exception {

        Map<String, Object> map = new LinkedMap<>();
        map.put("table_name", "kukm_hnyif");
        map.put("table_logical", "【共通】汎用情報");

        List<ColumnModel> columns = new ArrayList<>();
        
        Map<String, String> column = new LinkedMap<>();
        column.put("hny_skb_cd", "汎用識別コード");
        column.put("hny_skb_name", "汎用識別名称");
        column.put("hny_cdt", "汎用コード値");
        column.put("hny_skb_hssg_kbn", "汎用識別編集制御区分");
        column.put("hnyif_1", "汎用情報1");
        column.put("hnyif_2", "汎用情報2");
        column.put("hnyif_3", "汎用情報3");
        column.put("hnyif_4", "汎用情報4");
        column.put("hnyif_5", "汎用情報5");
        column.put("nkord", "並替順序");
        column.put("syu_kbn", "使用区分");
        
        int idx = 1;
        for(Map.Entry<String, String> entry : column.entrySet()) {
            
            ColumnModel model = new ColumnModel();
            model.rowNum = idx;
            model.align = Arrays.asList("hny_skb_cd", "hny_cdt").contains(entry.getKey()) ? "center" : "left";
            model.display = Arrays.asList("hny_skb_cd", "hny_cdt", "hnyif_1", "hnyif_2", "hnyif_3", "hnyif_4", "hnyif_5", "syu_kbn").contains(entry.getKey());
            model.property = entry.getKey();
            model.headerText = entry.getValue();
            columns.add(model);
            idx++;
        }

        map.put("columns", columns);

        ObjectMapper mapper = new ObjectMapper();

        String jsonStr = mapper.writeValueAsString(map);

        System.out.println(jsonStr);
    }

    /**
     * @param args the command line arguments
     * @throws java.lang.Exception
     */
    private static void tableLayout(String[] args) throws Exception {
        Stream<Path> paths = Files.walk(Paths.get(args[1]));

        /**
         * Row index of table logical
         */
        final int ROW_INDEX_TABLE_CMT = 2;

        /**
         * Row index of table physical
         */
        final int ROW_INDEX_TABLE_NAME = 4;

        /**
         * Row index of table column
         */
        final int ROW_INDEX_TABLE_COLUMN_ST = 8;

        try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("ImportFilePU", properties); EntityManager manager = emf.createEntityManager()) {

            paths.filter(Files::isRegularFile)
                    .filter(file -> "xlsx".equals(FilenameUtils.getExtension(file.toString())))
                    .forEach(file -> {
                        System.out.println(file.toString());
                        try (InputStream fileIs = new FileInputStream(file.toFile()); XSSFWorkbook workbook = new XSSFWorkbook(fileIs)) {

                            manager.getTransaction().begin();

                            Iterator<Sheet> workSheet = workbook.sheetIterator();

                            while (workSheet.hasNext()) {
                                Sheet sheet = workSheet.next();

                                if (!workSheetIngore.contains(sheet.getSheetName())) {
                                    List<Map<String, Object>> columns = new ArrayList<>();
                                    Iterator<Row> rowIterator = sheet.iterator();

                                    String wTbl = sheet.getRow(ROW_INDEX_TABLE_NAME).getCell(3).getStringCellValue();
                                    String wTblCmt = sheet.getRow(ROW_INDEX_TABLE_CMT).getCell(3).getStringCellValue();

                                    if (StringUtils.isBlank(wTbl)) {
                                        wTbl = sheet.getSheetName();
                                    }

                                    Map<String, Object> table = new HashMap<>();
                                    table.put("physical", wTbl);
                                    table.put("logical", wTblCmt);

                                    while (rowIterator.hasNext()) {
                                        Row row = rowIterator.next();

                                        if (row.getRowNum() < ROW_INDEX_TABLE_COLUMN_ST) {
                                            continue;
                                        }

                                        if (row.getCell(2) == null) {
                                            break;
                                        }

                                        String cellLogicalName = row.getCell(2).getStringCellValue();
                                        String cellPhysicalName = row.getCell(5).getStringCellValue();
                                        String cellDataType = row.getCell(9).getStringCellValue();
                                        String cellMaxLength = String.valueOf(row.getCell(10).getNumericCellValue());
                                        String cellAllowNull = row.getCell(12).getStringCellValue();
                                        String cellPrimaryKey = String.valueOf(row.getCell(13).getNumericCellValue());

                                        Map<String, Object> wColumn = new HashMap<>();
                                        wColumn.put("table_name", wTbl);
                                        wColumn.put("physical", cellPhysicalName);
                                        wColumn.put("logical", cellLogicalName);
                                        wColumn.put("data_type", cellDataType);
                                        wColumn.put("max_length", cellMaxLength);
                                        wColumn.put("nullable", "×".equals(cellAllowNull));
                                        wColumn.put("is_fk", StringUtils.isNotBlank(cellPrimaryKey) ? BigDecimal.ZERO.compareTo(new BigDecimal(cellPrimaryKey)) < 0 : false);

                                        columns.add(wColumn);
                                    }

                                    InsertTable(manager, table);

                                    if (!columns.isEmpty()) {
                                        InsertTableColumns(manager, columns);
                                    }
                                }

                            }
                            manager.getTransaction().commit();
                        } catch (Exception ex) {
                            manager.getTransaction().rollback();
                        }

                    });
        }
    }

    private static void InsertTable(EntityManager manager, Map<String, Object> table) {
        StringBuilder wSqlstr = new StringBuilder();

        wSqlstr.append(" INSERT INTO t_table ");
        wSqlstr.append("  ( ");
        wSqlstr.append("     physical ");
        wSqlstr.append("    ,logical ");
        wSqlstr.append("    ,project_id ");
        wSqlstr.append("  ) VALUES ");
        wSqlstr.append(" (");
        wSqlstr.append("     ?physical ");
        wSqlstr.append("    ,?logical ");
        wSqlstr.append("    ,1 ");
        wSqlstr.append("  ) ");

        Query query = manager.createNativeQuery(wSqlstr.toString());

        table.forEach((k, v) -> {
            query.setParameter(k, v);
        });

        query.executeUpdate();
    }

    private static void InsertTableColumns(EntityManager manager, Collection<Map<String, Object>> tableColumns) {

        tableColumns.forEach(tableCol -> {

            StringBuilder wSqlstr = new StringBuilder();

            wSqlstr.append(" INSERT INTO t_table_dtl ");
            wSqlstr.append("  ( ");
            wSqlstr.append("     table_name ");
            wSqlstr.append("    ,physical ");
            wSqlstr.append("    ,logical ");
            wSqlstr.append("    ,data_type ");
            wSqlstr.append("    ,max_length ");
            wSqlstr.append("    ,nullable ");
            wSqlstr.append("    ,is_fk ");
            wSqlstr.append("    ,project_id ");
            wSqlstr.append("  ) VALUES ");
            wSqlstr.append(" (");
            wSqlstr.append("     ?table_name ");
            wSqlstr.append("    ,?physical ");
            wSqlstr.append("    ,?logical ");
            wSqlstr.append("    ,?data_type ");
            wSqlstr.append("    ,?max_length ");
            wSqlstr.append("    ,?nullable ");
            wSqlstr.append("    ,?is_fk ");
            wSqlstr.append("    ,1 ");
            wSqlstr.append("  ) ");

            Query query = manager.createNativeQuery(wSqlstr.toString());

            tableCol.forEach((k, v) -> {
                query.setParameter(k, v);
            });

            query.executeUpdate();
        });
    }

    private static void importMstData(String[] args) throws Exception {
        Stream<Path> paths = Files.walk(Paths.get(args[1]));
        ObjectMapper mapper = new ObjectMapper();
        try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("ImportFilePU", properties); 
                EntityManager manager = emf.createEntityManager()) {
            paths.filter(Files::isRegularFile)
                    .filter(file -> "xlsx".equals(FilenameUtils.getExtension(file.toString())))
                    .forEach(file -> {
                        System.out.println(file.toString());
                        try (InputStream fileIs = new FileInputStream(file.toFile()); XSSFWorkbook workbook = new XSSFWorkbook(fileIs)) {
                            
                            manager.getTransaction().begin();

                            Iterator<Sheet> workSheet = workbook.sheetIterator();

                            while (workSheet.hasNext()) {
                                Sheet sheet = workSheet.next();

                                if (!workSheetIngore.contains(sheet.getSheetName())) {
                                    for (Row row : sheet) {
                                        if (row.getRowNum() < 4) {
                                            continue;
                                        }

                                        if (row.getCell(0) == null || row.getRowNum() > 3362) {
                                            break;
                                        }

                                        for (int i = 1; i <= 11; i++) {
                                            row.getCell(i).setCellType(CellType.STRING);
                                        }
                                        
                                        if (StringUtils.isBlank(row.getCell(1).getStringCellValue())
                                                || StringUtils.isBlank(row.getCell(3).getStringCellValue())
                                                || StringUtils.length(row.getCell(3).getStringCellValue()) > 10) {
                                            continue;
                                        }
                                        
                                        Map<String, Object> mstData = new LinkedHashMap<>();
                                        mstData.put("hny_skb_cd", row.getCell(1).getStringCellValue());
                                        mstData.put("hny_skb_name", row.getCell(2).getStringCellValue());
                                        mstData.put("hny_cdt", row.getCell(3).getStringCellValue());
                                        mstData.put("hny_skb_hssg_kbn", StringUtils.substring(row.getCell(4).getStringCellValue(), 0, 1));                                        
                                        mstData.put("hnyif_1", row.getCell(5).getStringCellValue());
                                        mstData.put("hnyif_2", row.getCell(6).getStringCellValue());
                                        mstData.put("hnyif_3", row.getCell(7).getStringCellValue());
                                        mstData.put("hnyif_4", row.getCell(8).getStringCellValue());
                                        mstData.put("hnyif_5", row.getCell(9).getStringCellValue());
                                        mstData.put("nkord", null);
                                        if (StringUtils.isBlank(row.getCell(10).getStringCellValue()) && StringUtils.isNumeric(row.getCell(10).getStringCellValue())) {
                                            mstData.put("nkord", new BigDecimal(row.getCell(10).getStringCellValue()));
                                        }
                                        mstData.put("syu_kbn", " ");
                                        
                                        String jsonStr = mapper.writeValueAsString(mstData);
                                        System.out.println(jsonStr);
                                        InsertMstTable(manager, mstData);
                                        
//                                        InsertMstTable(manager, jsonStr);
                                    }
                                }

                            }
                            manager.getTransaction().commit();
                        } catch (Exception ex) {
                            System.err.println(ex.getMessage());
                            manager.getTransaction().rollback();
                        }
                    });
        }
    }

    private static void InsertMstTable(EntityManager manager, Map<String, Object> param) {
        StringBuilder wSqlstr = new StringBuilder();

        wSqlstr.append(" INSERT "); 
        wSqlstr.append(" INTO essnewmoela.kukm_hnyif( "); 
        wSqlstr.append("     hny_skb_cd "); 
        wSqlstr.append("   , hny_skb_name "); 
        wSqlstr.append("   , hny_cdt "); 
        wSqlstr.append("   , hny_skb_hssg_kbn "); 
        wSqlstr.append("   , hnyif_1 "); 
        wSqlstr.append("   , hnyif_2 "); 
        wSqlstr.append("   , hnyif_3 "); 
        wSqlstr.append("   , hnyif_4 "); 
        wSqlstr.append("   , hnyif_5 "); 
        wSqlstr.append("   , nkord "); 
        wSqlstr.append("   , syu_kbn "); 
        wSqlstr.append("   , gymev_name "); 
        wSqlstr.append("   , tr_ymd_time "); 
        wSqlstr.append("   , tr_usr "); 
        wSqlstr.append("   , tr_pg "); 
        wSqlstr.append("   , upd_ymd_time "); 
        wSqlstr.append("   , upd_usr "); 
        wSqlstr.append("   , upd_pg "); 
        wSqlstr.append(" ) VALUES ( "); 
        wSqlstr.append("     ?hny_skb_cd "); 
        wSqlstr.append("   , ?hny_skb_name "); 
        wSqlstr.append("   , ?hny_cdt "); 
        wSqlstr.append("   , ?hny_skb_hssg_kbn "); 
        wSqlstr.append("   , ?hnyif_1 "); 
        wSqlstr.append("   , ?hnyif_2 "); 
        wSqlstr.append("   , ?hnyif_3 "); 
        wSqlstr.append("   , ?hnyif_4 "); 
        wSqlstr.append("   , ?hnyif_5 "); 
        wSqlstr.append("   , ?nkord "); 
        wSqlstr.append("   , ?syu_kbn "); 
        wSqlstr.append("   , 'BATCH' "); 
        wSqlstr.append("   , now() "); 
        wSqlstr.append("   , 'SYSTEM' "); 
        wSqlstr.append("   , 'BATCH' "); 
        wSqlstr.append("   , now() "); 
        wSqlstr.append("   , 'SYSTEM' "); 
        wSqlstr.append("   , 'BATCH' "); 
        wSqlstr.append(" ) "); 

        Query query = manager.createNativeQuery(wSqlstr.toString());
        
        for (Map.Entry<String, Object> entry : param.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }

        query.executeUpdate();
    }
    
    private static void InsertMstTable(EntityManager manager, String json) {
        StringBuilder wSqlstr = new StringBuilder();

        wSqlstr.append(" INSERT INTO t_mst_data ");
        wSqlstr.append("  ( ");
        wSqlstr.append("     table_target ");
        wSqlstr.append("    ,data_json ");
        wSqlstr.append("    ,project_id ");
        wSqlstr.append("  ) VALUES ");
        wSqlstr.append(" (");
        wSqlstr.append("     'kukm_hnyif' ");
        wSqlstr.append("    ,?data_json ");
        wSqlstr.append("    ,1 ");
        wSqlstr.append("  );");

        Query query = manager.createNativeQuery(wSqlstr.toString());
        query.setParameter("data_json", json);

        query.executeUpdate();
    }
    
    @Getter
    @Setter
    public static class ColumnModel {
        private int rowNum;
        private String headerText;
        private String property;
        private boolean display;
        private String align;
    }
}
