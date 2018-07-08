package com.andrievskaja.email;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;

@Component
public class SendEmail {

    private final int PORT = 465;
    private final String HOST = "smtp.mail.ru";
    static final String EMAIL = "test.java@bk.ru";
    static final String PASSWORD = "12345678pp";

    private final EmailSenderService senderStatic = new EmailSenderService(EMAIL, EMAIL, PASSWORD, PORT, HOST);

    public SendEmail() {
    }
    public void sendBillsEmail(
            byte[] bills,
            String fileName,
            String email
    ) throws IOException, SendEmailException {
        EmailSenderService sender = new EmailSenderService(
                EMAIL,
                EMAIL,
                PASSWORD,
                PORT,
                HOST );
        //String tpl = "<a href='%url%'>Подтвердить</a>";
        String sCurrentLine = "";
        sender.send("Счет", "Счет на оплату", fileName, bills, "application/pdf", email);
    }

 

    public void resetPassword(String email, String password) throws IOException, SendEmailException {
//        EmailSenderService sender = new EmailSenderService(EMAIL, EMAIL, PASSWORD);
        //String tpl = "<a href='%url%'>Подтвердить</a>";
        InputStream is = getClass().getResourceAsStream("/templete/forgot-password.html");
        BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
        String sCurrentLine = "";
        String line = br.readLine();
        while (line != null) {
            sCurrentLine += line;
            line = br.readLine();
        }
        sCurrentLine = sCurrentLine.replaceAll("%password%", password);
        senderStatic.send(
                "Изменение пароля", sCurrentLine, email);
    }
}
//Path path = Paths.get("/your/path/string");
//if(!Files.exists(path)) {
//    try {
//      Files.createDirectories(path);
//    } catch (IOException e) {
//      e.printStackTrace();
//    }
//}
