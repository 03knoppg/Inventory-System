class Generator < ApplicationController


  def self.xml_from_path(path)

    s = "<product><id type=\"integer\">3</id><name>Basic Chair</name><description>Fluid Basic Task Chair</description><created-at type=\"datetime\">2011-09-29T02:14:14Z</created-at><updated-at type=\"datetime\">2011-09-29T02:14:14Z</updated-at></product>"

    send_data(s,:type => "text/xml", :filename => "abc.xml")


  end





end

