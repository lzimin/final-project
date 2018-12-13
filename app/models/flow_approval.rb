# == Schema Information
#
# Table name: flow_approvals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  flow_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FlowApproval < ApplicationRecord

belongs_to :user
belongs_to :flow  
  
end
