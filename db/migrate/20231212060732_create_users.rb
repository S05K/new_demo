class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_email
      t.integer :user_number
      t.string :password_digest

      t.timestamps
    end
  end
end