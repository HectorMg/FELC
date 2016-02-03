class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.float :price
      t.float :bought_at
      t.references :company_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
