Mogi::Application.routes.draw do
  
  devise_for :users
  resources :repositories do
    resources :commits
  end
  
  mount ::GitHttp::App.new(GitHttp.config) => "/git"
  
  
  
end
