
            function encrypt(msg){
                     
                        if(((msg.length)%2)!==0){
            msg = msg + "!$!;!";
        }
        var reverse = msg.split("").reverse().join("");
        var length = reverse.length;
        var newS2Sub1 = reverse.substring(0,length/2);
        var newS2Sub2 = reverse.substring((length/2),length);
        var encryptMessage = newS2Sub2+newS2Sub1;
        var output = [encryptMessage.slice(0,2),"iAoplsnh",encryptMessage.slice(2)].join("");
       
                       return output;
                   } 
               
            function decrypt(msg){
        var b = msg.substring(0,2);
        var d = msg.length;
        var e = msg.substring(10,d);
        var f =b+e;
       
        var length = f.length;
        var sub1 =  f.substring(0,length/2 );
        var sub2 =  f.substring(length/2,length );
         var suba = sub1.split("").reverse().join("");
         var subb = sub2.split("").reverse().join("");
        var depryptmessage = (suba+subb).toString();
        var depryptmessagenew=depryptmessage.replace("!$!;!","").toString();
        return depryptmessagenew;
                   } 
      