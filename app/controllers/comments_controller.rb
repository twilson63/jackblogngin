class CommentsController < ApplicationController
  make_resourceful do
    actions :all
    belongs_to :post
    
    response_for :destroy do
      redirect_to post_path(@post)
    end
    
    response_for :update do
      redirect_to post_path(@post)
    end
    
  end

  def current_objects
    @current_object = current_model.all(:order => "created_at DESC")
  end
    
end
