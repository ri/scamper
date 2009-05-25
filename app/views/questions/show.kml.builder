xml.instruct!             # <?xml version="1.0" encoding="UTF-8"?>
xml.kml(:xmlns=>'http://www.opengis.net/kml/2.2') do
  xml.Document do
      xml.Placemark do
        xml.name(@question.question)
        xml.description(@question.location)
        xml.Point do
        xml.coordinates(@question.x.to_s + ',' + @question.y.to_s + ',0')
      end
    end
  end
end