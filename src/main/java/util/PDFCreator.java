package util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import models.Car;

import java.io.FileOutputStream;
import java.util.Date;

/**
 * Created by Siarhei Baltrukevich on 31.07.2016.
 */
public class PDFCreator {

        static int FONT_SIZE_SMALL = 16;
        static int FONT_SIZE_BIG = 32;

//        public static void main(String[] args) throws Exception {
//            createTemplate(new Car(0, 2015, 6200, 55222, 99999, "audi", "a4", "Auto", "gray", "sedan", "diesel", "used", "105a.jpg", "img2", "img3", true, true, false), "Sergey");
//        }

        public static void createTemplate(Car car, String userName) throws Exception {
            Document document = new Document(PageSize.A4, 20, 10, 10, 10);

            Font font1 = new Font(Font.FontFamily.HELVETICA,
                    FONT_SIZE_BIG, Font.BOLD);
            Font font2 = new Font(Font.FontFamily.HELVETICA,
                    FONT_SIZE_SMALL, Font.ITALIC | Font.UNDERLINE);

            PdfWriter.getInstance(document,
                    new FileOutputStream(car.getId() + ".pdf"));

            document.open();

            // отцентрированный параграф
            Paragraph title = new Paragraph("Description of your good", font1);
            title.setAlignment(Element.ALIGN_CENTER);
            title.setSpacingAfter(FONT_SIZE_BIG);
            document.add(title);

            // Image.getInstance("sample.png")
            // картинка, загруженная по URL
            Image stamp;
//            String imageUrl = "pages/img/" + car.getImg1();
//            stamp = Image.getInstance(new URL(imageUrl));
            //картинка с файловой системы
            stamp = Image.getInstance("107a.jpg"); //"carshop/images/car/" + car.getImg1()
            stamp.setAlignment(Element.ALIGN_CENTER);
            stamp.scaleAbsolute(400f, 300f);
            stamp.setSpacingAfter(15);

            document.add(stamp);

            PdfPTable t = new PdfPTable(2);
            t.setSpacingBefore(20);
            t.setSpacingAfter(10);
            PdfPCell c1 = new PdfPCell(new Phrase("Field"));
            t.addCell(c1);
            PdfPCell c2 = new PdfPCell(new Phrase("Description"));
            t.addCell(c2);
            t.addCell("Brand");            t.addCell(car.getBrand().toUpperCase());
            t.addCell("Model");            t.addCell(car.getModel().toUpperCase());
            t.addCell("Odo value");        t.addCell(String.valueOf(car.getOdo()) + " km");
            t.addCell("Frame type");       t.addCell(car.getFrame().toUpperCase());
            t.addCell("Year");             t.addCell(String.valueOf(car.getYear()));
            t.addCell("Color");            t.addCell(car.getColor().toUpperCase());
            t.addCell("Engine type");      t.addCell(car.getEngine().toUpperCase());
            t.addCell("Transmition type"); t.addCell(car.getTransmition().toUpperCase());
            t.addCell("Price");            t.addCell("$" + String.valueOf(car.getPrice()));

            document.add(t);



            // параграф с текстом
            Paragraph purpose = new Paragraph("EfTech", font2);
            purpose.setSpacingAfter(FONT_SIZE_BIG);
            document.add(purpose);

            // параграф с фразой, в которую добавлен чанк
            Paragraph date = new Paragraph();
            date.setFont(font2);
            Phrase phrase = new Phrase();
            phrase.add(new Chunk("Date" + new Date().toString()));
            date.add(phrase);
            document.add(date);

            document.add(new Paragraph("Login of user - " + userName, font2));

            Paragraph footer = new Paragraph(
                    "Develop by - ");

            // ссылка
            Anchor anchor = new Anchor("Boltic28");
            anchor.setReference("http://vk.com/boltic28");
            footer.add(anchor);

            footer.setAlignment(Element.ALIGN_LEFT);
            footer.setSpacingBefore(FONT_SIZE_BIG);
            document.add(footer);


            document.close();
        }
}
