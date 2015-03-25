class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.text :ans_mail_id

      t.timestamps null: false
    end
  end
end
