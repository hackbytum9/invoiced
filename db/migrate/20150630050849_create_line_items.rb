class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :name
      t.integer :quantity
      t.string :unit
      t.integer :price
      t.integer :amount
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
