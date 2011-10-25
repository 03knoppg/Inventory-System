class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  #Function for index page
  def index
    #create an array of all groups
    @all_groups = Group.all.sort {|x,y| x.name <=> y.name }
    #create an array of all components
    @all_components = Component.all.sort {|x,y| x.name <=> y.name }
    #create an empty string
    @sg = ""
    respond_to do |format|
      format.html # mainmenu.html.erb
      format.json { render json: @groups }
      format.xml { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  #Function for show page
  def show
    #Finds selected group
    @group = Group.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
      format.xml { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  #Function for new page
  def new
    #create a new group
    @group = Group.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  #Function for edit page
  def edit
    #Finds selected group
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  #Function to create groups
  def create
    #create a group to save
    @group = Group.new(params[:group])
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  #Function to update groups
  def update
    #create a group to update
    @group = Group.find(params[:id])
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  #Function to delete groups
  def destroy
    #Finds selected group
    @group = Group.find(params[:id])
    #destroys selected group
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :ok }
    end
  end
end
