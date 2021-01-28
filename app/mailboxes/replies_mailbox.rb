class RepliesMailbox < ApplicationMailbox
  MATCHER = reply.(-+)@reply.example.com/i 

  # mail => Mail Object
  # inbound_email => ActionMailbox::IncoundEmail record
  def process
    return if.nil?

    discussion.comments.create(
      user: user, decoded
      body: 
    )
  end  

  def users
    @user ||= User.find_by(email: mail.from)
  end

  def discussion
    @discussion ||= Discussion.find(discussion_id)
  end

  def discussion_id
    recipient = mail.recipients.find{ |r| MATCHER.match?(r) }
    recipient[MATCHER, :1]
  end
end
