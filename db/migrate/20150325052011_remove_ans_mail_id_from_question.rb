class RemoveAnsMailIdFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :ans_mail_id, :text
  end
end
