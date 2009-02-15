class Notifier < ActionMailer::Base

  def post(post)
    recipients Subscriber.all.map{ |s| s.email }
    from "tom@jackhq.com"
    subject "New Article: #{post.title}"
    @body[:post] = post
  end
  
  def comment(comment, email)
    recipients [email]
    from "tom@jackhq.com"
    subject "New Comment On: #{comment.post.title}"
    @body[:comment] = comment
    #@body[:post] = comment.post
  end

end
