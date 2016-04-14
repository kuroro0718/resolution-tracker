class UserMailer < ApplicationMailer
  def share_goal(owner, goal, complete_date, email)
    @owner = owner
    @goal = goal    
    @complete_date = complete_date
    @email = email

    mail(to: @email, subject: "[ResolutionTracker] #{@owner}分享目標")   
  end
end
