/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Prashant Agarwal
 */
public interface Keys {
    
    public static final String dbText="jdbc:mysql://localhost:3306/record";
    public static final String dbID="root";
    public static final String dbPass="root";
    public static final String dpDirectory="C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\i-CAT\\profilepic";
    public static final String noticeDirectory="C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\i-CAT\\notices";
    public static EnDecryption enDecryption=EnDecryption.getInstance();
    public static final String techError1="ERROR : Technical Problem at Server.";
    public static final String techError=enDecryption.encryptNew("ERROR : Technical Problem at Server.");
    public static final String KEY_NOTICE_NID=enDecryption.encryptNew("nid");
    public static final String KEY_NOTICE_SNO=enDecryption.encryptNew("sno");
    public static final String KEY_NOTICE_SUB=enDecryption.encryptNew("subject");
    public static final String KEY_NOTICE_BODY=enDecryption.encryptNew("body");
    public static final String KEY_NOTICE_DATE=enDecryption.encryptNew("date");
    public static final String KEY_NOTICE_ATCH=enDecryption.encryptNew("attachment");
    public static final String KEY_NOTICE_issAuth=enDecryption.encryptNew("issuingAuthority");
    public static final String KEY_ERROR=enDecryption.encryptNew("error");
    public static final String KEY_NOTICE_NONEW=enDecryption.encryptNew("nonew");
    public static final String KEY_NOTICE_NOTICES=enDecryption.encryptNew("notices");
    
    public final static String KEY_UID=enDecryption.encryptNew("uid");
    public final static String KEY_UNAME=enDecryption.encryptNew("uname");
    public final static String KEY_AUTH=enDecryption.encryptNew("authority");
    public final static String KEY_DESG=enDecryption.encryptNew("designation");
    public final static String KEY_BRANCH=enDecryption.encryptNew("branch");
    public final static String KEY_SPLAUTH=enDecryption.encryptNew("specialAuthority");
    public final static String KEY_NONE=enDecryption.encryptNew("none");
    public final static String KEY_SPLAUTHDEPT=enDecryption.encryptNew("specialAuthorityDepartment");
    public final static String KEY_UNIQUELID=enDecryption.encryptNew("uniquelid");
    public final static String KEY_DATA=enDecryption.encryptNew("data");
    public final static String KEY_NOTICE_BRANCH=enDecryption.encryptNew("branch");
    public final static String KEY_NOTICE_AUTHO=enDecryption.encryptNew("auth");
    public final static String KEY_NOTICE_SPAUTH=enDecryption.encryptNew("splauth");
    public final static String KEY_STATUS=enDecryption.encryptNew("status");
    public final static String KEY_SUCCESSFUL=enDecryption.encryptNew("successful");
}
