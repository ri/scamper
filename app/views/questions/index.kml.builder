xml.instruct!             # <?xml version="1.0" encoding="UTF-8"?>
xml.kml do
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