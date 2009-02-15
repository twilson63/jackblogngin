class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  make_resourceful do
    actions :all

    before :show do
      @page_title = @post.title
    end
    
    response_for :index do |wants|
      wants.html { render :action => "index" }
      wants.rss { render :rss => Post.all.to_rss(:link => lambda { |p| post_url(:id => p.full_link) }) }
    end
    

  end


  def current_objects
    if params[:tag]
      @current_object = current_model.tagged_with(params[:tag], :on => :tags)
    else
      if logged_in?
        @current_object = current_model.all(:order => "created_at DESC", :limit => 3)
      else
        @current_object = current_model.find_all_by_published(true, :order => "created_at DESC")
      end
    end
  end
  
  
end
