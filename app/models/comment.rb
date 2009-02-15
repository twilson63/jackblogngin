class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates_format_of :email,
                      :with =>  /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
                      :message => "must be a valid e-mail address"
  
  after_create :send_email
  
  
  def send_email
    self.post.comments.uniq.each do |c|
      Notifier.deliver_comment(self, c.email)
    end
    Notifier.deliver_comment(self, "tom@jackhq.com")
    
  end
  
  def description
    engine = Haml::Engine.new(body)
    engine.to_html
  end
    
end
