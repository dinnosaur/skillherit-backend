class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :motto, default: "write something interesting here"
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
