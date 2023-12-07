# == Schema Information
#
# Table name: trips
#
#  id              :integer          not null, primary key
#  destination     :string
#  travelers_count :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Trip < ApplicationRecord
end
