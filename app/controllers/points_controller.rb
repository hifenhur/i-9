# -*- encoding : utf-8 -*-
class PointsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @map = Map.find(params[:map_id])
    @points = @map.points.unscoped
  end

  def create
    @point = Point.new(point_params)
    @map = Map.find(point_params[:map_id])
    debugger
    @point.ip = request.ip
    if @point.save
      respond_to do |format|
        format.html{ redirect_to map_path(@point.map), notice: "Ponto criado com sucesso, aguarde até que seja aprovado para visualização"}
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


  def point_params
    params.require(:point).permit(:longitude, :latitude, :map_id, :title, :image, :description)
  end

end
