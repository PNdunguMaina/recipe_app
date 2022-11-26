class CreateRecipeFood < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :recipe, foreign_key: { to_table: :recipes }, on_delete: :cascade
      t.references :food, foreign_key: { to_table: :foods }, on_delete: :cascade
      t.timestamps
    end
  end
end
