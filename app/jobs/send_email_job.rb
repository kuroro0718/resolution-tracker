class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(h)
    t = JSON.load(h)
    t['email'].each_value {|value| 
      UserMailer.share_goal(t['owner'], t['goal'], t['complete_date'], value).deliver} 
  end
end
