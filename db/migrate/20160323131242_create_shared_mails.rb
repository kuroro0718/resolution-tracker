class CreateSharedMails < ActiveRecord::Migration
  def change
    create_table :shared_mails do |t|
      t.integer :goal_id
      t.string :mail_addr

      t.timestamps null: false
    end
  end
end
