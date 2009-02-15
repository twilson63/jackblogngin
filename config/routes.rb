ActionController::Routing::Routes.draw do |map|
  map.resources :posts do |posts|
    posts.resources :comments
  end

  map.resources :subscribers
end