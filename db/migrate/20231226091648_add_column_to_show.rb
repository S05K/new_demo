class AddColumnToShow < ActiveRecord::Migration[7.1]
  def change
    add_column :shows, :price, :integer
  end
end
