class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :sku
      t.string :name
      t.string :category
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
