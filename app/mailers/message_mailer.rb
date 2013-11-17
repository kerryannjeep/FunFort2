class MessageMailer < ActionMailer::Base
  default from: "funfortdotco@gmail.com"

  def approval_email(message)
    @message = message
    mail(to: @message.child.parent.email, subject: "#{@message.child.first_name} sent a message, Please review")
  end


  def receive_approval_email(message)
    @message = message
    mail(to: @message.friend.parent.email, subject: "#{@message.friend.first_name} received a message, Please review")
  end
end
