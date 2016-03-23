class GoalsController < ApplicationController
  before_action :find_params, only: [:edit, :show, :update, :destroy]

  def index
    @goals = Goal.all
  end

  def new 
    @goal = Goal.new
  end

  def show
  end

  def edit
  end

  def create
    @goal = Goal.create(goal_params)

    if @goal.save
      redirect_to goals_path
    else
      render 'new'
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path, notice: "修改完成"
    else
      render 'edit'
    end
  end

  def destroy
    @goal.destroy
    
    redirect_to goals_path, notice: "己刪除目標"
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :comment, :is_shareable, :complete_date)
  end

  def find_params
    @goal = Goal.find(params[:id])
  end
end
