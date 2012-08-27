class SingleLineQuestionsController < ApplicationController
  def create
    slq = SingleLineQuestion.create(:content => "Untitled")
    render :json => {:id => slq.id}
  end

  def update
    slq = SingleLineQuestion.find_by_id(params[:id])
    slq.update_attributes(params[:single_line_question])
    render :json => slq
  end

  def show
    render :json => SingleLineQuestion.find_by_id(params[:id])
  end
end
