class CreateTopicSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_skills do |t|
      t.integer :topic_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
