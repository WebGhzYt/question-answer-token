class AddSenderIdToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :sender, index: true, foreign_key: true
  end
end
