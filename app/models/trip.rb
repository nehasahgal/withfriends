# == Schema Information
#
# Table name: trips
#
#  id              :integer          not null, primary key
#  cities          :string
#  destination     :string
#  details         :string
#  end_date        :datetime
#  start_date      :datetime
#  travelers_count :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class Trip < ApplicationRecord
end
