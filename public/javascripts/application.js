function qrcode(message, width, height, image_id)
{
  if (image_id == null) image_id = "qrcode";    
  var qrcode = document.getElementById(image_id);

  if(qrcode != null) {
    if (width  == null) width  = 200;
    if (height == null) height = 200;
  
    var base            = "http://chart.apis.google.com/chart?cht=qr";
    var escaped_message = escape(message);
  
    qrcode.alt         = message;
    qrcode.src         = base    + 
                          "&chl=" + escaped_message  +
                          "&chs=" + width.toString() + 
                          "x"     + height.toString();

    return true;
  } 

  return false;
}
