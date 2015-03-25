class AddAnsIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :ans_id, :text
  end
end
