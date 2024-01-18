class CreateMoviesTheatres < ActiveRecord::Migration[7.1]
  def change
    create_table :movies_theatres do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :theatre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
