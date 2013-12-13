# -*- encoding : utf-8 -*-
class SurveyVersionsController < ApplicationController
  skip_before_filter :authenticate_user!, only:[:index, :show]
  before_action :set_survey_version, only: [:show, :edit, :update, :destroy]

  # GET /survey_versions
  # GET /survey_versions.json
  def index
    @survey_versions = SurveyVersion.all
  end

  # GET /survey_versions/1
  # GET /survey_versions/1.json
  def show
  end

  # GET /survey_versions/new
  def new
    @survey_version = SurveyVersion.new
  end

  # GET /survey_versions/1/edit
  def edit
  end

  # POST /survey_versions
  # POST /survey_versions.json
  def create
    @survey_version = SurveyVersion.new(survey_version_params)
    @survey_version.save
    respond_to do |format|
        format.html { redirect_to @survey_version.survey, notice: 'A versão do Questionario foi criada com sucesso' }
        format.json { render action: 'show', status: :created, location: @survey_version }
    end
  end

  # PATCH/PUT /survey_versions/1
  # PATCH/PUT /survey_versions/1.json
  def update
    respond_to do |format|
      if @survey_version.update(survey_version_params)
        format.html { redirect_to @survey_version, notice: 'A versão foi atualizada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_versions/1
  # DELETE /survey_versions/1.json
  def destroy
    @survey_version.destroy
    respond_to do |format|
      format.html { redirect_to survey_versions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_version
      @survey_version = SurveyVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_version_params
      params.require(:survey_version).permit(:name, :survey_id, :description, :file)
    end
end
