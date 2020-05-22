class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.integer :user_id
      t.boolean :short_term
      t.string :title
      t.string :description
      t.string :methodology
      t.string :achievements
      t.integer :duration
      t.string :advice
      t.string :difficulty


      t.timestamps
    end
  end
end
