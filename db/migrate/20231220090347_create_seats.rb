class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.integer :row
      t.integer :number
      t.references :show, null: false, foreign_key: true
      t.references :theatre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
