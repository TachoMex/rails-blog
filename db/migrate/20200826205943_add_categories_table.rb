class AddCategoriesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, uniqueness: true
      t.timestamps
    end
  end
end
