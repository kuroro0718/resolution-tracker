class ChangeCompleteDateTypeInGoals < ActiveRecord::Migration
  def self.up
    change_column :goals, :complete_date, :text
  end
  
  def self.down
    change_column :goals, :complete_date, :date
  end
end
