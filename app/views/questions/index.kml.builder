xml.instruct!             # <?xml version="1.0" encoding="UTF-8"?>
xml.kml(:xmlns=>'http://www.opengis.net/kml/2.2') do
  xml.Document do
    @questions.each do |question|
      xml.Placemark do
        xml.name(question.id)
        xml.description(question.location)
        xml.Point do
          xml.coordinates(question.x.to_s + ',' + question.y.to_s)
        end
      end
    end
  end
end