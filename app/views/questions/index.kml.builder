xml.instruct!             # <?xml version="1.0" encoding="UTF-8"?>
xml.kml :xmlns  "http://www.opengis.net/kml/2.2" do

  @questions.each do |question|
    xml.question do
      xml.lat(question.x)
      xml.lng(question.y)
      xml.location(question.location)
      xml.question(question.question)
    end
  end
end