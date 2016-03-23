class GoalsController < ApplicationController
  def index
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
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :comment, :is_shareable, :complete_date)
  end
end
