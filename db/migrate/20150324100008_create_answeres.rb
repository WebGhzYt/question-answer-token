class CreateAnsweres < ActiveRecord::Migration
  def change
    create_table :answeres do |t|
      t.text :mail_id
      t.text :content

      t.timestamps null: false
    end
  end
end
