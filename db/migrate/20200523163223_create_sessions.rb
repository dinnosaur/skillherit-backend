class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :track_id
      t.date :date
      t.integer :distraction

      t.timestamps
    end
  end
end
