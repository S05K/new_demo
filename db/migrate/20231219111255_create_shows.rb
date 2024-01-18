class CreateShows < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.references :theatre, null: false, foreign_key: true
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
