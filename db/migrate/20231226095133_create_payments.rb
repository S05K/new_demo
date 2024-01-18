class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true
      t.integer :total
      t.timestamps
    end
  end
end
