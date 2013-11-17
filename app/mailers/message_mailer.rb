class MessageMailer < ActionMailer::Base
  default from: "funfortdotco@gmail.com"

  def approval_email(message)
    @message = message
    @approve_url  = root_url + "/approvals/#{@message.id}/confirm"
    @reject_url = root_url + "/approvals/#{@message.id}/reject"
    mail(to: @message.child.parent.email, subject: "#{@message.child.first_name} sent a message, Please review")
  end
end
