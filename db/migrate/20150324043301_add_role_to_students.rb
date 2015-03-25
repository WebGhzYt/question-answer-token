class AddRoleToStudents < ActiveRecord::Migration
  def change
    add_column :students, :role, :boolean, default: false
  end
end
