require 'spec_helper'

describe SurveysController do
  render_views

  context "GET 'new'" do
    it "assigns the survey instance variable" do
      get :new
      assigns(:survey).should_not be_nil
    end

    it "responds with a new page" do
      get :new
      response.should be_ok
      response.should render_template('new')
    end
  end

  context "POST 'create'" do
    let(:survey) { FactoryGirl.attributes_for(:survey_with_questions) }

    context "when save is successful" do
      it "assigns the survey instance variable" do
        post :create, :survey => survey
        assigns(:survey).should_not be_nil
      end

      it "creates a survey" do
        expect { post :create, :survey => survey }.to change { Survey.count }.by(1)
      end
    end
  end

  context "GET 'index'" do
    it "assigns the surveys instance variable" do
      get :index
      assigns(:surveys).should_not be_nil
    end

    it "responds with the index page" do
      get :index
      response.should be_ok
      response.should render_template(:index)
    end
  end

  context "DELETE 'destroy'" do
    let!(:survey) { FactoryGirl.create(:survey) }

    it "deletes a survey" do
      expect { delete :destroy, :id => survey.id }.to change { Survey.count }.by(-1)
      flash[:notice].should_not be_nil
    end

    it "redirects to the survey index page" do
      delete :destroy, :id => survey.id
      response.should redirect_to surveys_path
    end
  end
end
