class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.references :physician, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.datetime :appointment_date
      t.string :location
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
