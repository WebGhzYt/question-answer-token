class AddAnsMailIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :ans_mail_id, :text
  end
end
