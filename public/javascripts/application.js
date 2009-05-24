/*
  Change a QRCode image on the page

  e.g.
    
    qrcode("message to encode", {'id': 'qrcode_img', 'width': 300, 'height': 300})
*/
function qrcode(message, options)
{
  image_id = (options.id || "qrcode").toString();
  width    = (options.width  || 200).toString();
  height   = (options.height || 200).toString(); 

  var qrcode = document.getElementById(image_id);

  if (qrcode != null) {
    var base_url        = "http://chart.apis.google.com/chart?cht=qr";
    var size            = "&chs=" + width + "x" + height;
    var escaped_message = "&chl=" + escape(message);
  
    // set it empty first while the size changes so
    // it doesn't get skewed for a second
    qrcode.src          = "";
    qrcode.alt          = message;
    qrcode.width        = width;
    qrcode.height       = height;
    qrcode.src          = base_url + escaped_message + size;
    
    return qrcode;
  } 

  return null;
}
