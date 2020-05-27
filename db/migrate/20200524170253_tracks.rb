class Tracks < ActiveRecord::Migration[6.0]
  def change 
    create_table :tracks do |t|
    t.integer :user_id
    t.integer :skill_id
    t.float :time, default: 0
    t.integer :distraction
    t.string :feedback
    t.boolean :completed, default: false 

    t.timestamps
    end
  end
end
