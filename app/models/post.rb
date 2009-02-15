class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  acts_as_rss 
  
  acts_as_taggable_on :tags
  named_scope :by_join_date, :order => "created_at DESC"

  before_save :set_permalink
  
  after_save :send_email
  
  def full_link
    "#{self.id}-#{self.permalink}"
  end
  
  def set_permalink
    self.permalink = "#{self.title.to_slug}"
  end
  
  def send_email
    if published
      Notifier.deliver_post(self)
    end
  end
  
  def description
    #begin
    #  engine = Haml::Engine.new(body)
    #  engine.to_html
    #rescue
    body
    #end
    
  end

  def to_metaweblog
    {
      :dateCreated => created_at,
      :userid => 1,
      :postid => id,
      :description => body,
      :title => title,
      :link => "#{full_link}",
      :permaLink => "#{full_link}",
      :categories => ["General"],
      :date_created_gmt => created_at.getgm,
    }
  end
  
  
end
