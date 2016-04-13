class SharedMailsController < ApplicationController
  def new  
    @goal = Goal.find(params[:goal_id])
    @shared_mail = @goal.shared_mails.new
  end
end
