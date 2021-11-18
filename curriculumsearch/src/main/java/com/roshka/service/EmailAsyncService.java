package com.roshka.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

@Service
public class EmailAsyncService {

    @Autowired
    private JavaMailSender mailSender;

    @Async
    public void sendEmail(String recipientEmail, String link)
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom("test@test.com", "Sistema de Postulacion");
        helper.setTo(recipientEmail);

        String subject = "Aqui tienes el link para volver a definir tu password";

        String content = "<p>Hola!,</p>"
                + "<p>Has solicitado una re-definicion de password.</p>"
                + "<p>Haz click en el link de abajo para re-definir tu password:</p>"
                + "<p><a href=\"" + link + "\">Cambiar password</a></p>"
                + "<br>"
                + "<p>Ignora y no compartas este mail si no has solicitado un cambio de password.";

        helper.setSubject(subject);

        helper.setText(content, true);

        mailSender.send(message);

    }
}