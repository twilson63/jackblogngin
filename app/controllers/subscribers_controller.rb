class SubscribersController < ApplicationController
  before_filter :login_required
  
  make_resourceful do
    actions :all
    
    response_for :create do |wants|
      wants.html { redirect_to subscribers_path }
    end

    response_for :update do |wants|
      wants.html { redirect_to subscribers_path }
    end
    
  end

  def current_objects
    @current_object = current_model.all(:order => "created_at DESC", :limit => 10)
  end
  
end
