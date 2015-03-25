class AddBehafIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :behaf_id, :integer
  end
end
