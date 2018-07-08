/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.andrievskaja.email;

import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.simplejavamail.email.Email;
import org.simplejavamail.mailer.Mailer;
import org.simplejavamail.mailer.config.ServerConfig;
import org.simplejavamail.mailer.config.TransportStrategy;

public class EmailSenderService {

//    private final int PORT = 465;
    private int PORT;

    private String ADMIN_NAME;
    private String ADMIN_EMAIL;
    private String ADMIN_PASSWORD;

    private Email email;

//    private final String HOST = "smtp.gmail.com";
    private String HOST;

//    public static EmailSender getInstance() {
//        if(INSTANCE==null) {
//            INSTANCE = new EmailSender(null, null, null);
//        }
//        return INSTANCE;
//    }
//
//    public static EmailSender getInstance(String name, String email, String password) {
//        if(INSTANCE ==null) {
//            INSTANCE = new EmailSender(name, email, password);
//        }
//        return INSTANCE;
//    }
    public EmailSenderService(String name, String email, String password, int PORT, String HOST) {
        if (name != null & email != null & password != null) {
            this.ADMIN_NAME = name;
            this.ADMIN_EMAIL = email;
            this.ADMIN_PASSWORD = password;
            this.PORT = PORT;
            this.HOST = HOST;

            this.email = new Email();

        } else {
            throw new NullPointerException("");
        }
    }

    public void setCredentials(String name) {
        this.ADMIN_NAME = name;
    }

    public void setCredentials(String name, String email) {
        this.ADMIN_NAME = name;
        this.ADMIN_EMAIL = email;
    }

    public void setCredentials(String name, String email, String password) {
        this.ADMIN_NAME = name;
        this.ADMIN_EMAIL = email;
        this.ADMIN_PASSWORD = password;
    }

    public String getName() {
        return ADMIN_NAME;
    }

    public String getEmail() {
        return ADMIN_EMAIL;
    }

    public String getPassword() {
        return ADMIN_PASSWORD;
    }

    public void send(String subject, String tpl, String... recipients) throws SendEmailException {

        try {

            this.email.setSubject(subject);
            this.email.setTextHTML(tpl);
            this.email.setFromAddress(ADMIN_NAME, ADMIN_EMAIL);
            this.email.addNamedToRecipients("", recipients);

            send(this.email);

        } catch (Exception ex) {
            System.out.println("Ошибка отправки письма");
            Logger.getLogger(EmailSenderService.class.getName()).log(Level.SEVERE, "Ошибка отправки письма");
            throw new SendEmailException("Ошибка отправки письма");
        }

    }

    public void send(String subject, String tpl, String fileName, byte[] fileBytes, String fileType, String... recipients) throws SendEmailException {

        try {
            this.email.setSubject(subject);
            this.email.setTextHTML(tpl);
            this.email.setFromAddress(ADMIN_NAME, ADMIN_EMAIL);
            this.email.addNamedToRecipients("", recipients);
            this.email.addAttachment(fileName, fileBytes, fileType);
            this.send(this.email);
        } catch (Exception e) {
            System.out.println("Ошибка отправки письма");
            Logger.getLogger(EmailSenderService.class.getName()).log(Level.SEVERE, "Ошибка отправки письма");
            throw new SendEmailException("Ошибка отправки письма");
        }

    }

    private void send(Email EMAIL)  {
        new Mailer(new ServerConfig(HOST, PORT, ADMIN_EMAIL, ADMIN_PASSWORD), TransportStrategy.SMTP_SSL).sendMail(EMAIL, true);
    }

}
