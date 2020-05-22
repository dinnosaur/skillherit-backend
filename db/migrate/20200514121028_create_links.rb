class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.integer :skill_id
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
