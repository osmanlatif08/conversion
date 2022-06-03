Rails.application.routes.draw do
  devise_for :users
  resources :student_results do
    collection do
      post :import_file
    end
  end
  root to: "student_results#index"
end
