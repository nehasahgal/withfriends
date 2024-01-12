# == Schema Information
#
# Table name: friendrequests
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class Friendrequest < ApplicationRecord
end
