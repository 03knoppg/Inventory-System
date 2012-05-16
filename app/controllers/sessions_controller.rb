class SessionsController < ApplicationController

  require "all_seating_helper.rb"
  require "xml_dump.rb"
  require "unity_helper.rb"

  skip_before_filter :require_login, :except => [:destroy]

  def show

  end

  def index
    redirect_to login_url
  end

  def new

    if(!params[:unity].nil?)
      if(params[:unity] == "getUI")
        ui_xml = UnityHelper.gui_xml

        respond_to do |format|
          format.html { render :xml => ui_xml }
        end


      else

        redirect_to Image.find_by_picture_file_name(params[:unity]).picture.url(:original)

      end
    end



    #chcek for updates to inventory
    if(!params[:checkupdate].nil?)

      date = params[:checkupdate]

      date = date.to_datetime

      CheckDate.new.check_date(date)


    end

    if(!params[:update].nil?)

      XmlDump.new.xml_dump


    end

    #For retrieving xml file - ipad app
    if(!params[:available].nil?)

      for cat in Category.all
        if(cat.name == "Building A")
          #productCode = params[:available]
          products = cat.products
          xml = "<Suites>"
          for product in products
            if !product.valuefields.empty?
              xml += "<Suite>"
              xml += "<SuiteNumber>"
              xml += product.name
              xml += "</SuiteNumber>"
              xml += "<SuiteAvailability>"
              xml += product.valuefields[0].fieldvalue
              xml += "</SuiteAvailability>"
              xml += "<SuiteCode>"
              xml += product.code
              xml += "</SuiteCode>"
              xml += "</Suite>"
            end
          end
          xml += "</Suites>"
          send_data xml, :type => 'text/plain',:disposition=>'inline'
          #send_data xml

          #path = File.expand_path("~/available.xml")
          #File.open(path, 'w') {|f| f.write(xml) }
          #send_file path, :type=>"application/zip"
        end
      end



    end

    #for posting to server from ipad app
    if(!params[:codeVF].nil?)
      xml = ""
      valuefields = Valuefield.all
      for vf in valuefields
        if(vf.code == params[:codeVF])
          if(vf.fieldvalue == "true")
            vf.update_attributes(:fieldvalue, "false")
             #vf.fieldvalue = "false"
             #vf.save!
            xml = "<Message>Success</Message>"
          else
            xml = "<Message>Failure</Message>"
          end
        end
      end
      send_data xml, :type => 'text/plain',:disposition=>'inline'

      #path = File.expand_path("~/test.xml")
      #File.open(path, 'w') {|f| f.write(xml) }
      #send_file path, :type=>"application/zip"
    end

    #Minto availability site
    if(!params[:Minto].nil?)

      if(params[:Minto] == "Update")

        redirect_to("/sessions/Minto/")
      else
        redirect_to("/sessions/MintoCheck")
      end

    end

    #character model example
    if(!params[:code].nil?)
      code = params[:code].split("_")

      category = Category.find_all_by_name("Characters")

      data = DataFile.find_by_filedata_file_name(params[:code])
      path = File.expand_path("~/testXML.xml")
      send_file path, :type=>"application/zip"
      #redirect_to(data.filedata.url)

      return

    end

    #All Seating example
    if(params[:TYPE] != nil)

      php_args = []
      php_args.push(params[:TYPE])
      php_args.push(params[:BACKTYPE])
      php_args.push(params[:CONTROL])
      php_args.push(params[:ARMS])
      php_args.push(params[:OPTIONS])
      php_args.push(params[:FABRIC])

      hash = AllSeatingHelper.all_seating_path_translator(php_args)
      hash = AllSeatingHelper.all_seating_expand_hash(hash)

      test_dir = "/var/www/allseating/bin/chairs/textures/Series82_0_19/"
      generic_xml_path = test_dir + "testFile.xml"

      generic_xml = AllSeatingHelper.all_seating_xml_from_hash(hash.keys[0], hash)
      AllSeatingHelper.all_seating_write_to_file(generic_xml_path, generic_xml)

      #get textures
      AllSeatingHelper.all_seating_texture_xml(generic_xml_path, test_dir)

      #get dae
      AllSeatingHelper.all_seating_dae(generic_xml_path, test_dir)

      #get models
      AllSeatingHelper.all_seating_texture(generic_xml_path, test_dir)

      AllSeatingHelper.all_seating_copy_file("/home/hans2/public_html/Inventory-System/public/images/14/original/original_F4-PCABER.jpg",test_dir + "F4-PCABER.jpg")

    end

  end



  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to admin_path, :notice => ""
    else
      flash[:alert] = "Email or password was invalid."
      redirect_to login_url
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => ""
  end


  def update_minto

      p = Product.find_by_name(params[:id])
      p.valuefields[0].update_attribute(:fieldvalue,   params[:checked])
  end

   def update_minto_price

      p = Product.find_by_name(params[:id])
      p.valuefields[1].update_attribute(:fieldvalue,   params[:price])
  end


end
