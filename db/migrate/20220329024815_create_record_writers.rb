class CreateRecordWriters < ActiveRecord::Migration[7.0]
  def change
    create_table :record_writers do |t|
      t.references :record, null: false, foreign_key: true
      t.references :writer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
