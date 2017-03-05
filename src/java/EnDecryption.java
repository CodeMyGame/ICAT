/**
 *
 * @author Prashant Agarwal
 */
public class EnDecryption {
    
    private static EnDecryption enDecryption;

    private EnDecryption()
    {
    }

    public static EnDecryption getInstance()
    {
        if(enDecryption==null)
            enDecryption=new EnDecryption();
        return enDecryption;
    }

    
    public String encrypt(String msg){
        String EncryptMessage=null;
        if((msg.length()%2)!=0){
            msg = msg + "!$!;!";
        }
        StringBuffer sb = new StringBuffer(msg);
        String newS = sb.reverse().toString();
        StringBuffer sb2 = new StringBuffer(newS);
        int length = sb2.length();
        String newS2Sub1 = sb2.substring(0,length/2);
        String newS2Sub2 = sb2.substring((length/2),length);
        EncryptMessage = newS2Sub2+newS2Sub1;
        StringBuffer sb3 = new StringBuffer(EncryptMessage);
        String addStr="";
        String seq="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        int i=0,ran=0;
        while(i!=8)
        {
            ran=(int)(Math.random()*62);
            addStr=addStr+seq.charAt(ran);
            i++;
        }
        String newEncrypted = sb3.insert(2,addStr).toString();
        return newEncrypted;
    }

    public String decrypt(String msgE){
        String DepryptMessage;
        StringBuffer sb = new StringBuffer(msgE);
        String msg = sb.delete(2,10).toString();
        StringBuffer decrypt = new StringBuffer(msg);
        int length = msg.length();
        String sub1 =  decrypt.substring(0,length/2 );
        String sub2 =  decrypt.substring(length/2,length );
        StringBuffer sb3 = new StringBuffer(sub1);
        StringBuffer sb4 = new StringBuffer(sub2);
        String sub11 = sb3.reverse().toString();
        String sub21 = sb4.reverse().toString();
        DepryptMessage = (sub11+sub21).toString();
        DepryptMessage=DepryptMessage.replace("!$!;!","");
        return DepryptMessage;
    }
    
    public String encryptNew(String msg){
        String EncryptMessage=null;
        if((msg.length()%2)!=0){
            msg = msg + "!$!;!";
        }
        StringBuffer sb = new StringBuffer(msg);
        String newS = sb.reverse().toString();
        StringBuffer sb2 = new StringBuffer(newS);
        int length = sb2.length();
        String newS2Sub1 = sb2.substring(0,length/2);
        String newS2Sub2 = sb2.substring((length/2),length);
        EncryptMessage = newS2Sub2+newS2Sub1;
        StringBuffer sb3 = new StringBuffer(EncryptMessage);
        String newEncrypted = sb3.insert(2,"iAoplsnh").toString();
        return newEncrypted;
    }
    
}
