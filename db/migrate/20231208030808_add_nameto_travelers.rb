class AddNametoTravelers < ActiveRecord::Migration[7.0]
  def change
    add_column(:travelers, :name, :string)
  end
end
