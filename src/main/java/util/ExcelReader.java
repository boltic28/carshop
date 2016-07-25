package util;

import models.Car;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import java.io.*;

/**
 * Created by Siarhei Baltrukevich on 12.07.2016.
 */
public class ExcelReader{

    public static Car parse(InputStream stream) throws IOException {

        InputStream in = null;
        HSSFWorkbook wb = null;
        String[] resultArr = new String[32];
        int i = 0;

            in = stream;
            wb = new HSSFWorkbook(in);

        Sheet sheet = wb.getSheetAt(0);
        for (Row row : sheet) {
            for (Cell cell : row) {
                int cellType = cell.getCellType();
                switch (cellType) {
                    case Cell.CELL_TYPE_STRING:
                        resultArr[i++] = cell.getStringCellValue();
                        break;
                    case Cell.CELL_TYPE_NUMERIC:
                        resultArr[i++] = String.valueOf((int)cell.getNumericCellValue());
                        break;
                    default:
                        resultArr[i++] = "";
                        break;
                }
            }
        }

        return new Car(0, Integer.parseInt(resultArr[11]), Integer.parseInt(resultArr[13]), Integer.parseInt(resultArr[15]), 0, resultArr[1], resultArr[3], resultArr[5], resultArr[7],
                resultArr[17], resultArr[9], resultArr[19], resultArr[27], resultArr[29], resultArr[31], resultArr[23].equals("1"), resultArr[21].equals("1"), resultArr[25].equals("1"));
    }
}
