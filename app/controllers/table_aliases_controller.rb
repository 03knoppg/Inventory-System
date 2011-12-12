class TableAliasesController < ApplicationController
  # GET /table_aliases
  # GET /table_aliases.json
  def index
    @table_aliases = TableAlias.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_aliases }
    end
  end

  # GET /table_aliases/1
  # GET /table_aliases/1.json
  def show
    @table_alias = TableAlias.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_alias }
    end
  end

  # GET /table_aliases/new
  # GET /table_aliases/new.json
  def new
    @table_alias = TableAlias.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_alias }
    end
  end

  # GET /table_aliases/1/edit
  def edit
    @table_alias =  TableAlias.find(params[:id])
    #@table_alias = TableAlias.find(params[:id])
  end

  # POST /table_aliases
  # POST /table_aliases.json
  def create
    @table_alias = TableAlias.new(params[:table_alias])

    respond_to do |format|
      if @table_alias.save
        format.html { redirect_to @table_alias, notice: 'Table alias was successfully created.' }
        format.json { render json: @table_alias, status: :created, location: @table_alias }
      else
        format.html { render action: "new" }
        format.json { render json: @table_alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /table_aliases/1
  # PUT /table_aliases/1.json
  def update
    @table_alias = TableAlias.find(params[:id])

    respond_to do |format|
      if @table_alias.update_attributes(params[:table_alias])
        format.html { redirect_to @table_alias, notice: 'Table alias was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @table_alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_aliases/1
  # DELETE /table_aliases/1.json
  def destroy
    @table_alias = TableAlias.find(params[:id])
    @table_alias.destroy

    respond_to do |format|
      format.html { redirect_to table_aliases_url }
      format.json { head :ok }
    end
  end
end
