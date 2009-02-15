class Tag < ActiveRecord::Base
  
  def to_metaweblog
    {
      :categoryId => id,
      :parentId => "",
      :description => name,
      :categoryName => name,
      :htmlUrl => "http://blog.jackhq.com/posts?tag=#{id}",
      :rssUrl => "http://blog.jackhq.com/posts.rss?tag=#{id}"
    }
  end
  
end