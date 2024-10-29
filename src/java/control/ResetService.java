/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;

import java.time.LocalDateTime;
import java.util.Properties;
import com.sun.mail.util.MailSSLSocketFactory;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author HP
 */
public class ResetService {
    private final int LIMIT_MINUS = 10;
    static final String FROM_EMAIL = "cohienkiu12345@gmail.com";
    static final String FROM_PASSWORD = "nfqd swqp sijg xrtd"; // App Password của bạn
    
    public String generateToken() {
        return java.util.UUID.randomUUID().toString();
    }
    
    public LocalDateTime expireDateTime() {
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }
    
    public boolean isExpireTime(LocalDateTime time) {
        return LocalDateTime.now().isAfter(time);
    }
    
    public boolean sendEmail(String to, String token, String name) {
        String resetLink = "http://localhost:9999/myfirst/resetPassword?token=" + token;
        
        try {
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");
            props.put("mail.smtp.ssl.trust", "*");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.ssl.socketFactory", sf);
            
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(FROM_EMAIL, FROM_PASSWORD);
                }
            });
            
            session.setDebug(true); // Enable debug mode
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Reset Password");
            
            String htmlContent = "<div style='font-family: Arial, sans-serif;'>"
                + "<h2>Xin chào " + name + "!</h2>"
                + "<p>Bạn đã yêu cầu đặt lại mật khẩu. Vui lòng click vào link bên dưới để tiếp tục:</p>"
                + "<p><a href='" + resetLink + "' style='padding: 10px 20px; background-color: #4CAF50; "
                + "color: white; text-decoration: none; border-radius: 5px;'>Đặt lại mật khẩu</a></p>"
                + "<p>Link này sẽ hết hạn sau " + LIMIT_MINUS + " phút.</p>"
                + "<p>Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>"
                + "</div>";
            
            message.setContent(htmlContent, "text/html; charset=UTF-8");
            Transport.send(message);
            
            System.out.println("Email sent successfully to: " + to);
            return true;
        } catch (Exception e) {
            System.out.println("Failed to send email: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
