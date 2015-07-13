class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.text :address
      t.string :tel
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
