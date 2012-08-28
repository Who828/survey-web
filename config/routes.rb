SurveyWeb::Application.routes.draw do
  scope "(:locale)", :locale => /#{I18n.available_locales.join('|')}/ do

    match '/auth/:provider/callback', :to => 'sessions#create'
    match '/signout', :to => 'sessions#destroy', :as => 'signout'

    resources :surveys do
      resources :responses, :only => [:new, :create, :show]
      resources :single_line_questions, :only => [:show, :create, :update]
    end

    match '/surveys/build/:id', :to => "surveys#build", as: 'build_survey'

    root :to => 'surveys#index'
  end
end
