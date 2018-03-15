class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :passanger_booking_id

      t.timestamps
    end
  end
end
