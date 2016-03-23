class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :comment
      t.boolean :is_shareable
      t.date :complete_date

      t.timestamps null: false
    end
  end
end
