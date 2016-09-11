package util;

import models.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;

/**
 * Created by Сергей on 27.08.2016.
 */
public class MailSender {
    private String username;
    private String password;
    private Properties props;

    public MailSender(String username, String password) {
        this.username = username;
        this.password = password;

        props = new Properties();
        props.put("mail.smtp.host", username);
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
    }

    public void send(String subject, List<Object> goods, User user, String toEmail){
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });



        try {
            Transport transport = session.getTransport();
            transport.connect("smpt.gmail.com", 465, username, password);

            Message message = new MimeMessage(session);
            //от кого
//            message.setFrom(new InternetAddress(username));
            //кому
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            //Заголовок письма
            message.setSubject(subject);
            //Содержимое
            message.setText(buildTableForOrder(goods, user));

            //Отправляем сообщение
            transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
        } catch (MessagingException e) {
            System.out.println("Вот дерьмо, опять не работает....");
            throw new RuntimeException(e);
        }
    }

    private String buildTableForOrder(List listOfObjects, User sender){

        return "Товарищ " + sender.getName() + " прислал Вам Хрень, размером " + listOfObjects.size() +
                " \n Ответить можно на его мыло - " + sender.getEmail();
    }
}
