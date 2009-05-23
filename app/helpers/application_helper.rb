# Methods added to this helper will be available to all templates in the application.

require 'cgi'

module ApplicationHelper
  def qrcode(message, width=200, height=200, image_id="qrcode")
    escaped_message = CGI.escape(message)
    image_tag("http://chart.apis.google.com/chart?cht=qr&chl=#{escaped_message}&chs=#{width}x#{height}", :alt => message, :id => image_id)
  end
end
