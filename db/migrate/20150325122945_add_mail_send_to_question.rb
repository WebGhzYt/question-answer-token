class AddMailSendToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :mail_send, :boolean, default: false
  end
end
