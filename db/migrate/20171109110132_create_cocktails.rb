class CreateCocktails < ActiveRecord::Migration[5.1]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.integer :complexity
      t.integer :rating
      t.string :description
      t.string :glass

      t.timestamps
    end
  end
end
