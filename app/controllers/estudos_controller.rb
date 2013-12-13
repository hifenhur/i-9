# -*- encoding : utf-8 -*-
class EstudosController < ApplicationController
  skip_before_filter :authenticate_user!, only:[:index, :show]
  before_action :set_estudo, only: [:show, :edit, :update, :destroy]

  # GET /estudos
  # GET /estudos.json
  def index
    @estudos = Estudo.paginate(page: params[:page], per_page: 6)
  end

  # GET /estudos/1
  # GET /estudos/1.json
  def show
    @document = @estudo.documents.build
  end

  # GET /estudos/new
  def new
    @estudo = Estudo.new
  end

  # GET /estudos/1/edit
  def edit
  end

  # POST /estudos
  # POST /estudos.json
  def create
    @estudo = Estudo.new(estudo_params)

    respond_to do |format|
      if @estudo.save
        format.html { redirect_to @estudo, notice: 'O Estudo Foi criado' }
        format.json { render action: 'show', status: :created, location: @estudo }
      else
        format.html { render action: 'new' }
        format.json { render json: @estudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estudos/1
  # PATCH/PUT /estudos/1.json
  def update
    respond_to do |format|
      if @estudo.update(estudo_params)
        format.html { redirect_to @estudo, notice: 'Estudo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @estudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estudos/1
  # DELETE /estudos/1.json
  def destroy
    @estudo.destroy
    respond_to do |format|
      format.html { redirect_to estudos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estudo
      @estudo = Estudo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estudo_params
      params.require(:estudo).permit(:title, :description, :image, :buttom_color, :brief_description)
    end
end
