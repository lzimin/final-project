# == Schema Information
#
# Table name: flow_comments
#
#  id         :integer          not null, primary key
#  flow_id    :integer
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FlowComment < ApplicationRecord
  
belongs_to :user
belongs_to :flow

validates :flow_id, presence: true
validates :body, presence: true
validates :user_id, presence: true

end
