class CreateMassages < ActiveRecord::Migration[6.1]
  def change
    create_table :massages do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :duration

      t.timestamps
    end
  end
end
