class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :customer_name
      t.string :massage_type
      t.string :date
      t.string :city
      t.references :user, null: false, foreign_key: true
      t.references :massage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
