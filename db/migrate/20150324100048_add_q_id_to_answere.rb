class AddQIdToAnswere < ActiveRecord::Migration
  def change
    add_reference :answeres, :question, index: true, foreign_key: true
  end
end
