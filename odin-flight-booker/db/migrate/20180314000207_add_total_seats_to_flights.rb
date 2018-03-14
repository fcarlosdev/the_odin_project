class AddTotalSeatsToFlights < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :total_seats, :integer, :default => 0
  end
end
