%dw 2.0
var chars = '\'"*&\\'
fun escapeSpecialSOQLChars(text: String, chars) = (
    do{
        var replaced = text replace chars[-1] with ("\\" ++ chars[-1])
        ---
        if(sizeOf(chars)>1)
         escapeSpecialSOQLChars(replaced, chars[0 to -2])   
        else
            (text replace chars[-1] with ("\\" ++ chars[-1] )) 
    }  
)