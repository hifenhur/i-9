# -*- encoding : utf-8 -*-
class PointsController < ApplicationController
  skip_before_filter :authenticate_user!, except: [:index, :edit, :destroy, :update]

  def index
    @points = Point.unscoped
  end

  def create
    @point = Point.new(point_params)
    @map = Map.find(point_params[:map_id])
    @point.accepted = false
    @point.ip = request.ip
    respond_to do |format|
      if @point.save
        format.html{redirect_to @map, alert: "O ponto foi criado com sucesso, e passará por avaliação,
         logo logo estará disponivel no mapa, obrigado pela cooperação" }
        format.js
      end
    end
  end

  def new
    @map = Map.find(params[:map_id])
    @point = @map.points.build(params[:point])
    @point.save
    cookies[:points] += @point.id.to_s+","
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @point = Point.find(params[:id])
    @map = @point.map
    if @point.delete
        redirect_to edit_map_path(@map)
    end
  end

  def edit
    @map = Map.find(params[:map_id])
    @point = @map.points.unscoped.find(params[:id])
  end

  def update
    @point = Point.unscoped.find(params[:id])
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to @point.map, notice: 'O Ponto foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  def point_params
    params.require(:point).permit(:longitude, :latitude, :map_id, :title, :image, :description)
  end

end
