class UserMailer < ApplicationMailer
  def share_goal(goal, shared_mail)
    @goal = goal
    @owner = goal.owner
    @mail = shared_mail

    mail(to: @mail.mail_addr, subject: "[ResolutionTracker] #{@owner}分享目標") 
  end
end
