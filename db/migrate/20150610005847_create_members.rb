class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string  :name,     null: false, unique: true
      t.integer :year,     null: false
      t.integer :group_id
      t.timestamps         null: false
    end
  end
end
