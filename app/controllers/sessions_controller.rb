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
      UnityHelper.gui_xml
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

    #character model example
    if(!params[:code].nil?)
      code = params[:code].split("_")

      category = Category.find_all_by_name("Characters")

      data = DataFile.find_by_filedata_file_name(params[:code])


      redirect_to(data.filedata.url)

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

      AllSeatingHelper.all_seating_copy_file("/home/franz2/public_html/Inventory-System/public/images/14/original/original_F4-PCABER.jpg",test_dir + "F4-PCABER.jpg")

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







end
