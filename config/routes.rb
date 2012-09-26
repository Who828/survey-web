SurveyWeb::Application.routes.draw do
  scope "(:locale)", :locale => /#{I18n.available_locales.join('|')}/ do
    match '/auth/:provider/callback', :to => 'sessions#create'
    match '/auth/failure', :to => 'sessions#failure'
    match '/logout', :to => 'sessions#destroy', :as => 'logout'

    match '/surveys/build/:id', :to => 'surveys#build', :as => "surveys_build"

    resources :surveys do
      put 'update_shared_orgs', 'publish_to_users'
      get 'share', 'publish'
      resources :responses, :only => [:new, :create, :show, :index]
    end
    root :to => 'surveys#index'
  end

  namespace :api, :defaults => { :format => 'json' } do
    scope :module => :v1 do
      resources :questions, :except => [:edit, :new]
      resources :options, :except => [:edit, :new, :show]
      post 'questions/:id/image_upload' => 'questions#image_upload'
    end

    namespace :mobile, :defaults => { :format => 'json'} do
      scope :module => :v1 do
        resources :surveys, :only => [:index, :show]
      end
    end
  end
end
