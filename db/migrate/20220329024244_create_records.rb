class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :sale
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
