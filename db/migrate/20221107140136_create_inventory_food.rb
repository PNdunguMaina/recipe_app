class CreateInventoryFood < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.references :inventory, foreign_key: { to_table: :inventories }, on_delete: :cascade
      t.references :food, foreign_key: { to_table: :foods }, on_delete: :cascade
      t.timestamps
    end
  end
end
