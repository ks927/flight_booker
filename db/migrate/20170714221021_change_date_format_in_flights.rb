class ChangeDateFormatInFlights < ActiveRecord::Migration[5.0]
  def change
      change_column :flights, :date, :string
  end
end
