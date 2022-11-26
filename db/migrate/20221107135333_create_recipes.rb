class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.integer :cooking_time
      t.integer :preparation_time
      t.boolean :public
      t.integer :user_id, foreign_key: { to_table: :users }, on_delete: :cascade
      t.timestamps
    end
  end
end
