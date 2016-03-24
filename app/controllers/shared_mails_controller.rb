class SharedMailsController < ApplicationController
  def new
    @goal = Goal.find(params[:goal_id])
    @shared_mail = @goal.shared_mails.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @shared_mail = @goal.shared_mails.build(mail_params)

    if @shared_mail.save
      redirect_to goals_path()
    else
      render 'new'
    end
  end

  private

  def mail_params
    params.require(:shared_mail).permit(:mail_addr)
  end
end