class MapsController < ApplicationController
  skip_before_filter :authenticate_user!, only:[:index, :show]
  # GET /documents
  # GET /documents.json
  def index
    @search = Map.search(params[:q])
    @documents = @search.result
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
      format.js
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @map = Map.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @map }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @map = Map.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map }
    end
  end

  # GET /documents/1/edit
  def edit
    @map = Map.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @map = Map.new(params[:map].permit([:file, :name]))

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render json: @map, status: :created, location: @map }
      else
        format.html { render action: "new" }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @map = Map.find(params[:id])

    respond_to do |format|
      if @map.update_attributes(params[:map])
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @map = Map.find(params[:id])
    @map.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end
end
