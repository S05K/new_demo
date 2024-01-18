class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :genre
      t.string :duration
      t.datetime :release_date

      t.timestamps
    end
  end
end
