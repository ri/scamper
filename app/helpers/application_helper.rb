# Methods added to this helper will be available to all templates in the application.

require 'cgi'

module ApplicationHelper
  # 
  # Output an image tag. Everything except for the message is optional.
  #
  # e.g.
  #   
  #    <%= qrcode("My message", :id => "qrcode_img", :width => 300, :height => 300) %>
  # 
  def qrcode(message, options = {})
    options.symbolize_keys!
    
    image_id        = options[:id]     || 'qrcode'
    width           = (options[:width]  || 200).to_s
    height          = (options[:height] || 200).to_s
    
    dimensions      = "#{width}x#{height}"
    
    options         = {:alt => message, :id => image_id, :size => dimensions}
    base_url        = "http://chart.apis.google.com/chart?cht=qr"
    size            = "&chs=" + dimensions;
    escaped_message = "&chl=" + CGI.escape(message);
    
    image           = base_url + escaped_message + size
    
    image_tag(image, options)
  end
end
