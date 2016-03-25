class UserMailer < ApplicationMailer
  default :from => "service@resolution-tracker.com"

  def share_goal(goal, shared_mail)
    @goal = goal
    @user = goal.user_id
    @mail = shared_mail

    mail(to: @mail.mail_addr, subject: @goal.title) 
  end
end
