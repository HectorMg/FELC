class CreateCopyrights < ActiveRecord::Migration
  def change
    create_table :copyrights do |t|
      t.text :concept
      t.boolean :active
      t.belongs_to :company_account, index: true, foreign_key: true
      t.float :amount

      t.timestamps null: false
    end
  end
end
