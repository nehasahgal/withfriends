# == Schema Information
#
# Table name: travelers
#
#  id                    :integer          not null, primary key
#  arrival_flight_time   :datetime
#  comments              :string
#  departure_flight_time :string
#  name                  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  trip_id               :integer
#  user_id               :integer
#
class Traveler < ApplicationRecord
end
