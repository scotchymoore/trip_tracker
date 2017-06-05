class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :date, null: false
      t.belongs_to :trip, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
