class UnityHelper

  def self.gui_xml

    fabrics = Property.find_by_name("Fabric").valuefields

    path = "#{Rails.root}/fabrics.xml"
    #file = File.new(path)

    xml =  "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"

    xml+="<fabrics>"

    for fabric in fabrics
      xml += "<fabric>"

      xml += "<code>#{fabric.code}</code>"
      xml += "<displaname>#{fabric.fieldvalue}</displaname>"
      xml += "<thumbnail>#{fabric.images[0].picture_file_name}</thumbnail>"
      xml += "<description></description>"

      xml += "</fabric>"
    end

    xml+="</fabrics>"

    #File.open(path, 'w') {|f| f.write(xml) }

    return xml

  end


end
