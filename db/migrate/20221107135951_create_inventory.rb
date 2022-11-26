class CreateInventory < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.references :user, foreign_key: { to_table: :users }, on_delete: :cascade
      t.references :food, foreign_key: { to_table: :foods }, on_delete: :cascade
      t.timestamps
    end
  end
end
