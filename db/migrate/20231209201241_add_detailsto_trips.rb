class AddDetailstoTrips < ActiveRecord::Migration[7.0]
  def change
      add_column(:trips, :cities, :string)
      add_column(:trips, :start_date, :datetime)
      add_column(:trips, :end_date, :datetime)
      add_column(:trips, :details, :string)
  end
end
