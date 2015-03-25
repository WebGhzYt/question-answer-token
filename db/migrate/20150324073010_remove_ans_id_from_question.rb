class RemoveAnsIdFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :ans_id, :text
  end
end
