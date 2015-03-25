class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :students, [:id, :created_at]

  end
end
