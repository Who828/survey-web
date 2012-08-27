class SurveysController < ApplicationController

  def index
    @surveys = Survey.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(:name => 'untitled', :expiry_date => 7.days.from_now, :description => '')

    if @survey.save
      redirect_to build_survey_path(@survey.id)
      flash[:notice] = t "flash.survey_created"
    else
      flash[:notice] = "ERROR!"
      redirect_to root_path
    end
  end

  def build
  end

  def destroy
    survey = Survey.find(params[:id])
    survey.destroy
    flash[:notice] = t "flash.survey_deleted"
    redirect_to(surveys_path)
  end
end
