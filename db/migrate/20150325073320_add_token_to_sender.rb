class AddTokenToSender < ActiveRecord::Migration
  def change
    add_column :senders, :token, :text
  end
end
