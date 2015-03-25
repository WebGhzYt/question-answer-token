class RemoveSenderIdFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :sender_id, :integer
  end
end
