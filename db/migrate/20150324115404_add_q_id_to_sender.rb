class AddQIdToSender < ActiveRecord::Migration
  def change
    add_reference :senders, :question, index: true, foreign_key: true
  end
end
