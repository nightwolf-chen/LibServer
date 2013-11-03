/* 
 *  Copyright 2013 Jidong Chen, Inc. All rights reserved.
 * 
 */

function newXMLHttpRequest(){
    
    if(window.XMLHttpRequest){
        xmlHttp = new XMLHttpRequest() ;
    }
    else if(window.ActiveXObject){
        
        try{
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP") ;
        }catch(e1){
            try{
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP") ;
            }catch(e2){
                xmlHttp = false ;
            }
        }
        
    }
    return xmlHttp ;
}
