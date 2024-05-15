package importfile;

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
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Stream;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.eclipse.persistence.config.EntityManagerProperties;

/**
 *
 * @author thongnm
 */
public class ImportFile {

    public static void main(String[] args) throws Exception {
        Map<String, Object> map = null;
        
        final Map<String, Object> check = Optional.ofNullable(map).orElse(new HashMap<>());
        
        String ss ="" ;
    }
    /**
     * @param args the command line arguments
     * @throws java.lang.Exception
     */
    public static void main2(String[] args) throws Exception {
        Stream<Path> paths = Files.walk(Paths.get(args[0]));
        final List<String> workSheetIngore = Arrays.asList("変更履歴", "ER図");

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

        final Map<String, String> properties = new HashMap<String, String>() {
                    {
                        put(EntityManagerProperties.JDBC_URL, "jdbc:postgresql://localhost:5432/dev");
                        put(EntityManagerProperties.JDBC_USER, "beuser");
                        put(EntityManagerProperties.JDBC_PASSWORD, "admin@123");
                        put("eclipselink.jdbc.bind-parameters", "false");
                    }
                };
        
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
                                    List<Map<String, Object>> columns = new ArrayList<>();
                                    Iterator<Row> rowIterator = sheet.iterator();

                                    sheet.getMergedRegions();
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
}
