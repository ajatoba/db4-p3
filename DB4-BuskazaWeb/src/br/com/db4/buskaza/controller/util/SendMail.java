
package br.com.db4.buskaza.controller.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;


public class SendMail {
    
    /* Hashtable de propriedades */
    private static Properties props = new Properties();
    private Session mailsession;
    
    /** Holds value of property smtpServer. */
    private String smtpServer;
    
    /** Holds value of property to. */
    private String to;
    
    /** Holds value of property from. */
    private String from;
    
    /** Holds value of property subject. */
    private String subject;
    
    /** Holds value of property message. */
    private String message;
    
    /** Holds value of property contentType. */
    private String contentType;
    
    /** Holds value of property cc. */
    private String cc;
    
    /** Holds value of property bcc. */
    private String bcc;
    
    /** Creates a new instance of SendMail */
    public SendMail() {
    }
    
    /** Getter for property smtpServer.
     * @return Value of property smtpServer.
     *
     */
    public String getSmtpServer() {
        return this.smtpServer;
    }    
    
    /** Setter for property smtpServer.
     * @param smtpServer New value of property smtpServer.
     *
     */
    public void setSmtpServer(String smtpServer) {
        this.smtpServer = smtpServer;
        if((smtpServer != null) && (props != null)) props.put("mail.smtp.host", this.smtpServer);
    }
    
    /** Getter for property addressee.
     * @return Value of property addressee.
     *
     */
    public String getTo() {
        return this.to;
    }
    
    /** Setter for property addressee.
     * @param addressee New value of property addressee.
     *
     */
    public void setTo(String to) {
        this.to = to;
    }
    
    /** Getter for property sender.
     * @return Value of property sender.
     *
     */
    public String getFrom() {
        return this.from;
    }
    
    /** Setter for property sender.
     * @param sender New value of property sender.
     *
     */
    public void setFrom(String from) {
        this.from = from;
    }
    
    /** Getter for property subject.
     * @return Value of property subject.
     *
     */
    public String getSubject() {
        return this.subject;
    }
    
    /** Setter for property subject.
     * @param subject New value of property subject.
     *
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }
    
    /** Getter for property message.
     * @return Value of property message.
     *
     */
    public String getMessage() {
        return this.message;
    }
    
    /** Setter for property message.
     * @param message New value of property message.
     *
     */
    public void setMessage(String message) {
        this.message = message;
    }
    
    /** Getter for property messageType.
     * @return Value of property messageType.
     *
     */
    public String getContentType() {
        return this.contentType;
    }
    
    /** Setter for property messageType.
     * @param messageType New value of property messageType.
     *
     */
    public void setContentType(String contentType) {
        this.contentType = contentType;
    }
    
    /** Getter for property cc.
     * @return Value of property cc.
     *
     */
    public String getCc() {
        return this.cc;
    }
    
    /** Setter for property cc.
     * @param cc New value of property cc.
     *
     */
    public void setCc(String cc) {
        this.cc = cc;
    }
    
    /** Getter for property bcc.
     * @return Value of property bcc.
     *
     */
    public String getBcc() {
        return this.bcc;
    }
    
    /** Setter for property bcc.
     * @param bcc New value of property bcc.
     *
     */
    public void setBcc(String bcc) {
        this.bcc = bcc;
    }
    
    public void send() throws Exception {
        
        if(this.to == null)         throw new Exception("Erro: Destinatrio do e-mail não informado.");
        if(this.from == null)       throw new Exception("Erro: Remetente do e-mail não informado.");
        if(this.subject == null)    throw new Exception("Erro: Título do e-mail não informado");
        if(this.message == null)    throw new Exception("Erro: Mensagem do e-mail não informada.");
        
        try{
            /* Obtendo uma inst�ncia do SMTP */
            Session session=Session.getInstance(props,null);
            Message msg=new MimeMessage(session);
            /* Carregando os atributos do e-mail */
            msg.setFrom(new InternetAddress(this.from));
            InternetAddress[] tos   = InternetAddress.parse(this.to);
            msg.setRecipients(Message.RecipientType.TO,tos);
            if(this.cc != null){
                InternetAddress[] ccs   = InternetAddress.parse(this.cc);
                msg.setRecipients(Message.RecipientType.CC,ccs);
            }
            if(this.bcc != null){
                InternetAddress[] bccs  = InternetAddress.parse(this.bcc);
                msg.setRecipients(Message.RecipientType.BCC,bccs);
            }
            msg.setSubject(MimeUtility.encodeText(this.subject, "ISO-8859-1", null));
            if("html".equals(this.contentType)){
                msg.setHeader("Content-Transfer-Encoding", "8bit");
                msg.setHeader("Content-Type", "text/html; charset=ISO-8859-1");
                msg.setContent(this.message,"text/html");
            }
            else{
                msg.setHeader("Content-Transfer-Encoding", "8bit");
                msg.setHeader("Content-Type", "text/plain; charset=ISO-8859-1");
                msg.setText(this.message);
            }
            msg.setSentDate(new Date());
            Transport.send(msg);
        }
        catch(Exception e){
            throw e;
        }
    }
    
    public static void main (String args[]){
        SendMail sm = new SendMail();
        sm.setSmtpServer("smtp.gmail.com"); 
        sm.setFrom("jcarlos@advicenet.com.br");
        sm.setTo("vinicius@advicenet.com.br");
        sm.setSubject("Teste de acentua��o"); 
        sm.setMessage("1- ���� 2- ��#� 3- ��?� 4- ���� <b>5- ��?�</b>");
        try{
            sm.setContentType("html");
            sm.send();
            System.out.println("Enviado com sucesso...");
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
}
