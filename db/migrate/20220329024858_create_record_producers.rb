class CreateRecordProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :record_producers do |t|
      t.references :record, null: false, foreign_key: true
      t.references :producer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
