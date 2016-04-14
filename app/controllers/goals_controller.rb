class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_params, only: [:edit, :update, :destroy, :complete, :notify_friend]

  def index
    @goals = Goal.all.order("created_at DESC")
  end

  def new 
    @goal = Goal.new
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
  end

  def create
    @goal = current_user.goals.create(goal_params)

    if @goal.save
      flash[:notice] = "新增目標完成"
      redirect_to goals_path 
    else
      render 'new'
    end
  end

  def update
    if @goal.update(goal_params)      
      flash[:notice] = "修改目標完成"
      redirect_to goal_path 
    else
      render 'edit'
    end
  end

  def destroy
    @goal.destroy

    flash[:warning] = "己刪除目標"
    redirect_to goals_path 
  end 

  def complete
    @goal.update_attribute(:completed_at, Time.now)
    redirect_to goals_path
  end

  def notify_friend   
    mail_list = {}
    count = 0
    for email in @goal.shared_mails
      mail_list[count.to_s] = email.mail_addr
      count+=1
    end

    h = JSON.generate({ 'owner' => @goal.owner.name,
                        'goal' => @goal.title,
                        'complete_date' => @goal.complete_date,
                        'email' => mail_list })

    SendEmailJob.perform_now(h)
    redirect_to goals_path
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :comment, :is_shareable, 
      :complete_date, 
      shared_mails_attributes: [:id, :mail_addr, :_destroy])
  end

  def find_params
    @goal = current_user.goals.find(params[:id])
  end
end
